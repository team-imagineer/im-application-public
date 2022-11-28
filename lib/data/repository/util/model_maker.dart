import 'dart:math';

import 'package:im_application/domain/model/learning.dart';

import '../../../domain/model/book.dart';
import '../../../domain/model/problem_data.dart';
import '../../../domain/model/problem_review_data.dart';
import '../../../domain/model/solve/answer_content.dart';
import '../../../domain/model/solve/book_content.dart';
import '../../../domain/model/solve/passage.dart';
import '../../../domain/model/solve/problem.dart';
import '../../../domain/model/solve/problem_set.dart';
import '../../../domain/model/solve/question_content.dart';
import '../../../domain/model/solve_history.dart';

/// JSON to Model을 도와주는 클래스입니다.
class ModelMaker {
  /// Learning 모델을 만드는 메소드입니다.
  /// [data] JSON 데이터
  Learning makeLearning({required dynamic data, int? localElapsed}) {
    final status = Status.fromString(data["workflowState"]);

    return Learning(
      id: data["id"],
      status: status,
      score: data["score"],
      elapsed: localElapsed ?? data["elapsed"],
    );
  }

  /// Passage 모델을 만드는 메소드입니다.
  /// [data] JSON 데이터
  Passage makePassage({required dynamic data}) {
    return Passage(
      id: data["id"],
      imageUrl: data["properties"]["imageUrl"],
      sequenceNumber: data["sequence"],
      explanationUrl: data["properties"]["explanationUrl"],
    );
  }

  /// Problem 모델을 만드는 메소드입니다.
  /// [data] JSON 데이터
  /// [sequence] 시퀀스 넘버. 특정이 필요한 경우에만 사용합니다.
  Problem makeProblem({required dynamic data, bool solvable = false}) {
    final categoryData = _getCategoryData(data["properties"]["category"]);
    final nameData = _getNameData(data["properties"]["name"]);
    final index = int.parse(nameData[2].replaceAll(RegExp(r'[^0-9]'), ''));

    return Problem(
      id: data["id"],
      sequenceNumber: data["sequence"] ?? index,
      correctAnswer: int.parse(data["properties"]["answer"]),
      indexNumber: index,
      question: QuestionContent(
          id: data["id"], imageUrl: data["properties"]["imageUrl"]),
      answer: solvable
          ? AnswerContent(
              id: data["id"],
              imageUrl: data["properties"]["explanationUrl"] ??
                  "https://dummyimage.com/500x1/fff/fff")
          : null,
      score: int.tryParse(data["properties"]["point"] ?? ""),
      solvable: solvable,
      category: categoryData.length > 2 ? categoryData[2] : null,
      lowCategory: categoryData.length > 3 ? categoryData[3] : null,
    );
  }

  /// ProblemData 모델을 만드는 메소드입니다.
  /// [data] JSON 데이터
  ProblemData makeProblemData({required dynamic data}) {
    final nameData = _getNameData(data["properties"]["name"]);
    final categoryData = _getCategoryData(data["properties"]["category"]);

    return ProblemData(
      id: data["id"],
      name: nameData.join(" "),
      problem: makeProblem(data: data),
      bookTitle: nameData[0],
      subject: nameData[1],
      category: categoryData.length > 2 ? categoryData[2] : null,
      lowCategory: categoryData.length > 3 ? categoryData[3] : null,
      wrongRate: 0,
    );
  }

  /// ProblemReviewData 모델을 만드는 메소드입니다.
  /// [data] JSON 데이터
  ProblemReviewData makeProblemReviewData({required dynamic data}) {
    final interactions = List.from(data["interactions"]).reversed;

    return ProblemReviewData(
      problemData: makeProblemData(data: data),
      corrections: List.from(
        interactions.map((e) => e["isCorrect"]),
      ),
      histories: List.from(
        interactions.map(
          (e) => SolveHistory(
            solvedTime: DateTime.parse(e["updatedAt"]),
            response: int.tryParse(e["response"]),
            learningId: e["sessionId"] ?? _getRandomString(20), // TODO
          ),
        ),
      ),
    );
  }

  /// Book 모델을 만드는 메소드입니다.
  /// [data] JSON 데이터
  Book makeBook({required dynamic data}) {
    final titleData = data["title"].split(" ");

    return Book(
      id: data["id"],
      title: data["title"],
      subject: data["grade"] != null ? titleData[titleData.length - 1] : "워크북",
      type: data["grade"] != null ? BookType.book : BookType.workbook,
      grade: data["grade"],
      year: data["year"],
      month: data["month"],
    );
  }

  /// BookContent 모델을 만드는 메소드입니다.
  /// [data] JSON 데이터
  /// [bookId] 책의 ID
  /// [learningId] 세션(학습)의 ID
  BookContent makeBookContent({
    required dynamic data,
    required String learningId,
    String? bookId,
  }) {
    // 문제 세트 ID - 지문
    Map<String, Passage?> passages = {};

    // 문제 세트 ID - 문제들
    Map<String, List<Problem>> problems = {};

    // 부모 ID - 자식 ID
    Map<String, String> parentBridge = {};

    // 북마크
    List<String> bookmarks = [];

    for (final content in data) {
      // 지문일 때
      if (content["type"] == "passage") {
        // 부모가 없을 때 => 최상위 지문
        if (content["parent"] == null) {
          // 지문 등록
          passages[content["id"]] = makePassage(data: content);
          problems[content["id"]] = [];
        }

        // 부모가 있을 때 => 중간 지문
        else {
          // 부모 관계 및 중간 지문(풀 수 없는 문제) 등록
          parentBridge[content["id"]] = content["parent"];
          problems[content["parent"]]!.add(
            makeProblem(data: content, solvable: false),
          );
        }
      }

      // 문제일 때
      else {
        String parentId = "";

        // 저장된 최상위 부모 정보가 있을 때
        if (problems.containsKey(content["parent"])) {
          parentId = content["parent"];
        }

        // 저장된 최상위가 아닌 부모 정보가 있을 때
        else if (parentBridge.containsKey(content["parent"])) {
          parentId = parentBridge[content["parent"]]!;
        }

        // 저장된 부모가 없을 때 => 지문 없는 문제
        else {
          parentId = content["id"];
          problems[content["id"]] = [];
          passages[content["id"]] = null;
        }

        // 문제 정보 저장
        problems[parentId]!.add(makeProblem(data: content, solvable: true));

        // 북마크 기록
        if (content["isBookmarked"] != null && content["isBookmarked"]) {
          bookmarks.add(content["id"]);
        }
      }
    }

    // 저장된 정보를 ProblemSet으로 변환
    List<ProblemSet> problemSets = [];
    for (String parent in passages.keys) {
      final sequenceNumber = passages[parent] != null
          ? passages[parent]!.sequenceNumber
          : problems[parent]![0].sequenceNumber;

      problems[parent]!.sort(_problemSortFunction);
      problemSets.add(
        ProblemSet(
          id: parent,
          sequenceNumber: sequenceNumber,
          problems: problems[parent]!,
          passage: passages[parent],
        ),
      );
    }

    // 시퀀스 넘버에 맞춰서 문제 세트 정렬
    problemSets.sort(_problemSortFunction);

    // 결과 리턴
    return BookContent(
      id: bookId ?? "review",
      learningId: learningId,
      problemSets: problemSets,
      bookmarks: bookmarks,
    );
  }

  int _problemSortFunction(dynamic a, dynamic b) {
    if (a.sequenceNumber > b.sequenceNumber) {
      return 1;
    } else if (a.sequenceNumber < b.sequenceNumber) {
      return -1;
    }
    return 0;
  }

  String _getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  List<String> _getCategoryData(List? data) {
    if (data == null || data.isEmpty) {
      return [];
    }

    final firstData = data[0].split(" > ");

    if (firstData.length > 3) {
      return firstData;
    } else if (data.length > 1) {
      return data[1].split(" > ");
    }

    return [];
  }

  List<String> _getNameData(String? data) {
    final listData = (data ?? "").split(">");
    List<String> result = [];

    for (final text in listData) {
      result.add(text.split("_")[0]);
    }

    return result;
  }
}

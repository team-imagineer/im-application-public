import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:im_application/data/source/database_helper.dart';
import 'package:im_application/domain/model/problem_review_data.dart';
import 'package:im_application/presentation/review/review_detail_state.dart';
import 'package:scribble/scribble.dart';

class ReviewDetailViewModel extends ChangeNotifier {
  final DatabaseHelper db;

  bool isInitialized = false;
  ProblemReviewData? problemReviewData;
  ScribbleNotifier scribbleNotifier = ScribbleNotifier(widths: [0]);
  ReviewDetailState _state = ReviewDetailState(index: 0);

  ReviewDetailState get state => _state;

  ReviewDetailViewModel(this.db);

  void init(BuildContext context, ProblemReviewData problemReviewData) {
    if (!isInitialized || problemReviewData != this.problemReviewData) {
      this.problemReviewData = problemReviewData;
      _state = ReviewDetailState(index: 0);
      isInitialized = true;
      fetch();
    }
  }

  Future<void> fetch() async {
    final result = await db.getSolveRecordWithoutBook(
      learningId: problemReviewData!.histories[_state.index].learningId,
      problemId: problemReviewData!.problemData.problem.id,
    );
    Map<String, dynamic> value = {
      "lines": [],
    };

    if (result.isNotEmpty && result[0].scribbleData != null) {
      value = jsonDecode(result[0].scribbleData!);
    }

    scribbleNotifier.setSketch(
      sketch: Sketch.fromJson(value),
    );
    notifyListeners();
  }

  void chooseLearning(int index) {
    _state = _state.copyWith(index: index);
    fetch();
  }
}

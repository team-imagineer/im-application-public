import 'package:im_application/domain/model/solve/passage_record.dart';
import 'package:im_application/domain/model/solve/solve_record.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String solveTable = "solve";
  static const String passageTable = "passage";
  static const String statusTable = "status";
  Database db;

  DatabaseHelper(this.db);

  Future<List<SolveRecord>> getSolveRecord({
    required String bookId,
    required String learningId,
    required String problemId,
  }) async {
    final List<Map<String, dynamic>> maps = await db.query(solveTable,
        where: "bookId = ? and learningId = ? and problemId = ?",
        whereArgs: [bookId, learningId, problemId]);

    return List.generate(
      maps.length,
      (index) => SolveRecord(
        id: maps[index]["id"],
        bookId: maps[index]["bookId"],
        learningId: maps[index]["learningId"],
        problemId: maps[index]["problemId"],
        answer: maps[index]["answer"],
        scribbleData: maps[index]["scribbleData"],
      ),
    );
  }

  Future<List<SolveRecord>> getSolveRecordWithoutBook({
    required String learningId,
    required String problemId,
  }) async {
    final List<Map<String, dynamic>> maps = await db.query(solveTable,
        where: "learningId = ? and problemId = ?",
        whereArgs: [learningId, problemId]);

    return List.generate(
      maps.length,
      (index) => SolveRecord(
        id: maps[index]["id"],
        bookId: maps[index]["bookId"],
        learningId: maps[index]["learningId"],
        problemId: maps[index]["problemId"],
        answer: maps[index]["answer"],
        scribbleData: maps[index]["scribbleData"],
      ),
    );
  }

  Future<void> addSolveRecord(SolveRecord record) async {
    String? scribble = record.scribbleData;

    if (scribble == "null") {
      scribble = null;
    }

    await db.rawInsert(
      "INSERT INTO $solveTable(bookId, learningId, problemId, answer, scribbleData) VALUES(?, ?, ?, ?, ?)",
      [
        record.bookId,
        record.learningId,
        record.problemId,
        record.answer,
        scribble,
      ],
    );
  }

  Future<void> updateSolveRecord(SolveRecord record) async {
    String? scribble = record.scribbleData;

    if (scribble == "null") {
      scribble = null;
    }

    await db.rawUpdate(
      "UPDATE $solveTable SET answer = ?, scribbleData = ? WHERE bookId = ? and learningId = ? and problemId = ?",
      [
        record.answer,
        scribble,
        record.bookId,
        record.learningId,
        record.problemId,
      ],
    );
  }

  Future<void> deleteSolveRecord(String bookId, String? learningId) async {
    if (learningId == null) {
      await db.rawDelete(
        "DELETE FROM $solveTable WHERE bookId = ?",
        [bookId],
      );
    } else {
      await db.rawDelete(
        "DELETE FROM $solveTable WHERE bookId = ? and learningId = ?",
        [bookId, learningId],
      );
    }
  }

  Future<List<PassageRecord>> getPassageRecord({
    required String bookId,
    required String learningId,
    required String passageId,
  }) async {
    final List<Map<String, dynamic>> maps = await db.query(passageTable,
        where: "bookId = ? and learningId = ? and passageId = ?",
        whereArgs: [bookId, learningId, passageId]);

    return List.generate(
      maps.length,
      (index) => PassageRecord(
        id: maps[index]["id"],
        bookId: maps[index]["bookId"],
        learningId: maps[index]["learningId"],
        passageId: maps[index]["passageId"],
        scribbleData: maps[index]["scribbleData"],
        time: maps[index]["time"],
      ),
    );
  }

  Future<void> addPassageRecord(PassageRecord record) async {
    String? scribble = record.scribbleData;

    if (scribble == "null") {
      scribble = null;
    }

    await db.rawInsert(
      "INSERT INTO $passageTable(bookId, learningId, passageId, time, scribbleData) VALUES(?, ?, ?, ?, ?)",
      [
        record.bookId,
        record.learningId,
        record.passageId,
        record.time,
        scribble
      ],
    );
  }

  Future<void> updatePassageRecord(PassageRecord record) async {
    String? scribble = record.scribbleData;

    if (scribble == "null") {
      scribble = null;
    }

    await db.rawUpdate(
      "UPDATE $passageTable SET scribbleData = ?, time = ? WHERE bookId = ? and learningId = ? and passageId = ?",
      [
        scribble,
        record.time,
        record.bookId,
        record.learningId,
        record.passageId,
      ],
    );
  }

  Future<void> deletePassageRecord(String bookId, String? learningId) async {
    if (learningId == null) {
      await db.rawDelete(
        "DELETE FROM $passageTable WHERE bookId = ?",
        [bookId],
      );
    } else {
      await db.rawDelete(
        "DELETE FROM $passageTable WHERE bookId = ? and learningId = ?",
        [bookId, learningId],
      );
    }
  }

  Future<List<Map<String, dynamic>>> getStatusRecord({
    required String bookId,
    required String learningId,
  }) async {
    final List<Map<String, dynamic>> maps = await db.query(statusTable,
        where: "bookId = ? and learningId = ?",
        whereArgs: [bookId, learningId]);

    return List.generate(
        maps.length,
        (index) => {
              "bookId": maps[index]["bookId"],
              "learningId": maps[index]["learningId"],
              "duration": maps[index]["duration"],
              "index": maps[index]["indexNum"],
            });
  }

  Future<void> addStatusRecord(
      String bookId, String learningId, int duration, int index) async {
    await db.rawInsert(
      "INSERT INTO $statusTable(bookId, learningId, duration, indexNum) VALUES(?, ?, ?, ?)",
      [bookId, learningId, duration, index],
    );
  }

  Future<void> updateStatusRecord(
      String bookId, String learningId, int duration, int index) async {
    await db.rawUpdate(
      "UPDATE $statusTable SET duration = ?, indexNum = ? WHERE bookId = ? and learningId = ?",
      [duration, index, bookId, learningId],
    );
  }

  Future<void> deleteStatusRecord(String bookId, String? learningId) async {
    if (learningId == null) {
      await db.rawDelete(
        "DELETE FROM $statusTable WHERE bookId = ?",
        [bookId],
      );
    } else {
      await db.rawDelete(
        "DELETE FROM $statusTable WHERE bookId = ? and learningId = ?",
        [bookId, learningId],
      );
    }
  }

  Future<void> clear() async {
    await db.delete(solveTable);
    await db.delete(passageTable);
    await db.delete(statusTable);
  }
}

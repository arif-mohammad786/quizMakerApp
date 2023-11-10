import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // final String uid;

  DatabaseService();

  Future<void> addData(userData) async {
    FirebaseFirestore.instance
        .collection("users")
        .add(userData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return FirebaseFirestore.instance.collection("users").snapshots();
  }

  Future<void> addQuizData(Map<String, dynamic> quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((err) {
      print(err.toString());
    });
  }

  Future<void> deleteQuiz(String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .delete()
        .catchError((err) {
      print(err.toString());
    });
  }

  Future<void> addQuestionData(
      Map<String, dynamic> questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getQuizData() async {
    return FirebaseFirestore.instance.collection("Quiz").snapshots();
  }

  getQuizQuestions(String quizId) async {
    return FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .snapshots();
  }
}

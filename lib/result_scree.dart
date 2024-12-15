import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/summary/index.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosedAnswers, required this.onRestartQuiz});

  final List<String> choosedAnswers;

  final void Function() onRestartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'answer': choosedAnswers[i],
        'correct_answer': questions[i].answers[questions[i].answer],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    int totalQuestions = questions.length;
    int numOfCorrectAnsweredQuestions = summaryData
        .where((data) => data['answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $numOfCorrectAnsweredQuestions out of $totalQuestions questions correctly!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 6, 6, 6),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            QuestionsSummary(summaryData: summaryData),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                // set border color
                side: const BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255), width: 2),
              ),
              onPressed: () {
                onRestartQuiz();
              },
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.refresh, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

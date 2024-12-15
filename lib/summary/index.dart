import 'package:flutter/material.dart';
import 'package:quizapp/summary/identifiers.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionsSummary({required this.summaryData, super.key});

  @override
  Widget build(context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          spacing: 5,
          children: summaryData.map(
            (data) {
              String answer = data['answer'] as String;
              String correctAnswer = data['correct_answer'] as String;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  spacing: 20,
                  children: [
                    Identifiers(
                      questionIndex: (data['question_index'] as int),
                      isCorrectAnswer: data['answer'] == data['correct_answer'],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 6, 6, 6),
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Your answer:",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                answer,
                                style: TextStyle(
                                    color:
                                        data['answer'] == data['correct_answer']
                                            ? Colors.green
                                            : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Text(
                            "Correct answer: $correctAnswer",
                            style: TextStyle(fontStyle: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

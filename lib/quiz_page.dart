// lib/screens/quiz_page.dart

import 'package:flutter/material.dart';
import 'package:dynasty_academy/models.dart';

class QuizPage extends StatefulWidget {
  final Lesson lesson;
  const QuizPage({super.key, required this.lesson});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _idx = 0, _score = 0;

  void _answer(int i) {
    if (i == widget.lesson.quiz[_idx].answerIndex) _score++;
    setState(() => _idx++);
  }

  @override
  Widget build(BuildContext ctx) {
    final quiz = widget.lesson.quiz;
    if (_idx >= quiz.length) {
      return Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          title: const Text('Quiz Complete'),
          backgroundColor: const Color(0xFF1E1E1E),
        ),
        body: Center(
          child: Text(
            'Your score: $_score / ${quiz.length}',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    final q = quiz[_idx];
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text('Quiz (${_idx + 1}/${quiz.length})',
            style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(q.question,
                style: const TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 16),
            ...List.generate(q.options.length, (i) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD700),
                    foregroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  child: Text(q.options[i]),
                  onPressed: () => _answer(i),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// lib/screens/lesson_detail.dart

import 'package:flutter/material.dart';
import 'package:dynasty_academy/models.dart';
import 'package:dynasty_academy/screens/quiz_page.dart';

class LessonDetailPage extends StatelessWidget {
  final Lesson lesson;
  const LessonDetailPage({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(lesson.title,
            style: const TextStyle(color: Color(0xFFFFD700))),
        backgroundColor: const Color(0xFF1E1E1E),
        iconTheme: const IconThemeData(color: Color(0xFFFFD700)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _section(context, 'Key Insight', lesson.keyInsight),
          _section(context, 'Teaching', lesson.teaching),
          _section(context, 'Example', lesson.example),
          _section(context, 'Reflection', lesson.reflection),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(48)),
            icon: const Icon(Icons.quiz),
            label: const Text('Take Quiz'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => QuizPage(lesson: lesson)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(BuildContext ctx, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(ctx)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(body,
              style: Theme.of(ctx)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white70, height: 1.5)),
        ],
      ),
    );
  }
}

// lib/screens/lesson_list.dart

import 'package:flutter/material.dart';
import 'package:dynasty_academy/models.dart';
import 'package:dynasty_academy/screens/lesson_detail.dart';

class LessonListPage extends StatefulWidget {
  final Course course;
  const LessonListPage({super.key, required this.course});

  @override
  State<LessonListPage> createState() => _LessonListPageState();
}

class _LessonListPageState extends State<LessonListPage> {
  late Future<List<Lesson>> _lessons;

  @override
  void initState() {
    super.initState();
    _lessons = Lesson.loadFromAsset(widget.course.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(widget.course.title,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E1E1E),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Lesson>>(
        future: _lessons,
        builder: (ctx, snap) {
          if (snap.hasError) {
            return Center(
              child: Text(
                'Error loading lessons:\n${snap.error}',
                style: const TextStyle(color: Colors.redAccent),
                textAlign: TextAlign.center,
              ),
            );
          }
          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFFFD700)),
            );
          }
          final lessons = snap.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: lessons.length,
            itemBuilder: (_, i) {
              final l = lessons[i];
              return Card(
                color: const Color(0xFF1E1E1E),
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  title: Text(l.title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  trailing:
                      const Icon(Icons.check_circle, color: Color(0xFF00C851)),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => LessonDetailPage(lesson: l)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

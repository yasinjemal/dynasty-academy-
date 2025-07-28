// lib/screens/course_catalog.dart

import 'package:flutter/material.dart';
import 'package:dynasty_academy/models.dart';
import 'package:dynasty_academy/screens/lesson_list.dart';

class CourseCatalogPage extends StatefulWidget {
  const CourseCatalogPage({super.key});
  @override
  State<CourseCatalogPage> createState() => _CourseCatalogPageState();
}

class _CourseCatalogPageState extends State<CourseCatalogPage> {
  late Future<List<Course>> _courses;

  @override
  void initState() {
    super.initState();
    _courses = Course.loadAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF171717),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/logo_gold.png'),
        ),
        title: const Text(
          'Dynasty Academy',
          style: TextStyle(
            color: Color(0xFFFFD700),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: FutureBuilder<List<Course>>(
        future: _courses,
        builder: (ctx, snap) {
          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFFFD700)),
            );
          }
          final courses = snap.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: courses.length,
            itemBuilder: (_, i) {
              final c = courses[i];
              return Card(
                color: const Color(0xFF1E1E1E),
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  title: Text(
                    c.title,
                    style: const TextStyle(
                      color: Color(0xFFFFD700),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(c.subtitle,
                      style: const TextStyle(color: Colors.white70)),
                  trailing:
                      const Icon(Icons.chevron_right, color: Color(0xFFFFD700)),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LessonListPage(course: c),
                    ),
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

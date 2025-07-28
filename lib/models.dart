// lib/models.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Course {
  final String id;
  final String title;
  final String subtitle;

  /// JSON path to the course’s lesson file, e.g. "assets/courses/rock_to_diamond.json"
  final String path;

  const Course({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.path,
  });

  /// Loads `assets/courses/catalog.json`, which can be:
  ///  • A List of course‐objects
  ///  • A { "courses": [ … ] } wrapper
  /// Any entries missing a field will get an empty string.
  static Future<List<Course>> loadAll() async {
    final raw = await rootBundle.loadString('assets/courses/catalog.json');
    final data = json.decode(raw);

    // figure out where the array is
    List<dynamic> list;
    if (data is List) {
      list = data;
    } else if (data is Map<String, dynamic> && data['courses'] is List) {
      list = data['courses'] as List<dynamic>;
    } else {
      // nothing to load
      list = <dynamic>[];
    }

    return list.map((m) {
      if (m is Map<String, dynamic>) {
        return Course(
          id: m['id'] as String? ?? '',
          title: m['title'] as String? ?? '',
          subtitle: m['subtitle'] as String? ?? '',
          path: m['path'] as String? ?? '',
        );
      }
      // fallback empty course
      return const Course(id: '', title: '', subtitle: '', path: '');
    }).toList();
  }
}

class Lesson {
  final String id;
  final String title;
  final String keyInsight;
  final String teaching;
  final String example;
  final String reflection;
  final List<QuizQuestion> quiz;

  const Lesson({
    required this.id,
    required this.title,
    required this.keyInsight,
    required this.teaching,
    required this.example,
    required this.reflection,
    required this.quiz,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      keyInsight: json['keyInsight'] as String? ?? '',
      teaching: json['teaching'] as String? ?? '',
      example: json['example'] as String? ?? '',
      reflection: json['reflection'] as String? ?? '',
      quiz: (json['quiz'] as List<dynamic>? ?? []).map((q) {
        if (q is Map<String, dynamic>) {
          return QuizQuestion.fromJson(q);
        }
        return const QuizQuestion(question: '', options: [], answerIndex: 0);
      }).toList(),
    );
  }

  /// Loads your lesson‐file (e.g. "assets/courses/rock_to_diamond.json"), which can be:
  ///  • A List of lessons
  ///  • A { "lessons": [ … ] } wrapper
  ///  • A single object (we’ll wrap it into a List)
  static Future<List<Lesson>> loadFromAsset(String assetPath) async {
    final raw = await rootBundle.loadString(assetPath);
    final data = json.decode(raw);

    // figure out where the array is
    List<dynamic> list;
    if (data is List) {
      list = data;
    } else if (data is Map<String, dynamic> && data['lessons'] is List) {
      list = data['lessons'] as List<dynamic>;
    } else if (data is Map<String, dynamic>) {
      // treat the entire object as a single lesson
      list = [data];
    } else {
      list = <dynamic>[];
    }

    return list.map((j) {
      if (j is Map<String, dynamic>) {
        return Lesson.fromJson(j);
      }
      // fallback blank lesson
      return const Lesson(
        id: '',
        title: '',
        keyInsight: '',
        teaching: '',
        example: '',
        reflection: '',
        quiz: [],
      );
    }).toList();
  }
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int answerIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      question: json['question'] as String? ?? '',
      options: List<String>.from(json['options'] as List<dynamic>? ?? []),
      answerIndex: json['answerIndex'] as int? ?? 0,
    );
  }
}

// lib/Features/Tasks/models/task_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskModel {
  final String? id;
  final String title;
  final String description;
  final String priority;
  final String category;
  final TimeOfDay startTime;
  final DateTime startDate;
  final String reminder;
  final List<String> subTasks;
  final bool completed;
  final String? attachmentPath;

  const TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.category,
    required this.startTime,
    required this.startDate,
    required this.subTasks,
    this.reminder = '5 Minutes before',
    this.completed = false,
    this.attachmentPath,
  });

  // convert to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'priority': priority,
      'category': category,
      'startTime': '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}',
      'startDate': Timestamp.fromDate(startDate),
      'reminder': reminder,
      'subTasks': subTasks,
      'completed': completed,
      'attachmentPath': attachmentPath,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  // create from Firestore document
  factory TaskModel.fromMap(Map<String, dynamic> map, String id) {
    final timeParts = (map['startTime'] as String).split(':');
    return TaskModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      priority: map['priority'] ?? '',
      category: map['category'] ?? '',
      startTime: TimeOfDay(
        hour: int.parse(timeParts[0]),
        minute: int.parse(timeParts[1]),
      ),
      startDate: (map['startDate'] as Timestamp).toDate(),
      reminder: map['reminder'] ?? '5 Minutes before',
      subTasks: List<String>.from(map['subTasks'] ?? []),
      completed: map['completed'] ?? false,
      attachmentPath: map['attachmentPath'],
    );
  }
}
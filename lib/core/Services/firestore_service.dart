// lib/core/Services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  // create user document on signup
  Future<void> createUser({required String name, required String email}) async {
    if (_userId == null) return;
    await _db.collection('users').doc(_userId).set({
      'name': name,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // create a task
  Future<void> createTask({
    required String title,
    required String description,
    required String priority,
    required String category,
    required TimeOfDay startTime,
    required DateTime startDate,
    required String reminder,
    required List<String> subTasks,
  }) async {
    if (_userId == null) return;
    await _db.collection('tasks').add({
      'userId': _userId,
      'title': title,
      'description': description,
      'priority': priority,
      'category': category,
      'startTime':
          '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}',
      'startDate': Timestamp.fromDate(startDate),
      'reminder': reminder,
      'subTasks': subTasks,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // get all tasks for current user
  Stream<QuerySnapshot<Object?>> getTasks() {
    final userId = _userId;

    if (userId == null) {
      return const Stream.empty();
    }

    return _db
        .collection('tasks')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  // update task completion
  Future<void> toggleTaskComplete(String taskId, bool completed) async {
    await _db.collection('tasks').doc(taskId).update({'completed': completed});
  }

  // delete task
  Future<void> deleteTask(String taskId) async {
    await _db.collection('tasks').doc(taskId).delete();
  }
}

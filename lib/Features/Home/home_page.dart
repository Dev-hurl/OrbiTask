import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:orbitask/Features/Home/tasks_list.dart';
import 'package:orbitask/Features/Notification/notifications.dart';
import 'package:orbitask/Features/Proflie/account_page.dart';
import 'package:orbitask/Features/Tasks/screens/create_task1.dart';
import 'package:orbitask/Widgets/Custom%20Widgets/custom_nav_bar.dart';
import 'package:orbitask/core/Services/firestore_service.dart';
import 'empty_state.dart';

String resolveFirstName(String? providedName) {
  final trimmed = (providedName ?? '').trim();
  if (trimmed.isNotEmpty && trimmed != 'User') {
    return trimmed;
  }

  final authName = FirebaseAuth.instance.currentUser?.displayName?.trim();
  if (authName != null && authName.isNotEmpty) {
    return authName.split(' ').first;
  }

  return 'User';
}

String formatTaskTime(String? rawTime) {
  if (rawTime == null || rawTime.toString().trim().isEmpty) {
    return '';
  }

  final timeParts = rawTime.toString().split(':');
  if (timeParts.length < 2) {
    return rawTime.toString();
  }

  final hour = int.tryParse(timeParts[0]);
  final minute = int.tryParse(timeParts[1]);
  if (hour == null || minute == null) {
    return rawTime.toString();
  }

  final parsedTime = DateTime(2024, 1, 1, hour, minute);
  return DateFormat('hh:mm a').format(parsedTime);
}

class HomePage extends StatefulWidget {
  final String firstName;
  final List<Map<String, dynamic>>? initialTasks;

  const HomePage({super.key, this.firstName = 'User', this.initialTasks});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> tasks = [];
  late String currentFirstName;
  Stream<QuerySnapshot<Object?>>? _tasksStream;

  @override
  void initState() {
    super.initState();
    currentFirstName = resolveFirstName(widget.firstName);
    _tasksStream = FirestoreService().getTasks();
    _loadTasks();
  }

  void _loadTasks() {
    final service = FirestoreService();
    _tasksStream = service.getTasks();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.firstName != oldWidget.firstName) {
      setState(() {
        currentFirstName = resolveFirstName(widget.firstName);
      });
    }

    if (widget.initialTasks != null &&
        widget.initialTasks != oldWidget.initialTasks) {
      setState(() {
        tasks = List<Map<String, dynamic>>.from(widget.initialTasks!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        firstName: currentFirstName,
      ),
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
          ),
        ),
        title: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, $currentFirstName', style: textTheme.displayMedium),
            Text('welcome back', style: textTheme.bodyMedium),
          ],
        ),
        actions: [
          IconButton(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedCalendar03, color: colorScheme.secondary,),
            onPressed: () {
              // Handle calendar icon press
            },
          ),
          IconButton(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedNotification01),
            color: colorScheme.secondary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: _tasksStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              tasks.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            debugPrint('Task load error: ${snapshot.error}');
            return tasks.isEmpty
                ? EmptyState(firstName: currentFirstName)
                : TaskList(
                    tasks: tasks,
                    onDelete: (task) async {
                      final taskId = task['id'];
                      if (taskId == null || taskId.toString().isEmpty) return;

                      try {
                        await FirestoreService().deleteTask(taskId.toString());
                        if (!mounted) return;
                        setState(() {
                          tasks.removeWhere((item) => item['id'] == taskId);
                        });
                      } catch (e) {
                        debugPrint('Delete task failed: $e');
                      }
                    },
                  );
          }

          if (snapshot.hasData) {
            tasks =
                snapshot.data!.docs.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final startDate = data['startDate'];
                  final formattedDate = startDate is Timestamp
                      ? DateFormat('dd/MM/yyyy').format(startDate.toDate())
                      : '';

                  return {
                    'id': doc.id,
                    'title': data['title'] ?? 'Untitled task',
                    'time': formatTaskTime(data['startTime']?.toString()),
                    'date': formattedDate,
                    'priority': data['priority'] ?? 'Medium',
                    'category': data['category'] ?? 'Others',
                    'createdAt': data['createdAt'],
                  };
                }).toList()..sort((a, b) {
                  final aCreatedAt = a['createdAt'];
                  final bCreatedAt = b['createdAt'];

                  if (aCreatedAt is Timestamp && bCreatedAt is Timestamp) {
                    return bCreatedAt.compareTo(aCreatedAt);
                  }

                  return 0;
                });
          }

          return tasks.isEmpty
              ? EmptyState(firstName: currentFirstName)
              : TaskList(
                  tasks: tasks,
                  onDelete: (task) async {
                    final taskId = task['id'];
                    if (taskId == null || taskId.toString().isEmpty) return;

                    try {
                      await FirestoreService().deleteTask(taskId.toString());
                      if (!mounted) return;
                      setState(() {
                        tasks.removeWhere((item) => item['id'] == taskId);
                      });
                    } catch (e) {
                      debugPrint('Delete task failed: $e');
                    }
                  },
                );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 12),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateTask1(firstName: currentFirstName),
              ),
            );
          },
          backgroundColor: colorScheme.surfaceContainerHighest,
          child: Icon(Icons.add, color: colorScheme.secondary),
        ),
      ),
    );
  }
}

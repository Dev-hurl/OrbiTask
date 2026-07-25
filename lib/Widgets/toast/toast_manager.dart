
import 'package:flutter/material.dart';
import 'toast_model.dart';

class ToastManager extends ChangeNotifier {
  final List<ToastModel> _toasts = [];

  List<ToastModel> get toasts => _toasts;

  void show({required String text, required Widget icon}) {
    final toast = ToastModel(
      text: text,
      icon: icon,
      uniqueId: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    _toasts.add(toast);
    notifyListeners();

    // auto remove after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      remove(toast.uniqueId);
    });
  }

  void remove(String uniqueId) {
    _toasts.removeWhere((t) => t.uniqueId == uniqueId);
    notifyListeners();
  }
}
import 'dart:async';
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

    // keep notifying until UI picks it up
    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      notifyListeners();
      if (_toasts.contains(toast)) {
        timer.cancel();
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      remove(toast.uniqueId);
    });
  }

  void remove(String uniqueId) {
    _toasts.removeWhere((t) => t.uniqueId == uniqueId);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ToastModel {
  final String text;
  final String uniqueId;
  final Widget icon;

  const ToastModel({
    required this.text,
    required this.uniqueId,
    required this.icon,
  });
}
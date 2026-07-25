import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'toast_manager.dart';
import 'toast_widget.dart';

class ToastOverlay extends StatelessWidget {
  final Widget child;

  const ToastOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Consumer<ToastManager>(
            builder: (context, manager, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: manager.toasts
                    .map((toast) => ToastWidget(toast: toast))
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
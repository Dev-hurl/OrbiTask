// toast_service.dart — replaces ToastManager + ToastOverlay
import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_colors.dart';
import 'package:orbitask/constants/app_fonts.dart';

class ToastService {
  ToastService._();
  static final ToastService instance = ToastService._();

  final List<OverlayEntry> _entries = [];

  void show({
    required BuildContext context,
    required String text,
    required Widget icon,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => _ToastItem(
        text: text,
        icon: icon,
        index: _entries.indexOf(entry),
        onDismiss: () => _remove(entry),
      ),
    );

    _entries.add(entry);
    overlay.insert(entry);

    // rebuild all entries to update positions
    _rebuildAll();

    Future.delayed(const Duration(seconds: 3), () => _remove(entry));
  }

  void _remove(OverlayEntry entry) {
    if (_entries.contains(entry)) {
      _entries.remove(entry);
      entry.remove();
      _rebuildAll();
    }
  }

  void _rebuildAll() {
    for (final e in _entries) {
      e.markNeedsBuild();
    }
  }
}

class _ToastItem extends StatefulWidget {
  final String text;
  final Widget icon;
  final int index;
  final VoidCallback onDismiss;

  const _ToastItem({
    required this.text,
    required this.icon,
    required this.index,
    required this.onDismiss,
  });

  @override
  State<_ToastItem> createState() => _ToastItemState();
}

class _ToastItemState extends State<_ToastItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // stack position — each toast is 60px above the previous
    final bottomOffset = 40.0 + (widget.index * 60.0);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Positioned(
      bottom: bottomOffset,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.darkBgSecondary,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).cardColor.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        shape: BoxShape.circle,
                      ),
                      child: Center(child: widget.icon),
                    ),
                    SizedBox(width: 12),
                    Text(
                      widget.text,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: AppFonts.medium,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

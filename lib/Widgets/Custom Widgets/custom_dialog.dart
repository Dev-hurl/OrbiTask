// custom_dialog.dart
import 'package:flutter/material.dart';
import 'package:orbitask/constants/app_fonts.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String cancelText;
  final String confirmText;
  final VoidCallback onConfirm;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.onConfirm,
    this.cancelText = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // title
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: AppFonts.semibold,
              ),
            ),

            SizedBox(height: 12),

            // message
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall,
            ),

            SizedBox(height: 24),

            // buttons
            Row(
              children: [
                // cancel
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colorScheme.onPrimary,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                    ),
                    child: Text(cancelText),
                  ),
                ),

                SizedBox(width: 12),

                // confirm
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.error,
                      foregroundColor: colorScheme.onPrimary,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      confirmText,
                      style: TextStyle(color: colorScheme.surface),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

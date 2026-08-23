import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:orbitask/constants/app_fonts.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: colorScheme.secondary),
        title: Text(
          'Notifications',
          style: textTheme.bodyLarge?.copyWith(
            fontSize: AppFonts.subheading,
            fontWeight: AppFonts.semibold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: HugeIcon(icon: HugeIcons.strokeRoundedDelete02),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Row(
              spacing: 8,
              children: [
                ChoiceChip(
                  showCheckmark: false,
                  label: Text(
                    'All Notifications',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: AppFonts.semibold,
                    ),
                  ),
                  selected: true,
                  selectedColor: colorScheme.surfaceContainerHighest,
                  disabledColor: colorScheme.onSurfaceVariant,
                ),
                ChoiceChip(
                  showCheckmark: false,
                  label: Text(
                    'Promotions',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: AppFonts.semibold,
                    ),
                  ),
                  selected: false,
                  selectedColor: colorScheme.surfaceContainerHighest,
                  disabledColor: colorScheme.surfaceContainerHighest,
                ),
                ChoiceChip(
                  showCheckmark: false,
                  label: Text(
                    'Tasks',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: AppFonts.semibold,
                    ),
                  ),
                  selected: false,
                  selectedColor: colorScheme.surfaceContainerHighest,
                  disabledColor: colorScheme.surfaceContainerHighest,
                ),
              ],
            ),
            Slidable(
              startActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: colorScheme.secondary,
                    icon: Icons.message_rounded,
                    label: 'Mark as read',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: colorScheme.error,
                    icon: Icons.delete,
                    label: 'Delete Notification',
                  ),
                ],
              ),
              child: ListTile(
                leading: HugeIcon(icon: HugeIcons.strokeRoundedUser),
                title: Text('Notification', style: textTheme.bodyLarge),
                subtitle: Text(
                  'Check out this notification',
                  style: textTheme.bodySmall,
                ),
                //tileColor: Theme.of(context).cardColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/src/features/data_deletion/presentation/providers/delete_all_data_provider.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class DeleteAllListTile extends ConsumerWidget {
  const DeleteAllListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.delete_outlined),
      title: Text(
        l10n.deleteAllLabel,
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () async {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(
              l10n.deleteTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            content: Text(l10n.deleteContent),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  l10n.cancelLabel,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  unawaited(ref.read(deleteAllDataProvider.notifier).execute());
                },
                child: Text(
                  l10n.deleteLabel,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

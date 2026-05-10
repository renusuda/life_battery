import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:life_battery/src/l10n/app_localizations.dart';

class ReviewAppListTile extends StatelessWidget {
  const ReviewAppListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      leading: const Icon(Icons.favorite_outline),
      title: Text(
        l10n.reviewAppLabel,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () async {
        final inAppReview = InAppReview.instance;
        if (Platform.isIOS) {
          await inAppReview.openStoreListing(appStoreId: '6449723058');
        } else if (Platform.isAndroid) {
          await inAppReview.openStoreListing();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop_app_mvvm/presentation/resources/strings_manager.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.notifications),
    );
  }
}

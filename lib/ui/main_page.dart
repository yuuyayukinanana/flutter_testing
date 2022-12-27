import 'package:flutter/material.dart';
import 'package:flutter_testing/main.dart';
import 'package:flutter_testing/view_model/main_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainState = ref.watch(mainViewModelProvider);
    final mainViewModel = ref.read(mainViewModelProvider.notifier);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                  onSubmitted: (value) => mainViewModel.getProfile(value)),
              Text(mainState.profile?.id.toString() ?? "")
            ],
          ),
        ),
      ),
    );
  }
}

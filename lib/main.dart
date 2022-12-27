import 'package:flutter/material.dart';
import 'package:flutter_testing/state/dialog_state.dart';
import 'package:flutter_testing/ui/main_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: ref.watch(dialogKeyProvider),
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}



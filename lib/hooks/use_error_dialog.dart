import 'package:flutter/material.dart';
import 'package:flutter_testing/state/dialog_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void useErrorDialog(Ref ref, String message) async {
  await showDialog<void>(
    context: ref.read(dialogKeyProvider).currentContext!,
    builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15),
            Text(message),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    ),
  );
}

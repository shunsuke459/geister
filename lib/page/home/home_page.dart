import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geister/page/presenter/shared_preferences_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = useState('');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userName.value),
            ElevatedButton(
              onPressed: () async {
                final result = await ref
                    .read(sharedPreferencesPresenterProvider)
                    .getUserName();
                userName.value = result;
              },
              child: const Text('get'),
            ),
            ElevatedButton(
              onPressed: () async {
                final isSuccess = await ref
                    .read(sharedPreferencesPresenterProvider)
                    .deleteUserName();

                if (isSuccess) SignUpPageRoute().go(context);
              },
              child: const Text('delete'),
            ),
          ],
        ),
      ),
    );
  }
}

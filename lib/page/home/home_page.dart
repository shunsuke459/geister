import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geister/page/home/presenter/user_presenter.dart';
import 'package:geister/page/presenter/shared_preferences_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameState = useState('');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userNameState.value),
            ElevatedButton(
              onPressed: () async {
                final userName =
                    ref.read(userPresenterProvider).value?.userName ?? '';
                userNameState.value = userName;
              },
              child: const Text('get'),
            ),
            ElevatedButton(
              onPressed: () async {
                final isSuccess = await ref
                    .read(sharedPreferencesPresenterProvider)
                    .deleteUserId();

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

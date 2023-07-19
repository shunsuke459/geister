import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:geister/presenter/shared_preferences/shared_preferences_presenter.dart';
import 'package:geister/page/widget/custom_text_form_field.dart';
import 'package:geister/presenter/user/user_presenter.dart';
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
            ElevatedButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) => _KeyWordDialog(),
                );
              },
              child: const Text('create key word'),
            ),
          ],
        ),
      ),
    );
  }
}

class _KeyWordDialog extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final inputValue = useState<String?>(null);
    final isEmpty = inputValue.value != null && inputValue.value!.isEmpty;
    final isOverLength =
        inputValue.value != null && inputValue.value!.length > 10;
    final hasText = RegExp(r'\S').hasMatch(inputValue.value ?? '');
    final canSend = !isEmpty && !isOverLength && hasText;

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: () => focusNode.unfocus(),
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          title: const Text(
            'あいことばを入力してください',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'あいことば',
                  inputValue: inputValue,
                  canSend: canSend,
                ),
                const SizedBox(height: 16),
                Text(
                  inputValue.value != null && (isEmpty || !hasText)
                      ? 'あいことばを入力してください'
                      : isOverLength
                          ? '10文字以内で入力してください'
                          : '',
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () async {
                    final keyWord = inputValue.value ?? '';
                    if (!canSend) return;

                    final userId = ref.read(userPresenterProvider).value?.id;
                    if (userId == null) return;

                    final isSuccess = await ref
                        .read(gamePresenterProvider.notifier)
                        .createKeyWord(userId, keyWord);

                    if (isSuccess) SearchingPageRoute(keyWord).go(context);
                  },
                  child: const Center(
                    child: Text('作成'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

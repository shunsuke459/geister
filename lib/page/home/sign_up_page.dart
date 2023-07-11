import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geister/page/home/presenter/user_presenter.dart';
import 'package:geister/page/presenter/shared_preferences_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final inputValue = useState<String?>(null);
    final focusNode = useFocusNode();
    final isEmpty = inputValue.value != null && inputValue.value!.isEmpty;
    final isOverLength =
        inputValue.value != null && inputValue.value!.length > 10;
    final hasText = RegExp(r'\S').hasMatch(inputValue.value ?? '');
    final canSend = !isEmpty && !isOverLength && hasText;

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: () => focusNode.unfocus(),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'ユーザー名',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: inputValue.value == null || canSend
                              ? Colors.blueAccent
                              : Colors.red,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: inputValue.value == null || canSend
                              ? Colors.blueAccent
                              : Colors.red,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      inputValue.value = value;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  inputValue.value != null && (isEmpty || !hasText)
                      ? 'ユーザー名を入力してください'
                      : isOverLength
                          ? '10文字以内で入力してください'
                          : '',
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    final userName = controller.text;
                    if (!canSend) return;

                    final createdSuccess = await ref
                        .read(userPresenterProvider.notifier)
                        .createUser(userName);
                    if (!createdSuccess) {
                      // TODO: エラーメッセージ表示
                      return;
                    }

                    final userId =
                        ref.watch(userPresenterProvider).value?.id ?? '';
                    if (userId.isEmpty) {
                      // TODO: エラーメッセージを表示
                      return;
                    }

                    final isSuccess = await ref
                        .read(sharedPreferencesPresenterProvider)
                        .setUserId(userId);

                    if (isSuccess) {
                      HomePageRoute().go(context);
                      // TODO: ユーザー名を登録しましたメッセージを表示
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        canSend ? Colors.blueAccent : Colors.black12,
                  ),
                  child: const Text(
                    'ユーザー名を登録する',
                    style: TextStyle(color: Colors.white),
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

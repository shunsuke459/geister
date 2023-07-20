import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geister/presenter/shared_preferences/shared_preferences_presenter.dart';
import 'package:geister/page/widget/custom_text_form_field.dart';
import 'package:geister/presenter/user/user_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputValue = useState<String?>(null);
    final focusNode = useFocusNode();
    final isEmpty = inputValue.value != null && inputValue.value!.isEmpty;
    final isOverLength =
        inputValue.value != null && inputValue.value!.length > 10;
    final hasText = RegExp(r'\S').hasMatch(inputValue.value ?? '');
    final canSend = !isEmpty && !isOverLength && hasText;
    final isLoading = useState(false);

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: () => focusNode.unfocus(),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ユーザー名を登録してください',
                  style: textStyle(
                    AppTextStyle.titleBold,
                    AppThemeColor.grayMain.color,
                  ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: 200,
                  child: CustomTextFormField(
                    hintText: 'ユーザー名',
                    inputValue: inputValue,
                    canSend: canSend,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  inputValue.value != null && (isEmpty || !hasText)
                      ? 'ユーザー名を入力してください'
                      : isOverLength
                          ? '10文字以内で入力してください'
                          : '',
                  style: textStyle(
                    AppTextStyle.bodyRegular,
                    AppThemeColor.red.color,
                  ),
                ),
                const SizedBox(height: 16),
                isLoading.value
                    ? CircularProgressIndicator(
                        color: AppThemeColor.graySub.color,
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          final userName = inputValue.value ?? '';
                          if (!canSend) return;

                          isLoading.value = true;

                          final createdSuccess = await ref
                              .read(userPresenterProvider.notifier)
                              .createUser(userName);
                          if (!createdSuccess) {
                            // TODO: エラーメッセージ表示

                            isLoading.value = false;
                            return;
                          }

                          final userId =
                              ref.watch(userPresenterProvider).value?.id ?? '';
                          if (userId.isEmpty) {
                            // TODO: エラーメッセージを表示

                            isLoading.value = false;
                            return;
                          }

                          final isSuccess = await ref
                              .read(sharedPreferencesPresenterProvider)
                              .setText('userId', userId);

                          if (isSuccess) {
                            HomePageRoute().go(context);
                            // TODO: ユーザー名を登録しましたメッセージを表示
                          }

                          isLoading.value = false;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: canSend
                              ? AppThemeColor.accentBlue.color
                              : AppThemeColor.graySubtle.color,
                        ),
                        child: Text(
                          '登録する',
                          style: textStyle(
                            AppTextStyle.bodyRegular,
                            AppThemeColor.white.color,
                          ),
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

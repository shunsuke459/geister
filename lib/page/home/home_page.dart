import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/page/loading_page.dart';
import 'package:geister/page/widget/app_icon.dart';
import 'package:geister/presenter/game/game_board_presenter.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:geister/presenter/shared_preferences/shared_preferences_presenter.dart';
import 'package:geister/page/widget/custom_text_form_field.dart';
import 'package:geister/presenter/user/user_presenter.dart';
import 'package:geister/router/route.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyWordDeleted = useState(false);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final keyWord = await ref
            .read(sharedPreferencesPresenterProvider)
            .getText('keyWord');
        if (keyWord.isEmpty) {
          keyWordDeleted.value = true;
          return;
        }

        final userId = ref.watch(userPresenterProvider).value?.id;
        if (userId == null) return;

        await ref
            .read(gamePresenterProvider.notifier)
            .deleteKeyWord(userId, keyWord);
        keyWordDeleted.value = true;

        ref.read(gameBoardPresenterProvider.notifier).deleteBoard(userId);
      });

      return () {};
    }, []);

    if (!keyWordDeleted.value) return const LoadingPage();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 30,
              child: GestureDetector(
                onTap: () => const PrivacyPolicyPageRoute().push(context),
                child: SvgPicture.asset(
                  Assets.icons.padlock,
                  width: 30,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppIcon(),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    final initialValue = await ref
                        .read(sharedPreferencesPresenterProvider)
                        .getText('keyWord');

                    await showDialog(
                      context: context,
                      builder: (context) => _KeyWordDialog(
                          initialValue:
                              initialValue.isEmpty ? null : initialValue),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemeColor.stop.color,
                  ),
                  child: Text(
                    'ゲームをはじめる',
                    style: textStyle(
                      AppTextStyle.titleBold,
                      AppThemeColor.white.color,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    const RulePageRoute().push(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemeColor.accentBlue.color,
                  ),
                  child: Text(
                    '遊び方',
                    style: textStyle(
                      AppTextStyle.titleBold,
                      AppThemeColor.white.color,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    const RecordPageRoute().push(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemeColor.accentYellow.color,
                  ),
                  child: Text(
                    '対戦成績',
                    style: textStyle(
                      AppTextStyle.titleBold,
                      AppThemeColor.white.color,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _KeyWordDialog extends HookConsumerWidget {
  final String? initialValue;
  const _KeyWordDialog({
    Key? key,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final inputValue = useState<String?>(initialValue);
    final isEmpty = inputValue.value != null && inputValue.value!.isEmpty;
    final isOverLength =
        inputValue.value != null && inputValue.value!.length > 10;
    final hasText = RegExp(r'\S').hasMatch(inputValue.value ?? '');
    final isLoading = useState(false);
    final isError = useState(false);
    final errorMessage = useState('');
    final canSend = !isEmpty && !isOverLength && hasText && !isError.value;

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: () => focusNode.unfocus(),
        child: AlertDialog(
          backgroundColor: AppThemeColor.white.color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          title: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 32),
                child: Text(
                  'あいことばを入力してください',
                  textAlign: TextAlign.center,
                  style: textStyle(
                    AppTextStyle.titleBold,
                    AppThemeColor.grayMain.color,
                  ),
                ),
              ),
              Positioned(
                right: -20,
                top: -15,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close_rounded,
                    color: AppThemeColor.accentBlue.color,
                  ),
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: CustomTextFormField(
                    hintText: 'あいことば',
                    initialValue: initialValue,
                    inputValue: inputValue,
                    canSend: canSend,
                    onChanged: () {
                      errorMessage.value = '';
                      isError.value = false;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  inputValue.value != null && (isEmpty || !hasText)
                      ? 'あいことばを入力してください\n'
                      : isOverLength
                          ? '10文字以内で入力してください\n'
                          : isError.value
                              ? errorMessage.value
                              : '\n',
                  style: TextStyle(
                    color: AppThemeColor.red.color,
                  ),
                ),
                const SizedBox(height: 16),
                isLoading.value
                    ? CircularProgressIndicator(
                        color: AppThemeColor.graySub.color,
                      )
                    : SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            final keyWord = inputValue.value ?? '';
                            if (!canSend) return;

                            final userId =
                                ref.read(userPresenterProvider).value?.id;
                            if (userId == null) return;

                            isLoading.value = true;

                            ref
                                .read(sharedPreferencesPresenterProvider)
                                .setText('keyWord', keyWord);

                            try {
                              final isSuccess = await ref
                                  .read(gamePresenterProvider.notifier)
                                  .createKeyWord(userId, keyWord);

                              if (isSuccess) {
                                SearchingPageRoute(keyWord).push(context);
                              } else {
                                isError.value = true;
                                errorMessage.value =
                                    'すでに作成済みのあいことばです\n別のあいことばをお試しください';
                              }
                            } catch (_) {
                              isError.value = true;
                              errorMessage.value =
                                  'あいことばの作成に失敗しました\n別のあいことばをお試しください';
                            } finally {
                              isLoading.value = false;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: canSend
                                ? AppThemeColor.accentBlue.color
                                : AppThemeColor.graySubtle.color,
                          ),
                          child: Center(
                            child: Text(
                              '作成',
                              style: textStyle(
                                AppTextStyle.bodyRegular,
                                AppThemeColor.white.color,
                              ),
                            ),
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

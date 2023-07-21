import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/entity/piece_type_enum.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/presenter/game/game_board_presenter.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:geister/presenter/user/user_presenter.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InitialArrangementDialog extends HookConsumerWidget {
  const InitialArrangementDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final redPieceNum = useState<int>(4);
    final bluePieceNum = useState<int>(4);
    final redSelected = useState<bool>(true);
    final initialArrangement =
        ref.watch(gameBoardPresenterProvider).initialArrangement;
    final isLoading = useState(false);

    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          '初期配置を設定してください',
          textAlign: TextAlign.center,
          style: textStyle(
            AppTextStyle.headlineBold,
            AppThemeColor.black.color,
          ),
        ),
      ),
      content: SizedBox(
        width: width,
        height: 550,
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: 2 * 4,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                final row = index ~/ 4;
                final column = index % 4;

                return GestureDetector(
                  onTap: () {
                    if (initialArrangement[row][column] != PieceTypeEnum.empty)
                      return;
                    if (redSelected.value && redPieceNum.value == 0) return;
                    if (!redSelected.value && bluePieceNum.value == 0) return;

                    if (redSelected.value) {
                      ref.read(gameBoardPresenterProvider.notifier).setPiece(
                            row,
                            column,
                            PieceTypeEnum.redGeister,
                          );
                      redPieceNum.value--;
                    } else {
                      ref.read(gameBoardPresenterProvider.notifier).setPiece(
                            row,
                            column,
                            PieceTypeEnum.blueGeister,
                          );
                      bluePieceNum.value--;
                    }
                  },
                  onDoubleTap: () {
                    if (initialArrangement[row][column] == PieceTypeEnum.empty)
                      return;

                    if (initialArrangement[row][column] ==
                        PieceTypeEnum.redGeister) redPieceNum.value++;
                    if (initialArrangement[row][column] ==
                        PieceTypeEnum.blueGeister) bluePieceNum.value++;

                    ref
                        .read(gameBoardPresenterProvider.notifier)
                        .removePiece(row, column);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: AppThemeColor.black.color,
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          color: AppThemeColor.black.color,
                          width: 1.0,
                        ),
                        top: index >= 0 && index <= 3
                            ? BorderSide(
                                color: AppThemeColor.black.color,
                                width: 1.0,
                              )
                            : BorderSide.none,
                        left: index % 4 == 0
                            ? BorderSide(
                                color: AppThemeColor.black.color,
                                width: 1.0,
                              )
                            : BorderSide.none,
                      ),
                    ),
                    child: Center(
                      child: initialArrangement[row][column] ==
                              PieceTypeEnum.redGeister
                          ? SvgPicture.asset(
                              Assets.icons.allyRedIcon,
                              width: 30,
                            )
                          : initialArrangement[row][column] ==
                                  PieceTypeEnum.blueGeister
                              ? SvgPicture.asset(
                                  Assets.icons.allyBlueIcon,
                                  width: 30,
                                )
                              : Container(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '操作方法',
                  style: textStyle(
                    AppTextStyle.titleBold,
                    AppThemeColor.black.color,
                  ),
                ),
                Text(
                  '1. ガイスターをタップして色を選択',
                  style: textStyle(
                    AppTextStyle.bodyRegular,
                    AppThemeColor.black.color,
                  ),
                ),
                Text(
                  '2. マス目をタップしてガイスターを配置',
                  style: textStyle(
                    AppTextStyle.bodyRegular,
                    AppThemeColor.black.color,
                  ),
                ),
                Text(
                  '3. ダブルタップでガイスターをキャンセル',
                  style: textStyle(
                    AppTextStyle.bodyRegular,
                    AppThemeColor.black.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (redSelected.value) return;

                    redSelected.value = true;
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.allyRedIcon,
                        width: 80,
                        colorFilter: ColorFilter.mode(
                          redSelected.value
                              ? AppThemeColor.stop.color
                              : AppThemeColor.graySub.color,
                          BlendMode.srcATop,
                        ),
                      ),
                      Text(
                        redPieceNum.value.toString(),
                        style: textStyle(
                          AppTextStyle.headlineBold,
                          redSelected.value
                              ? AppThemeColor.stop.color
                              : AppThemeColor.graySub.color,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    if (!redSelected.value) return;

                    redSelected.value = false;
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.allyBlueIcon,
                        width: 80,
                        colorFilter: ColorFilter.mode(
                          redSelected.value
                              ? AppThemeColor.graySub.color
                              : AppThemeColor.accentBlue.color,
                          BlendMode.srcATop,
                        ),
                      ),
                      Text(
                        bluePieceNum.value.toString(),
                        style: textStyle(
                          AppTextStyle.headlineBold,
                          redSelected.value
                              ? AppThemeColor.graySub.color
                              : AppThemeColor.accentBlue.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            isLoading.value
                ? CircularProgressIndicator(
                    color: AppThemeColor.graySub.color,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      if (redPieceNum.value > 0 || bluePieceNum.value > 0)
                        return;

                      final userId = ref.watch(userPresenterProvider).value?.id;
                      if (userId == null) return;
                      final keyWord =
                          ref.watch(gamePresenterProvider).value?.keyWord;
                      if (keyWord == null) return;

                      isLoading.value = true;

                      await ref
                          .read(gameBoardPresenterProvider.notifier)
                          .settleInitialBoard(userId, keyWord);

                      context.pop();

                      isLoading.value = false;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          redPieceNum.value > 0 || bluePieceNum.value > 0
                              ? AppThemeColor.graySubtle.color
                              : AppThemeColor.accentBlue.color,
                    ),
                    child: Text(
                      '決定',
                      style: textStyle(
                        AppTextStyle.titleRegular,
                        AppThemeColor.white.color,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

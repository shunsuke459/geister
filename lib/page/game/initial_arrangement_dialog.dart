import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geister/entity/piece_type_enum.dart';
import 'package:geister/gen/assets.gen.dart';
import 'package:geister/presenter/game/game_board_presenter.dart';
import 'package:geister/presenter/game/game_presenter.dart';
import 'package:geister/presenter/user/user_presenter.dart';
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

    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      title: const Text(
        '初期配置を設定してください',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      content: SizedBox(
        width: width,
        height: 600,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.allyRedIcon,
                        width: 30,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        redPieceNum.value.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xffdf5656),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.allyBlueIcon,
                        width: 30,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        bluePieceNum.value.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xff3aabd2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                        right: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        bottom: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        top: index >= 0 && index <= 3
                            ? const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              )
                            : BorderSide.none,
                        left: index % 4 == 0
                            ? const BorderSide(
                                color: Colors.black,
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('タップでガイスターを配置'),
                Text('ダブルタップで配置したガイスターをキャンセル'),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (redSelected.value) return;

                    redSelected.value = true;
                  },
                  child: SvgPicture.asset(
                    Assets.icons.allyRedIcon,
                    width: 80,
                    colorFilter: ColorFilter.mode(
                      redSelected.value ? Colors.red : Colors.grey,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    if (!redSelected.value) return;

                    redSelected.value = false;
                  },
                  child: SvgPicture.asset(
                    Assets.icons.allyBlueIcon,
                    width: 80,
                    colorFilter: ColorFilter.mode(
                      redSelected.value ? Colors.grey : Colors.blue,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                if (redPieceNum.value > 0 || bluePieceNum.value > 0) return;

                final userId = ref.watch(userPresenterProvider).value?.id;
                if (userId == null) return;
                final keyWord = ref.watch(gamePresenterProvider).value?.keyWord;
                if (keyWord == null) return;

                await ref
                    .read(gameBoardPresenterProvider.notifier)
                    .settleInitialBoard(userId, keyWord);

                context.pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: redPieceNum.value > 0 || bluePieceNum.value > 0
                    ? Colors.grey
                    : Colors.blue,
              ),
              child: const Text(
                '決定',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

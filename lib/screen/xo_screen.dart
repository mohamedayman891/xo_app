import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:xo_app/utils/app_colors.dart';
import 'package:xo_app/utils/app_scaffold.dart';
import 'package:xo_app/utils/app_constant.dart';
import 'package:xo_app/utils/app_styles.dart';
import 'package:xo_app/utils/xo_button.dart';

class XoScreen extends StatefulWidget {
  const XoScreen({super.key});
  static String routeName = "xoScreen";
  @override
  State<XoScreen> createState() => _XoScreenState();
}

class _XoScreenState extends State<XoScreen> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  String getFormattedTime() {
    int seconds = timer.tick;
    int days = seconds ~/ (24 * 60 * 60);
    seconds = seconds - (days * 24 * 60 * 60);
    int hours = seconds ~/ (60 * 60);
    seconds = seconds - (hours * 60 * 60);
    int minitues = seconds ~/ (60);
    seconds = seconds - (minitues * 60);
    return "${minitues < 10 ? "0" : ""}$minitues:${seconds < 10 ? "0" : ""}$seconds";
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  List<String> board = ["", "", "", "", "", "", "", "", ""];
  int counter = 0;
  late String firstPlayer;
  late String secondPlayer;

  void resetBoard() {
    board = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    timer.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    setState(() {});
  }

  void onPlayerClick(int index) {
    if (board[index].isNotEmpty) return;
    board[index] = counter.isEven ? firstPlayer : secondPlayer;

    if (checkWinner(board[index])) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.green,
          content: Text(
            "Player ${counter.isEven ? "1" : "2"} Wins!",
            textAlign: TextAlign.center,
            style: AppStyles.white20Bold,
          ),
        ),
      );
      resetBoard();
      return;
    }
    if (!board.contains("")) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.green,
          content: Text(
            "Draw!",
            textAlign: TextAlign.center,
            style: AppStyles.white20Bold,
          ),
        ),
      );
      resetBoard();
      return;
    }
    counter++;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    //Row
    if (board[0] == symbol && board[1] == symbol && board[2] == symbol) {
      return true;
    }
    if (board[3] == symbol && board[4] == symbol && board[5] == symbol) {
      return true;
    }
    if (board[6] == symbol && board[7] == symbol && board[8] == symbol) {
      return true;
    }
    // for (int i = 0; i <= 6; i++) {
    //   if (board[i] == symbol &&
    //       board[i + 1] == symbol &&
    //       board[i + 2] == symbol) {
    //     return true;
    //   }
    // }
    //Column
    if (board[0] == symbol && board[3] == symbol && board[6] == symbol) {
      return true;
    }
    if (board[1] == symbol && board[4] == symbol && board[7] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[5] == symbol && board[8] == symbol) {
      return true;
    }
    // for (int i = 0; i <= 2; i++) {
    //   if (board[i] == symbol &&
    //       board[i + 3] == symbol &&
    //       board[i + 6] == symbol) {
    //     return true;
    //   }
    // }
    /////digonal
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    firstPlayer = ModalRoute.of(context)!.settings.arguments as String;
    secondPlayer = firstPlayer == AppConstant.o ? AppConstant.x : AppConstant.o;
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildTimer(), buildPlayerTurn(), buildBoard()],
        ),
      ),
    );
  }

  ///////////// Widgets ///////////////
  Container buildTimer() => Container(
    margin: EdgeInsets.only(top: 20, bottom: 32), //margin 16
    padding: EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(44),
    ),
    child: Text(
      getFormattedTime(),
      textAlign: TextAlign.center,
      style: AppStyles.black32SemiBold,
    ),
  );

  Container buildPlayerTurn() => Container(
    margin: EdgeInsets.only(bottom: 32),
    child: Text(
      "Player ${counter.isEven ? "1" : "2"}'s Turn",
      textAlign: TextAlign.center,
      style: AppStyles.black32SemiBold.copyWith(color: AppColors.white),
    ),
  );

  Expanded buildBoard() => Expanded(
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(44),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    XoButton(
                      symbol: board[0],
                      onClick: onPlayerClick,
                      index: 0,
                    ),
                    XoButton(
                      symbol: board[1],
                      onClick: onPlayerClick,
                      index: 1,
                    ),
                    XoButton(
                      symbol: board[2],
                      onClick: onPlayerClick,
                      index: 2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    XoButton(
                      symbol: board[3],
                      onClick: onPlayerClick,
                      index: 3,
                    ),
                    XoButton(
                      symbol: board[4],
                      onClick: onPlayerClick,
                      index: 4,
                    ),
                    XoButton(
                      symbol: board[5],
                      onClick: onPlayerClick,
                      index: 5,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    XoButton(
                      symbol: board[6],
                      onClick: onPlayerClick,
                      index: 6,
                    ),
                    XoButton(
                      symbol: board[7],
                      onClick: onPlayerClick,
                      index: 7,
                    ),
                    XoButton(
                      symbol: board[8],
                      onClick: onPlayerClick,
                      index: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Divider(
              color: AppColors.black,
              thickness: 1.2,
              indent: 13,
              endIndent: 13,
            ),
            Divider(
              color: AppColors.black,
              thickness: 1.2,
              indent: 13,
              endIndent: 13,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VerticalDivider(
              color: AppColors.black,
              thickness: 1.2,
              indent: 20,
              endIndent: 20,
            ),
            VerticalDivider(
              color: AppColors.black,
              thickness: 1.2,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ],
    ),
  );
}

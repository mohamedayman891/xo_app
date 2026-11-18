import 'package:material_ui/material_ui.dart';
import 'package:xo_app/utils/app_colors.dart';
import 'package:xo_app/utils/app_scaffold.dart';
import 'package:xo_app/utils/app_constant.dart';
import 'package:xo_app/screen/xo_screen.dart';
import 'package:xo_app/utils/app_styles.dart';

class XoSplash extends StatelessWidget {
  const XoSplash({super.key});
  static String routeName = "xoSplash";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppConstant.xoImage),
                  fit: BoxFit.contain,
                ),
              ),
              child: Center(
                child: Text("Tic-Tac-Toe", style: AppStyles.white40ExtraBold),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              spacing: 16,
              children: [
                const Spacer(),
                Text("Pick who goes first?", style: AppStyles.white24Normal),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          XoScreen.routeName,
                          arguments: AppConstant.x,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Image.asset(AppConstant.xButton),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          XoScreen.routeName,
                          arguments: AppConstant.o,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Image.asset(AppConstant.oButton),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

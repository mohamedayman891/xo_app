import 'package:material_ui/material_ui.dart';
import 'package:xo_app/utils/app_constant.dart';

class XoButton extends StatelessWidget {
  const XoButton({
    super.key,
    required this.symbol,
    required this.onClick,
    required this.index,
  });
  final String symbol;
  final Function onClick;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onClick(index);
        },
        child: symbol.isEmpty
            ? SizedBox(width: double.infinity, height: double.infinity)
            : Image.asset(
                symbol == AppConstant.x
                    ? AppConstant.xButton
                    : AppConstant.oButton,
              ),
      ),
    );
  }
}

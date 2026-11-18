import 'package:material_ui/material_ui.dart';
import 'package:xo_app/utils/app_colors.dart';

abstract final class AppStyles {
  static const white48Medium = TextStyle(
    fontSize: 48,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
  static const white24Normal = TextStyle(
    fontSize: 24,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );
  static const white20Bold = TextStyle(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static const blue32Medium = TextStyle(
    fontSize: 32,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w500,
  );
  static const black32SemiBold = TextStyle(
    fontSize: 32,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );
  static const white40ExtraBold = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    color: AppColors.white,
  );
}

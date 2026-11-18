import 'package:material_ui/material_ui.dart';
import 'package:xo_app/utils/app_colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.lightBlue, AppColors.darkBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(backgroundColor: AppColors.transparent, body: body),
    );
  }
}

import 'package:material_ui/material_ui.dart';
import 'package:xo_app/screen/xo_screen.dart';
import 'package:xo_app/screen/xo_splash.dart';


void main() {
  runApp(const XoApp());
}

class XoApp extends StatelessWidget {
  const XoApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        XoScreen.routeName: (context) => const XoScreen(),
        XoSplash.routeName: (context) => const XoSplash(),
      },
      initialRoute: XoSplash.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
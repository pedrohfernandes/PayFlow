import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'modules/insert_boleto/insert_boleto_page.dart';
import 'modules/barcode_scanner/barcode_scanner_page.dart';
import 'modules/splash/splash_page.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'shared/themes/themes.dart';
import '/shared/models/user_model.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //Define a orientação padrão do app; não permite que a tela gire conforme configurações do aparelho
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: "Pay Flow",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            ),
      },
    );
  }
}

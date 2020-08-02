import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:tms_mobile/controller/faturamento/faturamento-un-controller.dart';

import 'controller/agregado/agregado-controller.dart';
import 'controller/empresa/empresa-controller.dart';
import 'controller/faturamento/faturamento-cliente-controller.dart';
import 'controller/frota/frota-propria-controller.dart';
import 'controller/login/login-controller.dart';
import 'controller/terceiro/terceiro-controller.dart';
import 'pages/splash-screen.dart';

void main() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<TerceiroController>(TerceiroController());
  getIt.registerSingleton<AgregadoController>(AgregadoController());
  getIt.registerSingleton<EmpresaController>(EmpresaController());
  getIt.registerSingleton<FaturamentoClienteController>(
      FaturamentoClienteController());
  getIt.registerSingleton<FaturamentoUnController>(FaturamentoUnController());
  getIt.registerSingleton<FrotaPropriaController>(FrotaPropriaController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50:Color.fromRGBO(245, 134, 51, .1),
      100:Color.fromRGBO(245, 134, 51, .2),
      200:Color.fromRGBO(245, 134, 51, .3),
      300:Color.fromRGBO(245, 134, 51, .4),
      400:Color.fromRGBO(245, 134, 51, .5),
      500:Color.fromRGBO(245, 134, 51, .6),
      600:Color.fromRGBO(245, 134, 51, .7),
      700:Color.fromRGBO(245, 134, 51, .8),
      800:Color.fromRGBO(245, 134, 51, .9),
      900:Color.fromRGBO(245, 134, 51, 1),
    };

    return MaterialApp(
      title: 'TMS Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: MaterialColor(0xFFF58633, color), brightness: Brightness.light)
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      home: SplashScreen(),
    );
  }
}

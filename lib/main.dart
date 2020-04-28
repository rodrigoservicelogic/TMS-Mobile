import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';


import 'controller/agregado/agregado-controller.dart';
import 'controller/empresa/empresa-controller.dart';
import 'controller/faturamento/faturamento-cliente-controller.dart';
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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMS Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

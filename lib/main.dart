import 'package:flutter/material.dart';
import 'package:questoes_enem/routes/delegate/delegate.dart';
import 'package:questoes_enem/services/setup_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Questões do Enem enem.dev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: MyGoRouterDelegate.router,
    );
  }
}

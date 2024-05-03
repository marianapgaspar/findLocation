import 'package:flutter/material.dart';
import 'package:app/src/modules/home/page/home_page.dart';
import 'package:app/src/modules/history/page/history_page.dart';
import 'package:app/src/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home, // Define a rota inicial
      routes: {
        AppRoutes.home: (context) => HomePage(), // Rota para a página inicial
        AppRoutes.history: (context) => HistoryPage(), // Rota para a página de histórico
      },
    );
  }
}

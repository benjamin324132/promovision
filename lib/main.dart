import 'package:flutter/material.dart';
import 'package:promovision/controllers/MenuAppController.dart';
import 'package:promovision/screens/dashboard_screen.dart';
import 'package:promovision/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuAppController(),
        ),
      ],
      child: MaterialApp(
        title: 'Promovison',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: false
        ).copyWith(
          scaffoldBackgroundColor: bgColor,
          canvasColor: secondaryColor,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}

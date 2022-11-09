import 'package:flutter/material.dart';
import 'package:movies_app/core/service/services.dart';
import 'package:movies_app/movies/presentation/screens/main_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}



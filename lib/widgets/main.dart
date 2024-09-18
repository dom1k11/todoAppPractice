import 'package:flutter/material.dart';
import '../../screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.blue.shade200,
          elevation: 0.0,
          titleTextStyle: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.grey.shade50,
      ),
      home: const HomePage(),
      initialRoute: '/',
      routes: {
       // '/new_task': (context) => NewTaskPage(),
      },
    );
  }
}

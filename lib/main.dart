import 'package:flutter/material.dart';
import 'package:theme_mode_with_bloc/features/presentation/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Tutorial',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}

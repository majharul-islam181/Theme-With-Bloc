import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_mode_with_bloc/core/services/storage_services.dart';
import 'package:theme_mode_with_bloc/core/theme/bloc/theme_bloc.dart';
import 'package:theme_mode_with_bloc/core/theme/dark_mode.dart';
import 'package:theme_mode_with_bloc/core/theme/light_mode.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isDarkMode = false;
  toggle() {
    if (isDarkMode == true) {
      context.read<ThemeBloc>().add(ThemeChangeEvent(themeData: darktMode));
      isDarkMode = false;
      StorageServices().setBool('isDarkMode', isDarkMode);
    } else if (isDarkMode == false) {
      context.read<ThemeBloc>().add(ThemeChangeEvent(themeData: lightMode));
      isDarkMode = true;
      StorageServices().setBool('isDarkMode', isDarkMode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: toggle, icon: const Icon(Icons.dark_mode))
        ],
      ),
    );
  }
}

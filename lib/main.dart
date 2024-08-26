import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_mode_with_bloc/core/services/storage_services.dart';
import 'package:theme_mode_with_bloc/core/theme/bloc/theme_bloc.dart';
import 'package:theme_mode_with_bloc/core/theme/dark_mode.dart';
import 'package:theme_mode_with_bloc/core/theme/light_mode.dart';
import 'package:theme_mode_with_bloc/features/presentation/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isDarkMode =
      await StorageServices().getBool('isDarkMode') ?? false;
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeBloc())],
      child: MyApp(
        isDarkMode: isDarkMode,
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.isDarkMode});

  final bool isDarkMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is ThemeInitial) {
          if (widget.isDarkMode is ThemeInitial) {
            context
                .read<ThemeBloc>()
                .add(ThemeChangeEvent(themeData: lightMode));
          } else if (widget.isDarkMode == false) {
            context
                .read<ThemeBloc>()
                .add(ThemeChangeEvent(themeData: darktMode));
          }
        }

        if (state is ThemeSuccess) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Theme Tutorial',
            theme: state.themeData,
            darkTheme: darktMode,
            home: const HomeView(),
          );
        }
        return const SizedBox();
      },
    );
  }
}

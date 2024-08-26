part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {
  final ThemeData themeData;

  ThemeInitial({required this.themeData});
}

final class ThemeLoading extends ThemeState {}

final class ThemeSuccess extends ThemeState {
  final ThemeData themeData;

  ThemeSuccess({required this.themeData});
}

final class ThemeFailed extends ThemeState {
  final String message;

  ThemeFailed({required this.message});
}

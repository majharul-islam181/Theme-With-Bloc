import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_mode_with_bloc/core/theme/light_mode.dart';

part 'theme_state.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(themeData: lightMode)) {
    on<ThemeEvent>(_mapThemeEventToState);
    on<ThemeChangeEvent>(_mapThemeChangedEvent);
  }

  Future<void> _mapThemeEventToState(
      ThemeEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeLoading());
  }

  Future<void> _mapThemeChangedEvent(
      ThemeChangeEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeSuccess(themeData: event.themeData));
  }
}

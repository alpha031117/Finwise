import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vhack_finwise_app/data/users.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsPointDeductEvent>(settingsPointDeductEvent);
  }

  FutureOr<void> settingsPointDeductEvent(SettingsPointDeductEvent event, Emitter<SettingsState> emit) {
    final userPoints = UserDatabase.users[0].points;
  }
}

part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class SettingsPointDeductEvent extends SettingsEvent {
  final int points;

  const SettingsPointDeductEvent(this.points);

  @override
  List<Object> get props => [points];
}

final class SettingsInitialEvent extends SettingsEvent {}

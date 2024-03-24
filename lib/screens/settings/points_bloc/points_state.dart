part of 'points_bloc.dart';

sealed class PointsState extends Equatable {
  const PointsState();

  @override
  List<Object> get props => [];
}

final class PointsInitial extends PointsState {}

final class PointsInitializeSuccessfulState extends PointsState {
  final int points;

  const PointsInitializeSuccessfulState({required this.points});

  @override
  List<Object> get props => [points];
}

final class PointsInitializePointNotSuccessfulState extends PointsState {
  final String errorMessage;

  const PointsInitializePointNotSuccessfulState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class PointsAddPointsSuccessfulState extends PointsState {
  final String currentPoints;

  const PointsAddPointsSuccessfulState({required this.currentPoints});

  @override
  List<Object> get props => [currentPoints];
}

final class PointsAddPointsNotSuccessfulState extends PointsState {
  final String errorMessage;

  const PointsAddPointsNotSuccessfulState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class PointsMinusPointsSuccessfulState extends PointsState {
  final String currentPoints;

  const PointsMinusPointsSuccessfulState({required this.currentPoints});

  

  @override
  List<Object> get props => [currentPoints];
}

final class PointsMinusPointsNotSuccessfulState extends PointsState {
  final String errorMessage;

  const PointsMinusPointsNotSuccessfulState({required this.errorMessage});

  

  @override
  List<Object> get props => [errorMessage];
}

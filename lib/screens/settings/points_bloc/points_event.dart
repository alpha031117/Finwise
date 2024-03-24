part of 'points_bloc.dart';

sealed class PointsEvent extends Equatable {
  const PointsEvent();

  @override
  List<Object> get props => [];
}

final class PointsAddPointsEvent extends PointsEvent {
  final int points;

  const PointsAddPointsEvent(this.points);

  @override
  List<Object> get props => [points];
}

final class PointsMinusPointsEvent extends PointsEvent {
  final int points;

  const PointsMinusPointsEvent({required this.points});

 
  @override
  List<Object> get props => [points];
}

final class PointsInitializePointsEvent extends PointsEvent {
  const PointsInitializePointsEvent();
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vhack_finwise_app/data/users.dart';

part 'points_event.dart';
part 'points_state.dart';

class PointsBloc extends Bloc<PointsEvent, PointsState> {
  PointsBloc() : super(PointsInitial()) {
    on<PointsInitializePointsEvent>(pointsInitializePointsEvent);
    on<PointsAddPointsEvent>(pointsAddPointsEvent);
    on<PointsMinusPointsEvent>(pointsMinusPointsEvent);
    
  }
  //take the points from userdatabase
  FutureOr<void> pointsInitializePointsEvent(
      PointsInitializePointsEvent event, Emitter<PointsState> emit) {
    try {
      final int points = UserDatabase.users[0].points;
      emit(PointsInitializeSuccessfulState(points: points));
    } on Exception catch (e) {
      emit(
        PointsInitializePointNotSuccessfulState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> pointsAddPointsEvent(
      PointsAddPointsEvent event, Emitter<PointsState> emit) {
    try {
      int points = UserDatabase.users[0].points;
      points = points + event.points;
      UserDatabase.users[0].points = points;
      emit(PointsAddPointsSuccessfulState(currentPoints: points.toString()));
    } on Exception catch (e) {
      emit(PointsAddPointsNotSuccessfulState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> pointsMinusPointsEvent(PointsMinusPointsEvent event, Emitter<PointsState> emit) {
        try {
      int points = UserDatabase.users[0].points;
      //if the event points is larger than the point in database, throw exception
      if (points < event.points) throw Exception('Insufficient points');
      points = points - event.points;
      UserDatabase.users[0].points = points;
      emit(PointsMinusPointsSuccessfulState(currentPoints: points.toString()));
    } on Exception catch (e) {
      emit(PointsMinusPointsNotSuccessfulState(errorMessage: e.toString()));
    }
  }
}

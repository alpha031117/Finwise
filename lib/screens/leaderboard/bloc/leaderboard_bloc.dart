import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vhack_finwise_app/data/users.dart';
import 'package:vhack_finwise_app/model/user.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() : super(LeaderboardInitialState()) {
    on<LeaderboardInitialEvent>(leaderboardInitialEvent);
    on<LeaderboardCalculatePointsEvent>(leaderboardCalculatePointsEvent);
  }

  FutureOr<void> leaderboardInitialEvent(
      LeaderboardInitialEvent event, Emitter<LeaderboardState> emit) async {
    emit(LeaderboardLoadingState());
    await Future.delayed(
      const Duration(seconds: 2),
    );
    //get user from data base (the first user)
    final List<MyUser> users = List.from(UserDatabase.users[0].friends!);
    //sort the user based on their points
    users.sort((a, b) => b.points.compareTo(a.points));
    // print(UserDatabase.users[0].username);
    if (users.isEmpty) {
      emit(LeaderboardShowNoFriendState());
    } else if (users.isNotEmpty) {
      emit(
        LeaderboardLoadedState(users: users),
      );
    } else {
      //error fetching user data
      emit(
        LeaderboardErrorState(),
      );
    }
  }

  FutureOr<void> leaderboardCalculatePointsEvent(
      LeaderboardCalculatePointsEvent event,
      Emitter<LeaderboardState> emit) async {
    final List<MyUser> users = List.from(UserDatabase.users[0].friends!);
    users.sort((a, b) => b.points.compareTo(a.points));
    final List<MyUser> topThreeUsers = users.sublist(0, 3);

    emit(LeaderboardCalculatePoints(
        topThree: topThreeUsers));
  }
}

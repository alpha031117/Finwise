part of 'leaderboard_bloc.dart';

sealed class LeaderboardEvent extends Equatable {
  const LeaderboardEvent();

  @override
  List<Object> get props => [];
}

final class LeaderboardInitialEvent extends LeaderboardEvent {}

final class LeaderboardCalculatePointsEvent extends LeaderboardEvent {}

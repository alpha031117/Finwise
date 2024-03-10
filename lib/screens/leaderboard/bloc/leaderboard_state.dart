part of 'leaderboard_bloc.dart';

sealed class LeaderboardState extends Equatable {
  const LeaderboardState();

  @override
  List<Object> get props => [];
}

//action states
sealed class LeaderboardActionState extends LeaderboardState {}

final class LeaderboardInitialState extends LeaderboardState {}

final class LeaderboardLoadingState extends LeaderboardState {}

final class LeaderboardErrorState extends LeaderboardState {}

final class LeaderboardLoadedState extends LeaderboardState {
  final List<MyUser> users;

  const LeaderboardLoadedState({required this.users});
  @override
  List<Object> get props => [users];
}

final class LeaderboardShowNoFriendState extends LeaderboardState {}

final class LeaderboardCalculatePoints extends LeaderboardState {
  final List<MyUser> users;

  const LeaderboardCalculatePoints({required this.users});
  @override
  List<Object> get props => [users];
}

part of 'leaderboard_bloc.dart';

sealed class LeaderboardState extends Equatable {
  const LeaderboardState();
  
  @override
  List<Object> get props => [];
}

final class LeaderboardInitial extends LeaderboardState {}

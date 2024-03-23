part of 'podcast_bloc.dart';

sealed class PodcastState extends Equatable {
  const PodcastState();

  @override
  List<Object> get props => [];
}

final class PodcastInitial extends PodcastState {}

final class PodcastLoadingState extends PodcastState {}

final class PodcastLoadedState extends PodcastState {
  final List<Episode> trendingNowEpisodes;

  const PodcastLoadedState({required this.trendingNowEpisodes});
  @override
  List<Object> get props => [trendingNowEpisodes];
}

final class PodcastErrorState extends PodcastState {}

final class PodcastEpisodePlayControlState extends PodcastState {
  final Episode episode;

  const PodcastEpisodePlayControlState({required this.episode});
  @override
  List<Object> get props => [episode];
}

final class PodcastEpisodeInitializeProgessCompleteState extends PodcastState {
  final Duration currentProgress;

  const PodcastEpisodeInitializeProgessCompleteState({required this.currentProgress});

   @override
  List<Object> get props => [currentProgress];
}

final class PodcastEpisodePlayState extends PodcastState {}

final class PodcastEpisodePauseState extends PodcastState {}

//incomplete
final class PodcastEpisodeSeekState extends PodcastState {}

final class PodcastEpisodePlaybackProgressState extends PodcastState {
  final Duration currentDuration;
  final Duration totalDuration;

  const PodcastEpisodePlaybackProgressState(
      {required this.currentDuration, required this.totalDuration});

  @override
  List<Object> get props => [currentDuration, totalDuration];
}

part of 'podcast_bloc.dart';

sealed class PodcastEvent extends Equatable {
  const PodcastEvent();

  @override
  List<Object> get props => [];
}

final class PodcastInitialEvent extends PodcastEvent {}

final class PodcastEpisodePlayEvent extends PodcastEvent {}

final class PodcastEpisodePauseEvent extends PodcastEvent {}

final class PodcastEpisodeInitializeProgessEvent extends PodcastEvent {}

final class PodcastEpisodeResumeEvent extends PodcastEvent {}

final class PodcastEpisodePauseOrResumeEvent extends PodcastEvent {}

final class PodcastEpisodeSeekEvent extends PodcastEvent {
  final int second;
  final bool isForward;

  const PodcastEpisodeSeekEvent( {required this.second,required this.isForward});

  @override
  List<Object> get props => [isForward,second];
}

//this event is used in our bloc method to Update the Bloc to do further logic
class UpdatePlaybackProgressEvent extends PodcastEvent {
  final Duration currentDuration;
  final Duration totalDuration;

  const UpdatePlaybackProgressEvent({
    required this.currentDuration,
    required this.totalDuration,
  });

  @override
  List<Object> get props => [currentDuration, totalDuration];
}

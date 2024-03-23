import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/podcast_episode.dart';
import '../../../model/podcasts.dart';

part 'podcast_event.dart';
part 'podcast_state.dart';

class PodcastBloc extends Bloc<PodcastEvent, PodcastState> {
  late final AudioPlayer _audioPlayer;
  late Duration _currentDuration;
  late final Duration _totalDuration;
  late bool _isPlaying; // Remove initialization here

  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  bool get isPlaying => _isPlaying;
  //when podcast bloc is initialized
  PodcastBloc() : super(PodcastInitial()) {
    _audioPlayer = AudioPlayer(); //initialize the audio player
    //initialize the audio player
    _currentDuration = Duration.zero;
    _totalDuration = Duration.zero;
    _isPlaying = false; // Initialize _isPlaying here
    on<PodcastInitialEvent>(podcastInitialEvent);
    on<PodcastEpisodePlayEvent>(podcastEpisodePlayEvent);
    on<PodcastEpisodePauseEvent>(podcastEpisodePauseEvent);
    on<PodcastEpisodePauseOrResumeEvent>(podcastEpisodePauseOrResumeEvent);
    on<PodcastEpisodeSeekEvent>(podcastEpisodeSeekEvent);
    on<PodcastEpisodeInitializeProgessEvent>(
        podcastEpisodeInitializeProgessEvent);
    on<UpdatePlaybackProgressEvent>(updatePlaybackProgressEvent);
  }

  // @override
  // Stream<PodcastState> mapEventToState(PodcastEvent event) async* {
  //   if (event is UpdatePlaybackProgressEvent) {
  //     yield PodcastEpisodePlaybackProgressState(
  //       currentDuration: event.currentDuration,
  //       totalDuration: event.totalDuration,
  //     );
  //   }
  //   // Handle other events...
  // }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }

  void listenToDuration() {
    //listen to total duration
    _audioPlayer.onDurationChanged.listen((duration) {
      _totalDuration = duration;
      print(_totalDuration);
      //emit can only used in bloc, so we use stream in bloc
      //       emit(
      //   PodcastEpisodePlaybackProgressState(
      //       currentDuration: currentDuration, totalDuration: totalDuration),
      // );

      //so
      add(
        UpdatePlaybackProgressEvent(
            currentDuration: currentDuration, totalDuration: totalDuration),
      );
    });

    //listen to current duration
    _audioPlayer.onPositionChanged.listen((duration) {
      _currentDuration = duration;
      print(_currentDuration);
    });

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      print('Completed');
    });

    //listen to state
    _audioPlayer.onPlayerStateChanged.listen((state) {
      print(state);
    });
  }

  void play() async {
    _audioPlayer.audioCache = AudioCache(prefix: 'assets/podcast/');
    await _audioPlayer.stop(); //have to stop before we play a song
    await _audioPlayer.play(AssetSource('sample.mp3'));
    _isPlaying = true;
    listenToDuration();
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    listenToDuration();
  }

  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    //remember to do some emit state logic afterwards
  }

  void seekTo(Duration duration) async {
    await _audioPlayer.seek(duration);
  }

  //play next podcast, currently not implemented
  // void playNextEpisode() {
  //   if (currentEpisodeIndex != null){
  //     if (currentEpisodeIndex! < PodcastDatabase.trendingNow.length - 1){
  //       //next episode
  //       currentEpisodeIndex = currentEpisodeIndex! + 1;
  //       play();
  //     }else{
  //       //if its the last episode, play the first
  //       currentEpisodeIndex = 0;
  //       play();
  //     }
  //   }
  // }

  FutureOr<void> podcastInitialEvent(
      PodcastInitialEvent event, Emitter<PodcastState> emit) {
    emit(PodcastLoadingState());

    //get the trending now episodes
    final List<Episode> episodes = PodcastDatabase.trendingNow;

    //format the duration
    for (var episode in episodes) {
      if (int.parse(episode.durationInMinutes) > 60) {
        int tempMinute = int.parse(episode.durationInMinutes);
        // integer division operator
        //return the integer part of the division
        int hours = tempMinute ~/ 60;
        //modulus
        //return the remainder of the division
        int minutes = tempMinute % 60;
        String formattedDuration =
            '$hours h ${minutes.toString().padLeft(2, '0')} m';
        // Use the formattedDuration as needed

        //set the formatted minutes
        episode.durationInMinutes = formattedDuration;
      } else {
        episode.durationInMinutes = '${episode.durationInMinutes} m';
      }
    }
    Future.delayed(const Duration(seconds: 1));
    emit(
      PodcastLoadedState(trendingNowEpisodes: episodes),
    );
  }

  FutureOr<void> podcastEpisodePlayEvent(
      PodcastEpisodePlayEvent event, Emitter<PodcastState> emit) {
    play();
    emit(PodcastEpisodePlayState());
  }

  FutureOr<void> podcastEpisodePauseEvent(
      PodcastEpisodePauseEvent event, Emitter<PodcastState> emit) {
    pause();
    emit(PodcastEpisodePauseState());
  }

  FutureOr<void> podcastEpisodePauseOrResumeEvent(
      PodcastEpisodePauseOrResumeEvent event, Emitter<PodcastState> emit) {
    pauseOrResume();
    if (_isPlaying) {
      emit(PodcastEpisodePauseState());
    } else {
      emit(PodcastEpisodePlayState());
    }
  }

  FutureOr<void> podcastEpisodeSeekEvent(
      PodcastEpisodeSeekEvent event, Emitter<PodcastState> emit) {
    final Duration seekDuration = event.isForward
        ? _currentDuration + Duration(seconds: event.second)
        : _currentDuration - Duration(seconds: event.second);
    seekTo(seekDuration);
    emit(PodcastEpisodeSeekState());
  }

  FutureOr<void> podcastEpisodeInitializeProgessEvent(
      PodcastEpisodeInitializeProgessEvent event, Emitter<PodcastState> emit) {}

  FutureOr<void> updatePlaybackProgressEvent(
      UpdatePlaybackProgressEvent event, Emitter<PodcastState> emit) async* {
    emit(PodcastEpisodePlaybackProgressState(
      currentDuration: event.currentDuration,
      totalDuration: event.totalDuration,
    ));
  }
}

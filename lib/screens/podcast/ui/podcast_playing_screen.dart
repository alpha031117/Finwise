import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vhack_finwise_app/model/podcast_episode.dart';
import 'package:vhack_finwise_app/screens/podcast/podcast_bloc/podcast_bloc.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

import 'widgets/play_pause_seek_row.dart';

class PodcastPlayingScreen extends StatefulWidget {
  final Episode episode;
  final PodcastBloc bloc;

  const PodcastPlayingScreen({
    super.key,
    required this.episode,
    required this.bloc,
  });

  @override
  State<PodcastPlayingScreen> createState() => _PodcastPlayingScreenState();
}

class _PodcastPlayingScreenState extends State<PodcastPlayingScreen> {
  double progressPercent = 0;
  @override
  void initState() {
    super.initState();
    // Call listenToDuration method here
    listenToDuration();
  }

  void listenToDuration() {
    widget.bloc.stream.listen((state) {
      print('CUREENT STATE : $state');
      print('PROGESS : $progressPercent');
      if (state is PodcastEpisodePlaybackProgressState) {
        setState(() {
          progressPercent = state.currentDuration.inMilliseconds /
              state.totalDuration.inMilliseconds;
        });
      } else {
        print('PRINTED: $state');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Now Playing'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: GlobalVariables.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget.episode.imagePath,
                      fit: BoxFit.cover,
                      height: 300,
                      width: 300,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  // ...

                  Text(
                    DateFormat('dd/MM/yyyy').format(widget.episode.releaseDate),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    widget.episode.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontStyle: GlobalVariables.titleFont().fontStyle),
                  ),
                  Text(
                    widget.episode.host,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),

              //this part this to consistantly listen to changes
              BlocBuilder<PodcastBloc, PodcastState>(
                bloc: widget.bloc,
                builder: (context, state) {
                  if (state is PodcastEpisodePlaybackProgressState) {
                    double progressPercent =
                        state.currentDuration.inMilliseconds /
                            state.totalDuration.inMilliseconds;
                    print(progressPercent);
                    return LinearPercentIndicator(
                      lineHeight: 10.0,
                      barRadius: const Radius.circular(20),
                      percent: progressPercent,
                      progressColor: GlobalVariables.primaryColor,
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 70,
              ),
              PlayPauseSeekRow(
                bloc: widget.bloc,
              )
            ],
          ),
        ),
      ),
    );
  }
}

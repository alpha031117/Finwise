import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../podcast_bloc/podcast_bloc.dart';
class PlayPauseSeekRow extends StatefulWidget {
  final PodcastBloc bloc;
  const PlayPauseSeekRow({
    super.key,
    required this.bloc,
  });

  @override
  State<PlayPauseSeekRow> createState() => _PlayPauseSeekRowState();
}

class _PlayPauseSeekRowState extends State<PlayPauseSeekRow> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PodcastBloc, PodcastState>(
      bloc: widget.bloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  widget.bloc.add(const PodcastEpisodeSeekEvent(
                      second: 10, isForward: false));
                },
                icon: const Icon(
                  Icons.replay_10,
                  size: 30,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  widget.bloc.add(PodcastEpisodePauseOrResumeEvent());
                },
                icon: state is PodcastEpisodePauseState
                    ? Icon(Icons.play_arrow, size: 38)
                    : Icon(Icons.pause, size: 38),
              ),
            ),
            const Spacer(),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  widget.bloc.add(const PodcastEpisodeSeekEvent(
                      second: 10, isForward: true));
                },
                icon: const Icon(
                  Icons.forward_10,
                  size: 30,
                ),
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}

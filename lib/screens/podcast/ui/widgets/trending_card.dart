import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vhack_finwise_app/model/podcast_episode.dart';

import '../../../../utils/global_variables.dart';
import '../../podcast_bloc/podcast_bloc.dart';
import '../podcast_playing_screen.dart';

class TrendingCard extends StatefulWidget {
  final Episode episode;

  final Function() onPressed;
  const TrendingCard({
    super.key,
    required this.episode,
    required this.onPressed,
  });

  @override
  State<TrendingCard> createState() => _TrendingCardState();
}

class _TrendingCardState extends State<TrendingCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _podcastBloc = PodcastBloc();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  child: InkWell(
                      child: Image.asset(
                        widget.episode.imagePath,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PodcastPlayingScreen(
                                episode: widget.episode,
                                bloc: _podcastBloc,
                              ),
                            ));
                      }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 'FRESHLY PRODUCED' - 'NEW - 3D AGO' or dd/mm/yyyy
                  Text(
                    widget.episode.releaseDate.toString(),
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                  Text(
                    widget.episode.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontStyle: GlobalVariables.titleFont().fontStyle),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                GlobalVariables.secondaryColor),
                          ),
                          onPressed: () async {
                            if (_podcastBloc.isPlaying) {
                              _podcastBloc.add(PodcastEpisodePauseEvent());
                            } else {
                              _podcastBloc.add(PodcastEpisodePlayEvent());
                            }
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BlocBuilder<PodcastBloc, PodcastState>(
                                  bloc: _podcastBloc,
                                  builder: (context, state) {
                                    if (state is PodcastEpisodePlayState) {
                                      return Icon(
                                        Icons.pause,
                                        color: Colors.white,
                                      );
                                    } else if (state
                                        is PodcastEpisodePauseState) {
                                      return Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      );
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.episode.durationInMinutes,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.more_horiz_rounded)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

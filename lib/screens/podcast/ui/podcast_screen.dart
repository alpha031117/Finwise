import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vhack_finwise_app/model/meet_you_podcaster.dart';
import 'package:vhack_finwise_app/model/podcast.dart';
import 'package:vhack_finwise_app/model/podcast_episode.dart';
import 'package:vhack_finwise_app/model/podcasts.dart';
import 'package:vhack_finwise_app/screens/podcast/podcast_bloc/podcast_bloc.dart';
import 'package:vhack_finwise_app/utils/global_variables.dart';

import 'widgets/episode_podcast_list_tile.dart';
import 'widgets/listen_podcast_bar_button.dart';
import 'widgets/meet_your_podcaster_card.dart';
import 'widgets/trending_card.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({super.key});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  final _podcastBloc = PodcastBloc();
  bool isRecentButtonSelected = true;
  bool isYouMightLikeButtonSelected = false;
  bool isLikedPodcastSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _podcastBloc.add(PodcastInitialEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _podcastBloc.close();
  }

  void contentBarSelected(String) {
    if (String == 'Recent') {
      setState(() {
        isRecentButtonSelected = true;
        isYouMightLikeButtonSelected = false;
        isLikedPodcastSelected = false;
      });
    } else if (String == 'You Might Like') {
      setState(() {
        isRecentButtonSelected = false;
        isYouMightLikeButtonSelected = true;
        isLikedPodcastSelected = false;
      });
    } else {
      setState(() {
        isRecentButtonSelected = false;
        isYouMightLikeButtonSelected = false;
        isLikedPodcastSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<PodcastBloc, PodcastState>(
        bloc: _podcastBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is PodcastLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is PodcastLoadedState) {
            final trendingEpisodes = state.trendingNowEpisodes;
            final meetYourPodcasterList =
                MeetYourPodcaster.meetYourPodcasterList;
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GlobalVariables.horizontalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //listen to your favourite podcast
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Listen Your',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    fontStyle:
                                        GlobalVariables.titleFont().fontStyle),
                              ),
                              Text(
                                'Favourite Podcast',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    fontStyle:
                                        GlobalVariables.titleFont().fontStyle),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //trending now
                      Text(
                        'Trending Now',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontStyle: GlobalVariables.titleFont().fontStyle),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 370,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: trendingEpisodes.length,
                          itemBuilder: (context, index) {
                            return TrendingCard(
                              episode: trendingEpisodes[index],
                              onPressed: () async {},
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //meet your podcaster
                      Text(
                        'Meet Your Podcaster',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontStyle: GlobalVariables.titleFont().fontStyle),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: meetYourPodcasterList.length,
                          itemBuilder: (context, index) {
                            return MeetYourPodcasterCard(
                              meetYourPodcaster: meetYourPodcasterList[index],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //listen podcast
                      Text(
                        'Listen Podcast',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontStyle: GlobalVariables.titleFont().fontStyle),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListenPodcastBarButton(
                        onPressed: (value) {
                          contentBarSelected(value);
                          print(
                              'isRecentButtonSelected: $isRecentButtonSelected');
                          print(
                              'isYouMightLikeButtonSelected: $isYouMightLikeButtonSelected');
                          print('liked ; $isLikedPodcastSelected');
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 375,
                        child: ListView.builder(itemCount: () {
                          if (isRecentButtonSelected &&
                              !isYouMightLikeButtonSelected &&
                              !isLikedPodcastSelected) {
                            print('option 1 selected');
                            //3
                            return PodcastDatabase.recentList.length;
                          } else if (!isRecentButtonSelected &&
                              isYouMightLikeButtonSelected &&
                              !isLikedPodcastSelected) {
                            print('option 2 selected');
                            //4
                            return PodcastDatabase.youMightLikeList.length;
                          } else if (!isRecentButtonSelected &&
                              !isYouMightLikeButtonSelected &&
                              isLikedPodcastSelected) {
                            // print('option 3 selected');
                            // //2
                            print('option 3 selected');
                            //2
                            print(
                                ' liked podcast length: ${PodcastDatabase.likedPodcastList.length}');
                            return PodcastDatabase.likedPodcastList
                                .length; // Handle other cases as needed
                          } else {
                            return 0;
                          }
                        }(), itemBuilder: (context, index) {
                          List<dynamic> episodeOrPodcastList = [];
                          if (isRecentButtonSelected &&
                              !isYouMightLikeButtonSelected &&
                              !isLikedPodcastSelected) {
                            List<Episode> recentEpisodes =
                                PodcastDatabase.recentList;
                            episodeOrPodcastList = recentEpisodes;
                          } else if (!isRecentButtonSelected &&
                              isYouMightLikeButtonSelected &&
                              !isLikedPodcastSelected) {
                            List<Episode> youMightLikeEpisodes =
                                PodcastDatabase.youMightLikeList;
                            episodeOrPodcastList = youMightLikeEpisodes;
                          } else if (!isRecentButtonSelected &&
                              !isYouMightLikeButtonSelected &&
                              isLikedPodcastSelected) {
                            List<Podcast> likedPodcast =
                                PodcastDatabase.likedPodcastList;
                            episodeOrPodcastList = likedPodcast;
                          }
                          return PodcostEpisodeListTile(
                            episodeOrPodcast: episodeOrPodcastList[index],
                          );
                        }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Browse Podcasts',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontStyle: GlobalVariables.titleFont().fontStyle),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 375,
                        child: ListView.builder(
                            itemCount: PodcastDatabase.podcastList.length,
                            itemBuilder: (context, index) {
                              final podcastList = PodcastDatabase.podcastList;
                              return PodcostEpisodeListTile(
                                episodeOrPodcast: podcastList[index],
                              );
                            }),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          }
        },
      ),
    );
  }
}

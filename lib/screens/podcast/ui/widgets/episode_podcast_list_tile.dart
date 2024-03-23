import 'package:flutter/material.dart';

import '../../../../model/podcast_episode.dart';
import '../../../../utils/global_variables.dart';
import '../podcast_playlist_screen.dart';

class PodcostEpisodeListTile extends StatefulWidget {
  final dynamic episodeOrPodcast;
  const PodcostEpisodeListTile({
    super.key,
    required this.episodeOrPodcast,
  });

  @override
  State<PodcostEpisodeListTile> createState() => _PodcostEpisodeListTileState();
}

class _PodcostEpisodeListTileState extends State<PodcostEpisodeListTile> {
  late bool isEpisode;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    if (widget.episodeOrPodcast is Episode) {
      print('it is a episode');
      setState(() {
        isEpisode = true;
      });
    } else {
      print('is is a podcast');
      setState(() {
        isEpisode = false;
      });
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.episodeOrPodcast.imagePath,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.episodeOrPodcast.releaseDate.toString(),
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                  ),
                  SizedBox(
                    width: 210,
                    child: Text(
                      isEpisode
                          ? widget.episodeOrPodcast.title
                          : widget.episodeOrPodcast.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: GlobalVariables.titleFont().fontStyle),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  isEpisode == true
                      ? GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: GlobalVariables.secondaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Text(
                                    '1h 30m',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: GlobalVariables.secondaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return PodcastPlaylistScreen(
                                        podcast: widget.episodeOrPodcast,
                                      );
                                    }),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.navigate_next_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    Text(
                                      'Check out',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

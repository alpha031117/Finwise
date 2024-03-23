import 'package:flutter/material.dart';
import 'package:vhack_finwise_app/model/podcast.dart';
import 'package:vhack_finwise_app/screens/podcast/ui/widgets/episode_podcast_list_tile.dart';

class PodcastPlaylistScreen extends StatefulWidget {
  final Podcast podcast;
  const PodcastPlaylistScreen({super.key, required this.podcast});

  @override
  State<PodcastPlaylistScreen> createState() => _PodcastPlaylistScreenState();
}

class _PodcastPlaylistScreenState extends State<PodcastPlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Podcast Playlist'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  blurRadius: 15,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            height: 250,
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.podcast.imagePath,
                fit: BoxFit.cover, // Use BoxFit.cover to fill the container
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.podcast.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
            child: Divider(
              color: Colors.grey.shade200,
            ),
          ),
          Text(
            'Episodes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.podcast.episodes.length,
              itemBuilder: ((context, index) {
                return PodcostEpisodeListTile(
                  episodeOrPodcast: widget.podcast.episodes[index],
                );
              }),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

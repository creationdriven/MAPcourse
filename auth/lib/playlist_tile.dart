import 'package:exchangeroom/helpers/spotify_playlist.dart';
import 'package:exchangeroom/pages/playlist_description.dart';
import 'package:flutter/material.dart';

class PlaylistTile extends StatelessWidget {
  PlaylistTile(
      {Key? key,
      required this.playlist,
      required this.source,
      required this.onClick})
      : super(key: key);
  final String source;
  final SpotifyPlaylist playlist;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    String? url = playlist.images.containsKey(300)
        ? playlist.images[300]
        : playlist.images.containsKey(640)
            ? playlist.images[640]
            : null;
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlaylistDescriptionPage(
                      playlist: playlist, source: source)));
          onClick();
        },
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: url == null
                                ? Image.asset("images/coming_soon.jpg").image
                                : Image.network(url).image),
                      )),
                  Text(playlist.name),
                  Text("Tracks: " + playlist.totalTracks().toString()),
                  Text(playlist.public ? "Public" : "Private")
                ],
              ),
            )));
  }
}

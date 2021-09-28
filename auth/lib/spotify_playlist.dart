class SpotifyPlaylist {
  final String id;
  final String name;
  final String href;
  final _Tracks tracks;
  final Map<int, String> images;
  final bool collaborative;
  final bool public;

  SpotifyPlaylist(
      {required this.id,
      required this.name,
      required this.href,
      required this.tracks,
      required this.images,
      required this.collaborative,
      required this.public});

  factory SpotifyPlaylist.fromMap(Map<String, dynamic> data) {
    Map<int, String> images = {};
    List<dynamic> items = data["images"] as List<dynamic>;
    items.forEach((item) {
      if (item["url"] != null ? true : false) {
        images[item["height"]] = item["url"];
      }
    });

    return SpotifyPlaylist(
        id: data['id'],
        name: data['name'],
        href: data['external_urls']['spotify'],
        tracks: _Tracks.fromMap(data["tracks"]),
        images: images,
        collaborative: data['collaborative'] ?? false,
        public: data['public'] ?? false);
  }

  int totalTracks() {
    return tracks.total;
  }

  String tracksRef() {
    return tracks.href;
  }
}

class _Tracks {
  final String href;
  final int total;
  _Tracks({required this.href, required this.total});

  factory _Tracks.fromMap(Map<String, dynamic> data) {
    return _Tracks(href: data['href'], total: data['total']);
  }
}

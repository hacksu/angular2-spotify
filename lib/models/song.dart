import '../helpers/json_helper.dart';

class Song
{
  String id;
  String name;
  String url;
  String imageUrl;

  Song(this.id, this.name, this.url, this.imageUrl);

  factory Song.fromJson(Map<String, dynamic> song)
  {
    var externalUrl = JsonHelper.getExternalUrl(song);
    var imageUrl = JsonHelper.getImageUrl(song);

    return new Song(song['id'],
      song['name'],
      externalUrl,
      imageUrl
    );
  }
}
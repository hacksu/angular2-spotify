import '../helpers/json_helper.dart';

class Song
{
  String id;
  String name;
  String url;

  Song(this.id, this.name, this.url);

  factory Song.fromJson(Map<String, dynamic> song)
  {
    var externalUrl = JsonHelper.getExternalUrl(song);

    return new Song(song['id'],
      song['name'],
      externalUrl
    );
  }
}
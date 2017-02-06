import '../helpers/json_helper.dart';

class Album
{
  String id;
  String name;
  List<String> artistNames;
  String url;
  String imageUrl;

  Album(this.id, this.name, this.artistNames, this.url, this.imageUrl);

  factory Album.fromJson(Map<String, dynamic> album)
  {
    var artistNames = JsonHelper.getArtistNames(album);
    var externalUrl = JsonHelper.getExternalUrl(album);
    var imageUrl = JsonHelper.getImageUrl(album);

    return new Album(album['id'],
      album['name'],
      artistNames,
      externalUrl,
      imageUrl
    );
  }
}
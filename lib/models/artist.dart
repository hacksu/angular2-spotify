import '../helpers/json_helper.dart';

class Artist
{
  String id;
  String name;
  List<String> genres;
  int followers;
  String url;
  String imageUrl;

  Artist(this.id, this.name, this.genres, this.followers, this.url, this.imageUrl);

  factory Artist.fromJson(Map<String, dynamic> artist)
  {
    var genres = JsonHelper.getGenres(artist);
    var externalUrl = JsonHelper.getExternalUrl(artist);
    var imageUrl = JsonHelper.getImageUrl(artist);
    
    return new Artist(artist['id'], 
               artist['name'], 
               genres, 
               artist['followers']['total'], 
               externalUrl,
               imageUrl);
  }
}
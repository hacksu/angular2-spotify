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
    var images = artist['images'];
    var imageUrl = '';
    if(images.length != 0)
    {
      imageUrl = images[0]['url'];
    }

    var externalUrl = artist['external_urls']['spotify'].toString();
    var fixedUrl = externalUrl.replaceFirst("open", "play");
    
    return new Artist(artist['id'], 
               artist['name'], 
               artist['genres'], 
               artist['followers']['total'], 
               fixedUrl,
               imageUrl);
  }
}
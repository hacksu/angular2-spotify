class Artist
{
  String id;
  String name;
  List<String> genres;
  int followers;
  int popularity;
  String url;
  String uri;
  String imageUrl;

  Artist(this.id, this.name, this.genres, this.followers, this.popularity, this.url, this.uri, this.imageUrl);

  factory Artist.fromJson(Map<String, dynamic> artist)
  {
    var images = artist['images'];
    var imageUrl = '';
    if(images.length != 0)
    {
      imageUrl = images[0]['url'];
    }
    
    return new Artist(artist['id'], 
               artist['name'], 
               artist['genres'], 
               artist['followers']['total'], 
               artist['popularity'],
               artist['href'],
               artist['uri'],
               imageUrl);
  }

  Map toJson() => {'id': id, 
                   'name': name,
                   'genres': genres,
                   'followers': followers,
                   'popularity': popularity,
                   'url': url,
                   'uri': uri,
                   'imageUrl': imageUrl};
}
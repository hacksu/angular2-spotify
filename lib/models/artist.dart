class Artist
{
  String id;
  String name;
  List<String> genres;
  int followers;
  int popularity;
  String url;
  String uri;

  Artist(this.id, this.name, this.genres, this.followers, this.popularity, this.url, this.uri);

  factory Artist.fromJson(Map<String, dynamic> artist) =>
    new Artist(artist['id'], 
               artist['name'], 
               artist['genres'], 
               artist['followers']['total'], 
               artist['popularity'],
               artist['href'],
               artist['uri']);

  Map toJson() => {'id': id, 
                   'name': name,
                   'genres': genres,
                   'followers': followers,
                   'popularity': popularity,
                   'url': url,
                   'uri': uri};
}
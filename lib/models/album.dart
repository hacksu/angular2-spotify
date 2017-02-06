class Album
{
  String id;
  String name;
  String url;
  String imageUrl;

  Album(this.id, this.name, this.url, this.imageUrl);

  factory Album.fromJson(Map<String, dynamic> song)
  {
    var images = song['images'];
    var imageUrl = '';
    if(images.length != 0)
    {
      imageUrl = images[0]['url'];
    }

    var externalUrl = song['external_urls']['spotify'].toString();
    var fixedUrl = externalUrl.replaceFirst("open", "play");

    return new Album(song['id'],
      song['name'],
      fixedUrl,
      imageUrl
    );
  }
}
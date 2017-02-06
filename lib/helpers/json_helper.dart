class JsonHelper
{
  static String getImageUrl(dynamic object)
  {
    var images = object['images'];
    var imageUrl = '';
    if(images != null && images.length != 0)
    {
      imageUrl = images[0]['url'];
    }
    return imageUrl;
  }

  static String getExternalUrl(dynamic object)
  {
    var externalUrl = object['external_urls']['spotify'].toString();
    return externalUrl.replaceFirst("open", "play");
  }

  static List<String> getArtistNames(dynamic object)
  {
    var artistNames = new List<String>();
    var artistsInfoArray = object['artists'];
    for(var artistInfo in artistsInfoArray)
    {
      var artistName = artistInfo['name'].toString();
      artistNames.add(artistName.trim());
    }
    return artistNames;
  }
}
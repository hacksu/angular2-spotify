class JsonHelper
{
  static String getImageUrl(dynamic object)
  {
    var images = object['images'];
    var imageUrl = '';
    if(images.length != 0)
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
}
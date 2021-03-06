import 'dart:convert';
import 'package:http/http.dart';

class WebRequestHelper
{
  //search
  static dynamic extractArtists(Response resp) => JSON.decode(resp.body)['artists']['items'];
  //artist details
  static dynamic extractArtist(Response resp) => JSON.decode(resp.body);  
  static dynamic extractAlbums(Response resp) => JSON.decode(resp.body)['items'];
  static dynamic extractSongs(Response resp) => JSON.decode(resp.body)['tracks'];
  
  static Exception handleError(dynamic e) {
    return new Exception('Server error; cause: $e');
  }
}
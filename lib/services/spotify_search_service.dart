import 'dart:async';
import 'dart:convert';

import 'package:angular2/core.dart';
import 'package:http/http.dart';

import '../models/artist.dart';

@Injectable()
class SpotifySearchService
{
  static const _searchUrlPrefix = "https://api.spotify.com/v1/search?q=";
  static const _searchUrlSuffix = "&type=artist&offset=0&limit=20";

  final Client _http;

  SpotifySearchService(this._http);

  Future<List<Artist>> search(String query) async
  {
    var url = _searchUrlPrefix + query + _searchUrlSuffix;

    try
    {
      final response = await _http.get(url);
      final artists = _extractData(response)
        .map((value) => new Artist.fromJson(value))
        .toList();
      return artists;
    }
    catch(e)
    {
      throw _handleError(e);
    }
    
  }
}

dynamic _extractData(Response resp) => JSON.decode(resp.body)['artists']['items'];
  
Exception _handleError(dynamic e) {
  return new Exception('Server error; cause: $e');
}

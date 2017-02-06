import 'dart:async';

import 'package:angular2/core.dart';
import 'package:http/http.dart';

import '../helpers/web_request_helper.dart';
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
      final artists = WebRequestHelper.extractArtists(response)
        .map((value) => new Artist.fromJson(value))
        .toList();
      return artists;
    }
    catch(e)
    {
      throw WebRequestHelper.handleError(e);
    }
  }
}

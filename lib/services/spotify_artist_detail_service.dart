import 'dart:async';

import 'package:angular2/core.dart';
import 'package:http/http.dart';

import '../helpers/web_request_helper.dart';
import '../models/artist.dart';
import '../models/album.dart';
import '../models/song.dart';

@Injectable()
class SpotifySearchService
{
  static const _searchUrlPrefix = "https://api.spotify.com/v1/artists/";

  final Client _http;

  SpotifySearchService(this._http);

  Future<Artist> getArtistInfo(String id) async
  {
    var url = _searchUrlPrefix + id;

    try
    {
      final response = await _http.get(url);
      final artistResponse = WebRequestHelper.extractArtist(response);
      return new Artist.fromJson(artistResponse);
    }
    catch(e)
    {
      throw WebRequestHelper.handleError(e);
    }
  }

  Future<List<Album>> getArtistAlbums(String id) async
  {
    var url = _searchUrlPrefix + id + "/albums?offset=0&limit=20&album_type=album";

    try
    {
      final response = await _http.get(url);
      final albums = WebRequestHelper.extractAlbums(response)
        .map((value) => new Album.fromJson(value))
        .toList();
      return albums;
    }
    catch(e)
    {
      throw WebRequestHelper.handleError(e);
    }
  }

  Future<List<Song>> getArtistTopSongs(String id) async
  {
    var url = _searchUrlPrefix + id + "/top-tracks?country=US";

    try
    {
      final response = await _http.get(url);
      final songs = WebRequestHelper.extractSongs(response)
        .map((value) => new Song.fromJson(value))
        .toList();
      return songs;
    }
    catch(e)
    {
      throw WebRequestHelper.handleError(e);
    }
  }
}
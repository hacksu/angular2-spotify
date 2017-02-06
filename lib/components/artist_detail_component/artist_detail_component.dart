import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import '../../models/artist.dart';
import '../../models/album.dart';
import '../../models/song.dart';
import '../../services/spotify_artist_detail_service.dart';

@Component(
  selector: 'artist-detail',
  templateUrl: 'artist_detail_component.html',
  styleUrls: const ['artist_detail_component.css'],
  providers: const [SpotifyArtistDetailService]
)

class ArtistDetailComponent implements OnInit
{
  Artist artist;
  List<Album> albums;
  List<Song> songs;

  final SpotifyArtistDetailService _spotifyArtistDetailService;
  final RouteParams _routeParams;
  final Location _location;

  ArtistDetailComponent(this._spotifyArtistDetailService, this._routeParams, this._location);

  @override
  Future<Null> ngOnInit() async
  {
    var routeId = _routeParams.get('id');
    artist = await _spotifyArtistDetailService.getArtistInfo(routeId);
    albums = await _spotifyArtistDetailService.getArtistAlbums(routeId);
    songs = await _spotifyArtistDetailService.getArtistTopSongs(routeId);
  }

  void goBack() => _location.back();
}
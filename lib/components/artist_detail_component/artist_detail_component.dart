import '../../models/album.dart';
import '../../models/artist.dart';
import '../../models/song.dart';
import '../../services/spotify_artist_detail_service.dart';
import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

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
  final Router _router;
  final RouteParams _routeParams;

  ArtistDetailComponent(this._spotifyArtistDetailService, this._router, this._routeParams);

  @override
  Future<Null> ngOnInit() async
  {
    var routeId = _routeParams.get('id');
    artist = await _spotifyArtistDetailService.getArtistInfo(routeId);
    albums = await _spotifyArtistDetailService.getArtistAlbums(routeId);
    songs = await _spotifyArtistDetailService.getArtistTopSongs(routeId);
  }

  void goBack()
  {
    var link = ['Search'];
    _router.navigate(link);
  }
}
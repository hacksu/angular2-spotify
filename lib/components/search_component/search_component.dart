import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../models/artist.dart';
import '../../services/spotify_search_service.dart';

@Component(
  selector: 'search',
  templateUrl: 'search_component.html',
  styleUrls: const ['search_component.css'],
  providers: const [SpotifySearchService]
)

class SearchComponent implements OnInit
{
  List<Artist> artists;

  final SpotifySearchService _spotifySearchService;
  final Router _router;  

  SearchComponent(this._spotifySearchService, this._router);

  @override
  Future<Null> ngOnInit() async
  {
    artists = null;
  }

  Future<Null> search(String query) async
  {
    if(query.isNotEmpty)
    {
      var fixedQuery = query.replaceAll(" ", "+");
      artists = await _spotifySearchService.search(fixedQuery);
    }
  }

  void goToArtistDetail(Artist artist)
  {
    var link = [
      'ArtistDetail',
      {'id': artist.id}
    ];
    _router.navigate(link);
  }
}
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

  @override
  Future<Null> ngOnInit() async
  {
    artists = null;
  }

  Future<Null> search(String query) async
  {
    
  }

  void goToArtistDetail(Artist artist)
  {
    
  }
}
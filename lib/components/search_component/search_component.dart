import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../models/artist.dart';
import '../../services/search_service.dart';

@Component(
  selector: 'search',
  templateUrl: 'search_component.html',
  styleUrls: const ['search_component.css'],
  providers: [SearchService]
)

class SearchComponent implements OnInit
{
  List<Artist> artists;

  final SearchService _searchService;
  final Router _router;  

  SearchComponent(this._searchService, this._router);

  @override
  Future<Null> ngOnInit() async
  {
    artists = new List<Artist>();
  }

  Future<Null> search(String query) async
  {
    var fixedQuery = query.replaceAll(" ", "+");
    artists = await _searchService.search(fixedQuery);
  }
}
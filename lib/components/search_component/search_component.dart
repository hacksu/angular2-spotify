import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../services/search_service.dart';

@Component(
  selector: 'search',
  templateUrl: 'search_component.html',
  styleUrls: const [SearchService, 'search_component.css']
)

class SearchComponent implements OnInit
{
  final SearchService _searchService;
  final Router _router;  

  SearchComponent(this._searchService, this._router);

  Future<Null> search(String query) async
  {
    print("Query: " + query);
  }
}
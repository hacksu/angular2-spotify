import 'dart:async';
import 'dart:convert';

import 'package:angular2/core.dart';
import 'package:http/http.dart';

@Injectable()
class SearchService
{
  static const _todosUrl = '/api/todos';

  final Client _http;

  SearchService(this._http);
}

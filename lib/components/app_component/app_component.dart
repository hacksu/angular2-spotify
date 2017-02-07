import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../artist_detail_component/artist_detail_component.dart';
import '../search_component/search_component.dart';

@Component(
  selector: 'spotify-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [ROUTER_DIRECTIVES],
  providers: const [ROUTER_PROVIDERS]
)

class AppComponent 
{
  
}
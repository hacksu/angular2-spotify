import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../search_component/search_component.dart';

@Component(
  selector: 'spotify-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [ROUTER_DIRECTIVES],
  providers: const [ROUTER_PROVIDERS]
)

@RouteConfig(const [
  const Route(
    path: '/',
    name: 'Search',
    component: SearchComponent,
    useAsDefault: true
  )
])

class AppComponent {
  String title = 'Angular 2 Spotify';
}
import 'package:bloc/bloc.dart';
import 'package:netra/aboutUS/about.dart';
import 'package:netra/home/home.dart';
import 'package:netra/team/team.dart';

enum NavigationEvents { HomeClickedEvent, AboutClickedEvent, TeamClickedEvent }

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final Function onMenuTap;

  NavigationBloc({this.onMenuTap});

  @override
  NavigationStates get initialState => Home(
        onMenuTap: onMenuTap,
      );

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeClickedEvent:
        yield Home(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.AboutClickedEvent:
        yield About(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.TeamClickedEvent:
        yield Team(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}

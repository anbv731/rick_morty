abstract class ScreenLocationsEvent {}

class InitialScreenLocationsEvent extends ScreenLocationsEvent {}

class LoadingScreenLocationsEvent extends ScreenLocationsEvent {}

class SearchScreenLocationsEvent extends ScreenLocationsEvent {
  String request;

  SearchScreenLocationsEvent({this.request});
}

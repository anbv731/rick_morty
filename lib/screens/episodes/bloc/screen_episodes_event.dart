abstract class ScreenEpisodesEvent {}
class InitialScreenEpisodesEvent extends ScreenEpisodesEvent{}
class SearchScreenEpisodesEvent extends ScreenEpisodesEvent {
  String request;
  SearchScreenEpisodesEvent({this.request});
}


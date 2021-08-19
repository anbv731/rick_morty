abstract class ScreenEpisodesEvent {}

class LoadingScreenEpisodesEvent extends ScreenEpisodesEvent {}
class SearchScreenEpisodesEvent extends ScreenEpisodesEvent {
  String request;
  SearchScreenEpisodesEvent({this.request});
}


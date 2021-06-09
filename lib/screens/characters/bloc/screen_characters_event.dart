abstract class ScreenEpisodesEvent {}

class InitialScreenCharactersEvent extends ScreenEpisodesEvent {}

class ChangeViewScreenCharactersEvent extends ScreenEpisodesEvent {
  final bool isList;

  ChangeViewScreenCharactersEvent({this.isList});
}

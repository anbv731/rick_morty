abstract class ScreenCharactersEvent {}

class InitialScreenCharactersEvent extends ScreenCharactersEvent {}

class ChangeViewScreenCharactersEvent extends ScreenCharactersEvent {
  final bool isList;

  ChangeViewScreenCharactersEvent({this.isList});
}

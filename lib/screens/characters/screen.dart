import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/components/search.dart';
import 'package:rick_morty/screens/characters/widgets/persons_grid.dart';
import 'package:rick_morty/screens/characters/widgets/persons_list.dart';
import 'package:rick_morty/screens/splash_screen/screen.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'bloc/screen_characters_bloc.dart';
import 'bloc/screen_characters_event.dart';
import 'bloc/screen_characters_state.dart';

class ScreenCharacters extends StatelessWidget {
  final bloc = ScreenCharactersBloc();

  @override
  Widget build(BuildContext context) {
    Function(String) event = (String text) {
      bloc.add(SearchScreenCharactersEvent(request:  text));
    };
    return BlocProvider<ScreenCharactersBloc>(
            create: (BuildContext context) =>
          bloc..add(InitialScreenCharactersEvent()),
      child: BlocBuilder<ScreenCharactersBloc, ScreenCharactersState>(
        builder: (_, state) {
          if (state is LoadingScreenCharactersState) {
            return StartScreen1();
          }
          if (state is DataScreenCharactersState) {
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).primaryColor,
                automaticallyImplyLeading: false,
                title: Search('Найти персонажа', true, function: event),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: ListTile(
                      leading: Text(
                          'ВСЕГО ПЕРСОНАЖЕЙ: ${state.charactersList.length ?? 0}',
                          style: Theme.of(context).textTheme.overline),
                      trailing: InkWell(
                          onTap: () {
                            bloc.add(ChangeViewScreenCharactersEvent(
                                isList: state.isList));
                          },
                          child: state.isList
                              ? SvgPicture.asset('assets/svg_icons/grid.svg')
                              : SvgPicture.asset('assets/svg_icons/list.svg'))),
                ),
              ),
              body: SafeArea(
                child: state.isList
                    ? PersonsList(
                        persons: state.charactersList, isScrollable: true)
                    : PersonsGrid(
                        persons: state.charactersList,
                      ),
              ),
            );
          }
          if (state is ErrorScreenCharactersState) {
            return const Icon(Icons.close, size: 200);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

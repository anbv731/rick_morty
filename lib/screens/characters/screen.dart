import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/screens/characters/widgets/persons_grid.dart';
import 'package:rick_morty/screens/characters/widgets/persons_list.dart';
import 'bloc/screen_characters_bloc.dart';
import 'bloc/screen_characters_event.dart';
import 'bloc/screen_characters_state.dart';
import 'file:///C:/Users/tatiana/StudioProjects/rick_morty/lib/components/search.dart';
import '../../theme/color_theme.dart';

import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/character/screen.dart';

import '../../theme/color_theme.dart';

class Persons1 extends StatelessWidget {
  final bloc = ScreenCharactersBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScreenCharactersBloc>(
      create: (BuildContext context) =>
          bloc..add(InitialScreenCharactersEvent()),
      child: BlocBuilder<ScreenCharactersBloc, ScreenCharactersState>(
        builder: (_, state) {
          if (state is LoadingScreenCharactersState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DataScreenCharactersState) {
            return Scaffold(
              backgroundColor: ThemeColors.background,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: ThemeColors.background,
                automaticallyImplyLeading: false,
                title: Search('Найти персонажа',true),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: ListTile(
                      leading: Text(
                          'ВСЕГО ПЕРСОНАЖЕЙ: ${state.charactersList.length ?? 0}',
                          style: TextStyle(
                              color: ThemeColors.text2,
                              fontSize: 10,
                              height: 1.6)),
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
                    ? PersonsList(persons: state.charactersList)
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

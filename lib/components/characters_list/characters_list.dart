import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/components/characters_list/bloc/charactersList_bloc.dart';
import 'package:rick_morty/components/characters_list/bloc/charactersList_event.dart';
import 'package:rick_morty/components/characters_list/bloc/charactersList_state.dart';
import 'package:rick_morty/components/element_of_characters_list.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/data/person_model.dart';

class CharactersList extends StatelessWidget {
  CharactersList({this.loadingCharactersList, this.isScrollable});


  bool isScrollable;
  String loadingCharactersList;

  @override
  Widget build(BuildContext context) {
    final bloc = CharactersListBloc(loadingCharactersList);
    return BlocProvider<CharactersListBloc>(
      create: (BuildContext context) => bloc..add(InitialCharactersListEvent()),
      child: BlocBuilder<CharactersListBloc, CharactersListState>(
          builder: (_, state) {
        if (state is LoadingCharactersListState) {
          return LoadingScreen();
        }
        if (state is DataCharactersListState) {
          return ListView.builder(
            padding: EdgeInsets.only(top: 0),
            physics: isScrollable
                ? AlwaysScrollableScrollPhysics()
                : NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.charactersList?.length ?? 0,
            itemBuilder: (_, position) {
              return ElementOfCharectersList(
                  true, state.charactersList[position]);
            },
          );
        }

        if (state is ErrorCharactersListState) {
          return const Icon(Icons.close, size: 200);
        }
        return const SizedBox();
      }),
    );
  }
}

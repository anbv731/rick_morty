import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/components/characters_list/bloc/charactersList_bloc.dart';
import 'package:rick_morty/components/characters_list/bloc/charactersList_event.dart';
import 'package:rick_morty/components/characters_list/bloc/charactersList_state.dart';
import 'package:rick_morty/components/element_of_characters_list.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/data/location_model.dart';
import 'package:rick_morty/data/person_model.dart';

class CharactersList extends StatelessWidget {
  CharactersList({this.argument, this.isScrollable});

  dynamic argument;
  bool isScrollable;
  dynamic list = [];

  @override
  Widget build(BuildContext context) {
    final bloc = CharactersListBloc();
    return BlocProvider<CharactersListBloc>(
      create: (BuildContext context) => bloc..add(InitialCharactersListEvent()),
      child: BlocBuilder<CharactersListBloc, CharactersListState>(
          builder: (_, state) {
        if (state is LoadingCharactersListState) {
          return LoadingScreen();
        }
        if (state is DataCharactersListState) {
          if (argument is Episode) {
            for (int i = 0; i < state.charactersList.length; i++) {
              for (int j = 0;
                  j < state.charactersList[i].episodes.length;
                  j++) {
                if (state.charactersList[i].episodes[j].id == argument.id) {
                  list.add(state.charactersList[i]);
                }
              }
            }
          } else if (argument is Location) {
            for (int i = 0; i < state.charactersList.length; i++) {
              if (state.charactersList[i].placeOfBirthId == argument.id) {
                list.add(state.charactersList[i]);
              }
            }
          }
          return ListView.builder(
            padding: EdgeInsets.only(top: 0),
            physics: isScrollable
                ? AlwaysScrollableScrollPhysics()
                : NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list?.length ?? 0,
            itemBuilder: (_, position) {
              return ElementOfCharectersList(true, list[position]);
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

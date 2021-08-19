import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/components/elemetOfEpisodesList.dart';
import 'package:rick_morty/components/episodes_list/bloc/screen_character_episodes_bloc.dart';
import 'package:rick_morty/components/episodes_list/bloc/screen_character_episodes_event.dart';
import 'package:rick_morty/components/episodes_list/bloc/screen_character_episodes_state.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/data/person_model.dart';
import 'package:rick_morty/screens/episodes/screen.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ListCharactersEpisodes extends StatelessWidget {
  ListCharactersEpisodes(this.person);

  Person person;
  List<Episode> list = [];

  @override
  Widget build(BuildContext context) {
    final bloc = ScreenCharacterEpisodesBloc();
    return BlocProvider<ScreenCharacterEpisodesBloc>(
      create: (BuildContext context) =>
          bloc..add(LoadingScreenCharacterEpisodesEvent()),
      child: BlocBuilder<ScreenCharacterEpisodesBloc,
          ScreenCharacterEpisodesState>(
        builder: (_, state) {
          if (state is LoadingScreenCharacterEpisodesState) {
            return LoadingScreen();
          }
          if (state is DataScreenCharacterEpisodesState) {
            for (int l = 0; l < person.episodes.length; l++) {
              for (int i = 0; i < state.episodesList.length; i++) {
                if (state.episodesList[i].id == person.episodes[l].id) {
                  list.add(state.episodesList[i]);
                } else {
                  null;
                }
              }
            }
            ;
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Эпизоды',
                          style: TextStyle(
                              fontSize: 20,
                              height: 28 / 20,
                              color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/',arguments: 2);
                        },
                        child: Text(
                          'Все эпизоды',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                  list.length,
                  (index) => ElementOfEpisodesList(true, list[index]),
                ),
              ],
            );
          }
          ;
        },
      ),
    );
  }
}

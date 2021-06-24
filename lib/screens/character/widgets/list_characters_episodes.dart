import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/components/elemetOfEpisodesList.dart';
import 'package:rick_morty/components/episodes_list/bloc/screen_character_episodes_bloc.dart';
import 'package:rick_morty/components/episodes_list/bloc/screen_character_episodes_event.dart';
import 'package:rick_morty/components/episodes_list/bloc/screen_character_episodes_state.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_state.dart';
import 'package:rick_morty/screens/episodes/screen.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ListCharactersEpisodes extends StatelessWidget {
  ListCharactersEpisodes(this.loadingEpisodesList);
String loadingEpisodesList;

  @override
  Widget build(BuildContext context) {
    final bloc = ScreenCharacterEpisodesBloc(loadingEpisodesList:loadingEpisodesList );
    return BlocProvider<ScreenCharacterEpisodesBloc>(
      create: (BuildContext context) => bloc..add(LoadingScreenCharacterEpisodesEvent()),
      child: BlocBuilder<ScreenCharacterEpisodesBloc, ScreenCharacterEpisodesState>(
        builder: (_, state) {
          if (state is LoadingScreenCharacterEpisodesState) {
            return LoadingScreen();
          }
          if (state is DataScreenCharacterEpisodesState) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
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
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ScreenEpisodes()));
                        },
                        child: Text(
                          'Все эпизоды',
                          style: ThemeText.fieldDescription,
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                  state.episodesList.length,
                  (index) => ElementOfEpisodesList(true, state.episodesList[index]),
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

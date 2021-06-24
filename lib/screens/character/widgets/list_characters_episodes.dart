import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/components/elemetOfEpisodesList.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/components/temporary_list_episodes.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_bloc.dart';
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_event.dart';
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_state.dart';
import 'package:rick_morty/screens/episodes/screen.dart';
import 'package:rick_morty/screens/splash_screen/screen.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

class ListCharactersEpisodes extends StatelessWidget {
  ListCharactersEpisodes(this.loadingEpisodesList);
String loadingEpisodesList;

  @override
  Widget build(BuildContext context) {
    final bloc = ScreenEpisodesBloc(isLoadOnly: true,loadingEpisodesList:loadingEpisodesList );
    return BlocProvider<ScreenEpisodesBloc>(
      create: (BuildContext context) => bloc..add(LoadingScreenEpisodesEvent()),
      child: BlocBuilder<ScreenEpisodesBloc, ScreenEpisodesState>(
        builder: (_, state) {
          if (state is LoadingScreenEpisodesState) {
            return LoadingScreen();
          }
          if (state is DataScreenEpisodesState) {
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

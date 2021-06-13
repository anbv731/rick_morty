import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/components/search.dart';
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_state.dart';
import 'package:rick_morty/screens/episodes/widgets/list_episodes.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

import 'package:flutter/material.dart';

import 'bloc/screen_episodes_bloc.dart';
import 'bloc/screen_episodes_event.dart';

class ScreenEpisodes extends StatelessWidget {
  final bloc = ScreenEpisodesBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScreenEpisodesBloc>(
      create: (BuildContext context) => bloc..add(LoadingScreenEpisodesEvent()),
      child: BlocBuilder<ScreenEpisodesBloc, ScreenEpisodesState>(
        builder: (_, state) {
          if (state is LoadingScreenEpisodesState) {
            return LoadingScreen();
          }
          if (state is DataScreenEpisodesState) {
            return


              DefaultTabController(
              length: 5,
              child: Scaffold(
                backgroundColor: ThemeColors.background,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: ThemeColors.background,
                  automaticallyImplyLeading: false,
                  title: Search('Найти эпизод', false),
                  bottom: TabBar(
                    isScrollable: true,
                    labelPadding:
                        EdgeInsets.only(bottom: 5, left: 15, right: 15),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.white,
                    indicatorPadding: EdgeInsets.only(top: 5, bottom: 2),
                    tabs: [
                      Text('СЕЗОН 1', style: ThemeText.season),
                      Text('СЕЗОН 2', style: ThemeText.season),
                      Text('СЕЗОН 3', style: ThemeText.season),
                      Text('СЕЗОН 4', style: ThemeText.season),
                      Text('СЕЗОН 5', style: ThemeText.season),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    ListEpisodes(state.episodesList),
                    ListEpisodes(state.episodesList),
                    ListEpisodes(state.episodesList),
                    ListEpisodes(state.episodesList),
                    ListEpisodes(state.episodesList),
                  ],
                ),
              ),
            );


          }
          if (state is ErrorScreenEpisodesState) {
            return const Icon(Icons.close, size: 200);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

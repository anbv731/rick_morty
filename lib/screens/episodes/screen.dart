import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/components/loading_screen.dart';
import 'package:rick_morty/components/search.dart';
import 'package:rick_morty/data/episode_model.dart';
import 'package:rick_morty/screens/episodes/bloc/screen_episodes_state.dart';
import 'package:rick_morty/screens/episodes/widgets/list_episodes.dart';
import 'package:rick_morty/theme/color_theme.dart';
import 'package:rick_morty/theme/text_theme.dart';

import 'package:flutter/material.dart';

import 'bloc/screen_episodes_bloc.dart';
import 'bloc/screen_episodes_event.dart';

class ScreenEpisodes extends StatelessWidget {
  final bloc = ScreenEpisodesBloc();
  List<Episode> season1=[];
  List<Episode> season2=[];
  List<Episode> season3=[];
  List<Episode> season4=[];
  List<Episode> season5=[];

  @override
  Widget build(BuildContext context) {
    Function(String) event = (String text) {
      bloc.add(SearchScreenEpisodesEvent(request:  text));
    };
    return BlocProvider<ScreenEpisodesBloc>(
      create: (BuildContext context) => bloc..add(LoadingScreenEpisodesEvent()),
      child: BlocBuilder<ScreenEpisodesBloc, ScreenEpisodesState>(
        builder: (_, state) {
          if (state is LoadingScreenEpisodesState) {
            return LoadingScreen();
          }
          if (state is DataScreenEpisodesState) {
            for (int i = 0; i < state.episodesList.length; i++) {
              if (state.episodesList[i].season == 1) {
                season1.add(state.episodesList[i]);
              } else if (state.episodesList[i].season == 2) {
                season2.add(state.episodesList[i]);
              } else if (state.episodesList[i].season == 3) {
                season3.add(state.episodesList[i]);
              } else if (state.episodesList[i].season == 4) {
                season4.add(state.episodesList[i]);
              } else {
                season5.add(state.episodesList[i]);
              }
              ;
            }
            ;

            return DefaultTabController(
              length: 5,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: Search('Найти эпизод', false,function: event,),
                  bottom: TabBar(
                    isScrollable: true,
                    labelPadding:
                        EdgeInsets.only(bottom: 5, left: 15, right: 15),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.white,
                    indicatorPadding: EdgeInsets.only(top: 5, bottom: 2),
                    tabs: [
                      Text('СЕЗОН 1', style: Theme.of(context).textTheme.headline5),
                      Text('СЕЗОН 2', style: Theme.of(context).textTheme.headline5),
                      Text('СЕЗОН 3', style: Theme.of(context).textTheme.headline5),
                      Text('СЕЗОН 4', style: Theme.of(context).textTheme.headline5),
                      Text('СЕЗОН 5', style: Theme.of(context).textTheme.headline5),
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: TabBarView(
                    children: [
                      ListEpisodes(season1),
                      ListEpisodes(season2),
                      ListEpisodes(season3),
                      ListEpisodes(season4),
                      ListEpisodes(season5),
                    ],
                  ),
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

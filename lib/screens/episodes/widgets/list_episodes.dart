import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/components/elemetOfEpisodesList.dart';
import 'package:rick_morty/data/episode_model.dart';


class ListEpisodes extends StatelessWidget {
  List<Episode> episodes;

  ListEpisodes(this.episodes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: episodes.length,
        itemBuilder: (_, index) {
          return ElementOfEpisodesList(false, episodes[index]);
        });
  }
}

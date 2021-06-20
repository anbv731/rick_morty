class Episode {
  int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  String created;

  Episode({this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created});

  Episode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    airDate = json['air_date'];
    episode = json['episode'];
    characters = json['characters'].cast<String>();
    url = json['url'];
    created = json['created'];
  }
}
// Future<List<Episode>> loadEpisode () async {
//   Response response = await http.get(
//     Uri.parse('https://rickandmortyapi.com/api/episode'),
//   );
//   List<Episode> episodes = [];
//   if (response.statusCode == 200) {
//     List<dynamic> episodesList = convert.jsonDecode(response.body)['episodes'];
//     for (var result in episodesList) {
//       Episode episode = Episode();
//       episode.id = result['id'];
//       episode.name = result['name'];
//       episode.airDate = result['airDate'];
//       episode.url = result['url'];
//       episode.episode = result['episode'];
//       episode.characters= result['characters'];
//       episode.created= result ['created'];
//       episodes.add(episode);
//     }
//
//     return episodes;
//   }

      // List<Episode> episodes = [
      //   Episode(id:1, name: 'Пилот',airDate: '2 декабря 2013' ),
      //   Episode(id:2, name: 'Пес газонокосильщик',airDate: '9 декабря 2013' ),
      //   Episode(id:3, name: 'Анатомический парк',airDate: '16 декабря 2013' ),
      //   Episode(id:4, name: 'М. Найт Шьямал-Инопланетяне!',airDate: '13 января 2014' ),
      //   Episode(id:5, name: 'Мисикс и разрушение',airDate: '20 января 2014' ),
      //   Episode(id:6, name: 'Напиток Рика №9',airDate: '20 января 2014' ),
      // ];
      // return episodes;


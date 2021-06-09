class Episode {
  int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  String created;

  Episode(
      {this.id,
      this.name,
      this.airDate,
      this.episode,
      this.characters,
      this.url,
      this.created});
}
List<Episode> loadEpisode (){

      List<Episode> episodes = [
        Episode(id:1, name: 'Пилот',airDate: '2 декабря 2013' ),
        Episode(id:2, name: 'Пес газонокосильщик',airDate: '9 декабря 2013' ),
        Episode(id:3, name: 'Анатомический парк',airDate: '16 декабря 2013' ),
        Episode(id:4, name: 'М. Найт Шьямал-Инопланетяне!',airDate: '13 января 2014' ),
        Episode(id:5, name: 'Мисикс и разрушение',airDate: '20 января 2014' ),
        Episode(id:6, name: 'Напиток Рика №9',airDate: '20 января 2014' ),
      ];
      return episodes;

}
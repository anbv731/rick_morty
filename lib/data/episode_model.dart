


class Episode {
  Episode({
    this.id,
    this.name,
    this.season,
    this.series,
    this.plot,
    this.premiere,
    this.imageName,
    this.characters,
  });

  String id;
  String name;
  int season;
  int series;
  String plot;
  DateTime premiere;
  String imageName;
  dynamic characters;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    id: json["id"],
    name: json["name"],
    season: json["season"],
    series: json["series"],
    plot: json["plot"],
    premiere: DateTime.parse(json["premiere"]),
    imageName: json["imageName"],
    characters: json["characters"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "season": season,
    "series": series,
    "plot": plot,
    "premiere": premiere.toIso8601String(),
    "imageName": imageName,
    "characters": characters,
  };
}

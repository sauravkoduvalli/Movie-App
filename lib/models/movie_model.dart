// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class MoviewModelClass {
  MoviewModelClass({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    // required this.network,
    required this.webChannel,
    required this.dvdCountry,
    // required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  int id;
  String url;
  String name;
  String type;
  String language;
  List<String> genres;
  String status;
  int runtime;
  int averageRuntime;
  String premiered;
  String ended;
  String officialSite;
  Schedule schedule;
  Rating rating;
  int weight;
  dynamic webChannel;
  dynamic dvdCountry;
  // Externals externals;
  MovieImage image;
  String summary;
  int updated;
  Links links;

  factory MoviewModelClass.fromJson(Map<String, dynamic> json) => MoviewModelClass(
        id: json["id"],
        url: json["url"] ?? "",
        name: json["name"],
        type: json["type"] ?? "",
        language: json["language"] ?? "",
        genres: List<String>.from(json["genres"].map((x) => x)),
        status: json["status"] ?? "",
        runtime: json["runtime"] ?? 0,
        averageRuntime: json["averageRuntime"] ?? 0,
        premiered: json["premiered"] ?? "",
        ended: json["ended"] ?? "",
        officialSite: json["officialSite"] ?? "",
        schedule: Schedule.fromJson(json["schedule"]),
        rating: Rating.fromJson(json["rating"]),
        weight: json["weight"] ?? 0,
        // network: Network.fromJson(json["network"]),
        webChannel: json["webChannel"] ?? "",
        dvdCountry: json["dvdCountry"] ?? "",
        // externals: Externals.fromJson(json["externals"]),
        image: MovieImage.fromJson(json["image"]),
        summary: json["summary"] ?? "",
        updated: json["updated"] ?? 0,
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered": premiered,
        "ended": ended,
        "officialSite": officialSite,
        "schedule": schedule.toJson(),
        "rating": rating.toJson(),
        "weight": weight,
        // "network": network.toJson(),
        "webChannel": webChannel,
        "dvdCountry": dvdCountry,
        // "externals": externals.toJson(),
        "image": image.toJson(),
        "summary": summary,
        "updated": updated,
        "_links": links.toJson(),
      };
}

class Externals {
  Externals({
    required this.tvrage,
    required this.thetvdb,
    required this.imdb,
  });

  int tvrage;
  int thetvdb;
  String imdb;

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"],
        thetvdb: json["thetvdb"],
        imdb: json["imdb"],
      );

  Map<String, dynamic> toJson() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
      };
}

class MovieImage {
  MovieImage({
    required this.medium,
    required this.original,
  });

  String medium;
  String original;

  factory MovieImage.fromJson(Map<String, dynamic> json) => MovieImage(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  Links({
    required this.self,
    required this.previousepisode,
  });

  Previousepisode self;
  Previousepisode previousepisode;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Previousepisode.fromJson(json["self"]),
        previousepisode: Previousepisode.fromJson(json["previousepisode"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "previousepisode": previousepisode.toJson(),
      };
}

class Previousepisode {
  Previousepisode({
    required this.href,
  });

  String href;

  factory Previousepisode.fromJson(Map<String, dynamic> json) =>
      Previousepisode(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Network {
  Network({
    required this.id,
    required this.name,
    required this.country,
  });

  int id;
  String name;
  Country country;

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"] ?? "",
        country: Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country.toJson(),
      };
}

class Country {
  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  String name;
  String code;
  String timezone;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}

class Rating {
  Rating({
    required this.average,
  });

  double average;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"] == null ? 0.0 : json["average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "average": average,
      };
}

class Schedule {
  Schedule({
    required this.time,
    required this.days,
  });

  String time;
  List<String> days;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: List<String>.from(json["days"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "days": List<dynamic>.from(days.map((x) => x)),
      };
}

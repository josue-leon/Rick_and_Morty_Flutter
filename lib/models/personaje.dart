import 'dart:convert';

Personaje PersonajeFromJson(String str) => Personaje.fromJson(json.decode(str));

String PersonajeToJson(Personaje data) => json.encode(data.toJson());

class Personaje {

  Personaje({
    required this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  int id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Map<String, dynamic>? origin;
  Map<String, dynamic>? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  factory Personaje.fromJson(Map<String, dynamic> json) => Personaje(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"],
    type: json["type"],
    gender: json["gender"],
    origin: json["origin"],
    location: json["location"],
    image: json["image"],
    episode: List<String>.from(json["episode"].map((x) => x)),
    url: json["url"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "species": species,
    "type": type,
    "gender": gender,
    "origin": origin,
    "location": location,
    "image": image,
    "episode": List<dynamic>.from(episode!.map((x) => x)),
    "url": url,
    "created": created?.toIso8601String(),
  };
}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

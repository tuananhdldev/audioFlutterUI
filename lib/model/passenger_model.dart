// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.totalPassengers,
    this.totalPages,
    this.data,
  });

  int? totalPassengers;
  int? totalPages;
  List<Passenger>? data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        totalPassengers: json["totalPassengers"],
        totalPages: json["totalPages"],
        data: List<Passenger>.from(
            json["data"].map((x) => Passenger.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers,
        "totalPages": totalPages,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Passenger {
  Passenger({
    required this.id,
    this.name,
    this.trips,
    this.airline,
    this.v,
  });

  String id;
  String? name;
  int? trips;
  Airline? airline;
  int? v;

  factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        id: json["_id"],
        name: json["name"],
        trips: json["trips"],
        airline: Airline.fromJson(json["airline"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "trips": trips,
        "airline": airline?.toJson(),
        "__v": v,
      };
}

class Airline {
  Airline({
    required this.id,
    required this.name,
    this.country,
    this.logo,
    this.slogan,
    this.headQuaters,
    this.website,
    this.established,
  });

  int id;
  String name;
  String? country;
  String? logo;
  String? slogan;
  String? headQuaters;
  String? website;
  String? established;

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        slogan: json["slogan"],
        headQuaters: json["head_quaters"],
        website: json["website"],
        established: json["established"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "slogan": slogan,
        "head_quaters": headQuaters,
        "website": website,
        "established": established,
      };
}

import 'dart:convert';

List<Pet> petsFromJson(String str) => List<Pet>.from(json.decode(str).map((x) => Pet.fromJson(x)));

String petsToJson(List<Pet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pet {
  Pet({
    required this.name,
    required this.breed,
  });

  String name;
  String breed;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    name: json["name"],
    breed: json["breed"] ?? "No breed specified",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "breed": breed,
  };
}

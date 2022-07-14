// To parse this JSON data, do
//
//     final nameAge = nameAgeFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

NameAge nameAgeFromJson(String str) => NameAge.fromJson(json.decode(str));

String nameAgeToJson(NameAge data) => json.encode(data.toJson());

class NameAge {
  NameAge({
    required this.name,
    required this.age,
    required this.count,
  });

  String name;
  int age;
  int count;

  factory NameAge.fromJson(Map<String, dynamic> json) => NameAge(
        name: json["name"],
        age: json["age"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "count": count,
      };
}

class GetNameAgeService {
  final String name;
  GetNameAgeService(this.name);
  Future<NameAge> getNameAge() async {
    final response = await get(Uri.parse('https://api.agify.io/?name=$name'));
    final namedetail = nameAgeFromJson(response.body);
    return namedetail;
  }
}

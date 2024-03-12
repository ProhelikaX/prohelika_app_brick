import 'dart:convert';

import 'entity.dart';

class Person extends Entity<int> {
  String name;
  int age;

  Person({
    super.id,
    required this.name,
    required this.age,
  });

  factory Person.fromMap(json) => Person(
        id: json['id'],
        name: json['name'],
        age: json['age'],
      );

  factory Person.fromJson(String json) => Person.fromMap(
        jsonDecode(json),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'age': age,
      };

  String toJson() => jsonEncode(toMap());
}

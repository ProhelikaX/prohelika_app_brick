import 'package:{{name.snakeCase()}}_domain/entities/person.dart';

class PersonCreateDto {
  final String name;
  final int age;

  PersonCreateDto({required this.name, required this.age});

  Person toEntity() => Person(name: name, age: age);
}

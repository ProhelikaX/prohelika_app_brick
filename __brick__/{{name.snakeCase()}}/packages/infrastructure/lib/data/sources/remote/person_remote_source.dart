import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:{{name.snakeCase()}}_domain/entities/person.dart';

abstract class PersonRemoteSource {
  Future<Person> create(Person person);

  Future<List<Person>> getAll();

  Future<void> delete(Person entity);

  Future<Person> get(int id);

  Future<Person> update(Person entity);
}

class PersonRemoteSourceImpl implements PersonRemoteSource {
  final Dio _dio;

  PersonRemoteSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Person> create(Person person) async {
    var headers = {'Content-Type': 'application/json'};

    var response = await _dio.request(
      '/person',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: json.encode(person.toJson()),
    );

    if (response.statusCode == 200) {
      return Person.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to create person');
    }
  }

  @override
  Future<List<Person>> getAll() async {
    var response = await _dio.request(
      '/person',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      return (List<Person>.from(response.data.map((x) => Person.fromMap(x))));
    } else {
      throw Exception('Failed to load persons');
    }
  }

  @override
  Future<void> delete(Person entity) async {
    var headers = {'Content-Type': 'application/json'};

    var response = await _dio.request(
      '/person/${entity.id}',
      options: Options(
        method: 'DELETE',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete person');
    }
  }

  @override
  Future<Person> get(int id) async {
    var response = await _dio.request(
      '/person/$id',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      return Person.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to load person');
    }
  }

  @override
  Future<Person> update(Person entity) async {
    var headers = {'Content-Type': 'application/json'};

    var response = await _dio.request(
      '/person/${entity.id}',
      options: Options(
        method: 'PUT',
        headers: headers,
      ),
      data: json.encode(entity.toJson()),
    );

    if (response.statusCode == 200) {
      return Person.fromJson(json.decode(response.data));
    } else {
      throw Exception('Failed to update person');
    }
  }
}

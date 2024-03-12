import 'package:{{name.snakeCase()}}_domain/entities/person.dart';
import 'package:{{name.snakeCase()}}_domain/repositories/person_repository.dart';

import '../data/sources/remote/person_remote_source.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonRemoteSource _personRemoteSource;

  PersonRepositoryImpl({required PersonRemoteSource personRemoteSource})
      : _personRemoteSource = personRemoteSource;
  @override
  Future<bool> any(bool Function(Person? entity) expression) async {
    List<Person> persons = await _personRemoteSource.getAll();

    return persons.any(expression);
  }

  @override
  Future<int> count() async {
    List<Person> persons = await _personRemoteSource.getAll();

    return persons.length;
  }

  @override
  Future<int> countBy(bool Function(Person? entity) expression) async {
    List<Person> persons = await _personRemoteSource.getAll();

    return persons.where(expression).length;
  }

  @override
  Future<Person> create(Person entity) async {
    return await _personRemoteSource.create(entity);
  }

  @override
  Future<void> delete(Person entity) async {
    return await _personRemoteSource.delete(entity);
  }

  @override
  Future<Person> get(int id) async {
    return await _personRemoteSource.get(id);
  }

  @override
  Future<List<Person>> getAll() async {
    return await _personRemoteSource.getAll();
  }

  @override
  Future<List<Person>> getAllBy(
    bool Function(Person? entity) expression,
  ) async {
    List<Person> persons = await _personRemoteSource.getAll();

    return persons.where(expression).toList();
  }

  @override
  Future<Person?> getBy(bool Function(Person? entity) expression) async {
    List<Person> persons = await _personRemoteSource.getAll();

    return persons.firstWhere(expression);
  }

  @override
  Future<Person> update(Person entity) async {
    return await _personRemoteSource.update(entity);
  }
}

import 'package:mediatr/mediatr.dart';
import 'package:{{name.snakeCase()}}_domain/entities/person.dart';
import 'package:{{name.snakeCase()}}_domain/repositories/person_repository.dart';

class GetAllPerson extends IRequest<List<Person>> {
  GetAllPerson();
}

class GetAllPersonHandler extends IRequestHandler<List<Person>, GetAllPerson> {
  final PersonRepository repository;
  GetAllPersonHandler({required this.repository});

  @override
  Future<List<Person>> call(GetAllPerson request) {
    return repository.getAll();
  }
}

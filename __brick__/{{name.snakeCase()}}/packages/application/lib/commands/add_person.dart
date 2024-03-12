import 'package:mediatr/mediatr.dart';
import 'package:{{name.snakeCase()}}_domain/entities/person.dart';
import 'package:{{name.snakeCase()}}_domain/repositories/person_repository.dart';

import '../dtos/person_create_dto.dart';

class AddPerson extends IRequest<Person> {
  final PersonCreateDto dto;

  AddPerson(this.dto);
}

class AddPersonHandler implements IRequestHandler<Person, AddPerson> {
  final PersonRepository repository;

  AddPersonHandler({required this.repository});

  @override
  Future<Person> call(AddPerson request) async {
    return repository.create(request.dto.toEntity());
  }
}

import 'package:mediatr/mediatr.dart';
import 'package:{{name.snakeCase()}}_domain/entities/person.dart';
import 'package:{{name.snakeCase()}}_infrastructure/infrastructure.dart';

import 'commands/add_person.dart';
import 'queries/get_all_person.dart';

final mediator = Mediator(Pipeline());

abstract class ApplicationDependency {
  static Future<void> setUp() async {
    mediator.registerHandler<Person, AddPerson, AddPersonHandler>(
      () => AddPersonHandler(repository: getIt()),
    );

    mediator.registerHandler<List<Person>, GetAllPerson, GetAllPersonHandler>(
      () => GetAllPersonHandler(repository: getIt()),
    );
  }
}

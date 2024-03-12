import 'package:equatable/equatable.dart';
import 'package:{{name.snakeCase()}}_application/commands/add_person.dart';
import 'package:{{name.snakeCase()}}_application/dtos/person_create_dto.dart';
import 'package:{{name.snakeCase()}}_application/queries/get_all_person.dart';
import 'package:{{name.snakeCase()}}_domain/entities/person.dart';

import '../../../app_export.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonInitial()) {
    on<CreatePersonEvent>((event, emit) async {
      try {
        await mediator.send(AddPerson(event.person));

        add(GetAllPersonsEvent());
      } catch (e) {
        emit(PersonError(message: e.toString()));
      }
    });

    on<GetAllPersonsEvent>((event, emit) async {
      try {
        var persons =
            await mediator.send<List<Person>, GetAllPerson>(GetAllPerson());

        emit(PersonSuccess(persons));
      } catch (e) {
        emit(PersonError(message: e.toString()));
      }
    });
  }
}

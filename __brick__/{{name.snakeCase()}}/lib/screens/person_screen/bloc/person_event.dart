part of 'person_bloc.dart';

sealed class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

final class CreatePersonEvent extends PersonEvent {
  final PersonCreateDto person;

  CreatePersonEvent(this.person);
}

final class GetAllPersonsEvent extends PersonEvent {
  @override
  List<Object> get props => [];
}

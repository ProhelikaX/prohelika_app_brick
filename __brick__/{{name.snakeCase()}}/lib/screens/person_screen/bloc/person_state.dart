part of 'person_bloc.dart';

sealed class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

final class PersonInitial extends PersonState {}

final class PersonError extends PersonState {
  final String message;
  const PersonError({required this.message});
}

final class PersonSuccess extends PersonState {
  final List<Person> persons;
  const PersonSuccess(this.persons);
}

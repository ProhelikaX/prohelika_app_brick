import '../entities/person.dart';
import 'repository.dart';

abstract class PersonRepository extends CrudRepository<Person, int> {
  Future<List<Person>> getAllBy(bool Function(Person? entity) expression);
}

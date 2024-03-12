import '../entities/entity.dart';

abstract class Repository {}

abstract class CrudRepository<T extends Entity<TId>, TId> {
  Future<T> create(T entity);
  Future<T?> get(TId id);
  Future<T?> getBy(bool Function(T? entity) expression);
  Future<List<T>> getAll();
  Future<List<T>> getAllBy(bool Function(T? entity) expression);
  Future<T> update(T entity);
  Future<void> delete(T entity);

  Future<int> count();

  Future<int> countBy(bool Function(T? entity) expression);

  Future<bool> any(bool Function(T? entity) expression);
}

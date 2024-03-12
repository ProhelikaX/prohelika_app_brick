abstract class Entity<TId> {
  TId? id;

  Entity({this.id});
}

abstract class AuditableEntity<TId, TUser> extends Entity<TId> {
  DateTime createdAt;
  TUser? createdBy;
  TUser? updatedBy;
  DateTime updatedAt;
  bool isDeleted;
  DateTime? deletedAt;
  TUser? deletedBy;

  AuditableEntity({
    super.id,
    DateTime? createdAt,
    this.createdBy,
    this.updatedBy,
    DateTime? updatedAt,
    this.isDeleted = false,
    this.deletedAt,
    this.deletedBy,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  void markAsDeleted([TUser? deletedBy]) {
    isDeleted = true;
    deletedAt = DateTime.now();
    this.deletedBy = deletedBy;
  }
}

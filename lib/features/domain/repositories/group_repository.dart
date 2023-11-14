import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class GroupRepository {
  Future<void> add(GroupsCompanion group);

  Future<void> delete(int id);

  Future<List<Group>> getAll();
}

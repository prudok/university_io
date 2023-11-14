import 'package:university_io/features/data/datasource/database/university_db.dart';

abstract class ProjectRepository {
  Future<void> add(ProjectsCompanion project);
  Future<void> delete(int id);
  Future<List<Project>> getAll();
}

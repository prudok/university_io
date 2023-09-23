import 'package:education_portal/features/data/datasource/database/university_db.dart';

abstract class ProjectRepository {
  Future<void> add(ProjectsCompanion project);
  Future<void> delete(int id);
  Future<Project> get(int id);
  Future<List<Project>> getAll();
}

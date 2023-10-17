import 'package:education_portal/features/data/datasource/database/university_db.dart';
import 'package:education_portal/features/data/datasource/university_api.dart';

class UniversityAPIImpl {
  UniversityAPIImpl(this.client);

  final UniversityAPI client;

  Future<List<Student>> loadStudent() {
    try {
      return client.loadStudents();
    } on Object catch (error, stackTrace) {
      throw Error.throwWithStackTrace(
        error,
        stackTrace,
      );
    }
  }
}

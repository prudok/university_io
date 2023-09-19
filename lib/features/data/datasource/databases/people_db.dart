import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:education_portal/features/data/datasource/tables/tables.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'people_db.g.dart';

@singleton
@DriftDatabase(tables: [Teachers, Students])
class PeopleDatabase extends _$PeopleDatabase {
  PeopleDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Teacher>> get teachersList => select(teachers).get();
  Future<List<Student>> get studentsList => select(students).get();

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  Future<int> deleteTeacher(int id) async {
    return (delete(teachers)..where((t) => t.id.equals(id))).go();
  }

  Future<int> deleteStudent(int id) async {
    return (delete(students)..where((t) => t.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'people.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

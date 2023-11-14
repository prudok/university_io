import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:university_io/features/data/datasource/tables/tables.dart';

part 'university_db.g.dart';

@singleton
@DriftDatabase(
  tables: [
    AccuracyTables,
    Alliances,
    Books,
    Classrooms,
    DepartmentTeacherLinks,
    Events,
    Exams,
    GTOs,
    Groups,
    Libraries,
    Marks,
    News,
    Projects,
    Schedules,
    SportActivities,
    SportTeams,
    SubjectTeacherLinks,
    Subjects,
    Syllabus,
    Torches,
    TypesOfActivities,
    UniversityDormitories,
    Volunteering,
    Teachers,
    Students,
    Departments,
  ],
)
class UniversityDatabase extends _$UniversityDatabase {
  UniversityDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  // GET queries
  Future<List<Teacher>> get teachersList => select(teachers).get();

  Future<List<Student>> get studentsList => select(students).get();

  Future<List<Event>> get eventsList => select(events).get();

  Future<List<Project>> get projectsList => select(projects).get();

  Future<List<Department>> get departmentsList => select(departments).get();

  Future<List<AccuracyTable>> get accuracyTablesList => select(accuracyTables).get();

  Future<List<Alliance>> get alliancesList => select(alliances).get();

  Future<List<Book>> get booksList => select(books).get();

  Future<List<Classroom>> get classroomsList => select(classrooms).get();

  Future<List<Exam>> get examsList => select(exams).get();

  Future<List<Group>> get groupsList => select(groups).get();

  Future<List<GTO>> get gTOsList => select(gTOs).get();

  Future<List<Library>> get librariesList => select(libraries).get();

  Future<List<Mark>> get marksList => select(marks).get();

  Future<List<ONews>> get newsList => select(news).get();

  Future<List<Schedule>> get schedulesList => select(schedules).get();

  Future<List<SportActivity>> get sportActivitiesList => select(sportActivities).get();

  Future<List<SportTeam>> get sportTeamsList => select(sportTeams).get();

  Future<List<Subject>> get subjectsList => select(subjects).get();

  Future<List<Syllabu>> get syllabusesList => select(syllabus).get();

  Future<List<Torch>> get torchesList => select(torches).get();

  Future<List<TypeOfActivity>> get typesOfActivitiesList => select(typesOfActivities).get();

  Future<List<UniversityDormitory>> get universityDormitoriesList => select(universityDormitories).get();

  Future<List<OVolunteering>> get volunteeringList => select(volunteering).get();

  Future<List<DepartmentTeacherLink>> get departmentTeacherLinksList => select(departmentTeacherLinks).get();

  // DELETE queries
  Future<int> deleteTeacher(int id) async => (delete(teachers)..where((t) => t.id.equals(id))).go();

  Future<int> deleteStudent(int id) async => (delete(students)..where((s) => s.id.equals(id))).go();

  Future<int> deleteEvent(int id) async => (delete(events)..where((e) => e.id.equals(id))).go();

  Future<int> deleteProject(int id) async => (delete(projects)..where((p) => p.id.equals(id))).go();

  Future<int> deleteDepartment(int id) async => (delete(departments)..where((d) => d.id.equals(id))).go();

  Future<int> deleteAccuracyTable(int id) async => (delete(accuracyTables)..where((d) => d.id.equals(id))).go();

  Future<int> deleteAlliance(int id) async => (delete(alliances)..where((d) => d.id.equals(id))).go();

  Future<int> deleteBook(int id) async => (delete(books)..where((d) => d.id.equals(id))).go();

  Future<int> deleteClassroom(int id) async => (delete(classrooms)..where((d) => d.id.equals(id))).go();

  Future<int> deleteDepartmentTeacherLink(int id) async =>
      (delete(departmentTeacherLinks)..where((d) => d.id.equals(id))).go();

  Future<int> deleteExam(int id) async => (delete(exams)..where((d) => d.id.equals(id))).go();

  Future<int> deleteGroup(int id) async => (delete(groups)..where((d) => d.id.equals(id))).go();

  Future<int> deleteGTO(int id) async => (delete(gTOs)..where((d) => d.id.equals(id))).go();

  Future<int> deleteLibrary(int id) async => (delete(libraries)..where((d) => d.id.equals(id))).go();

  Future<int> deleteMark(int id) async => (delete(marks)..where((d) => d.id.equals(id))).go();

  Future<int> deleteONews(int id) async => (delete(news)..where((d) => d.id.equals(id))).go();

  Future<int> deleteSchedule(int id) async => (delete(schedules)..where((d) => d.id.equals(id))).go();

  Future<int> deleteSportTeam(int id) async => (delete(sportTeams)..where((d) => d.id.equals(id))).go();

  Future<int> deleteSubject(int id) async => (delete(subjects)..where((s) => s.id.equals(id))).go();

  Future<int> deleteSyllabus(int id) async => (delete(syllabus)..where((s) => s.id.equals(id))).go();

  Future<int> deleteTorch(int id) async => (delete(torches)..where((d) => d.id.equals(id))).go();

  Future<int> deleteUniversityDormitory(int id) async {
    return (delete(universityDormitories)..where((s) => s.id.equals(id))).go();
  }

  Future<int> deleteVolunteering(int id) async => (delete(volunteering)..where((s) => s.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = File('university_db');
    final file = File(path.join(dbFolder.path, 'university_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

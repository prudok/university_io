import 'package:drift/drift.dart';
import 'package:education_portal/features/data/datasource/tables/tables.dart';

@DataClassName('TypeOfActivity')
class TypesOfActivities extends Table {
  IntColumn get studentId => integer().references(Students, #id)();
  IntColumn get groupId => integer().references(Groups, #id)();
  IntColumn get volunteeringId => integer().references(Volunteering, #id)();
  IntColumn get torchId => integer().references(Torches, #id)();
}

import 'package:drift/drift.dart';

@DataClassName('ONews')
class News extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get publicationDate => text()();
}

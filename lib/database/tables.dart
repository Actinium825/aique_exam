import 'package:drift/drift.dart';

@DataClassName('QubeItem')
class QubeItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get date => text()();
  TextColumn get time => text()();
  TextColumn get identification => text().unique()();
  TextColumn get location => text()();
  TextColumn get receiver => text()();
}

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:qube_project/database/tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [QubeItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() => driftDatabase(name: 'my_database');

  Stream<List<QubeItem>> allIQubeItems() => select(qubeItems).watch();

  Stream<int> qubeItemsCount() => qubeItems.count().watchSingle();

  Future<void> insertMockData() async {
    final allQubeItems = await select(qubeItems).get();

    if (allQubeItems.isNotEmpty) return;

    batch(
      (batch) {
        batch.insertAll(
          qubeItems,
          [
            QubeItemsCompanion.insert(
              date: 'May 2, 2024',
              identification: '#1230ASD120',
              location: 'Greenbelt tower 1',
              receiver: 'Mr. Klean 1',
              time: '7:00 PM',
            ),
            QubeItemsCompanion.insert(
              date: 'May 2, 2024',
              identification: '#1230ASD121',
              location: 'Greenbelt tower 1',
              receiver: 'Mr. Klean 1',
              time: '7:30 PM',
            ),
          ],
        );
      },
    );
  }
}

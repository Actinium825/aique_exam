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
      (batch) => batch.insertAll(
        qubeItems,
        [
          QubeItemsCompanion.insert(
            identification: '#1230ASD120',
            location: 'Greenbelt tower 1',
            receiver: 'Mr. Klean 1',
            deliveryDate: DateTime(2024, 5, 2, 19),
          ),
          QubeItemsCompanion.insert(
            identification: '#1230ASD121',
            location: 'Greenbelt tower 1',
            receiver: 'Mr. Klean 1',
            deliveryDate: DateTime(2024, 5, 2, 19, 30),
          ),
          QubeItemsCompanion.insert(
            identification: '#1230ASD122',
            location: 'Greenbelt tower 1',
            receiver: 'Mr. Klean 2',
            deliveryDate: DateTime(2024, 5, 3, 18),
          ),
          QubeItemsCompanion.insert(
            identification: '#1230ASD123',
            location: 'Greenbelt tower 1',
            receiver: 'Mr. Klean 3',
            deliveryDate: DateTime(2024, 10, 3, 13),
          ),
        ],
      ),
    );
  }
}

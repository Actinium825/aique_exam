import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/home.dart';

late final AppDatabase appDatabase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appDatabase = AppDatabase();

  await appDatabase.insertMockData();

  runApp(const Home());
}

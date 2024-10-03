import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/feature/home/home_connector.dart';
import 'package:qube_project/state/app_state.dart';

late final AppDatabase appDatabase;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appDatabase = AppDatabase();

  await appDatabase.insertMockData();

  runApp(
    StoreProvider<AppState>(
      store: Store<AppState>(
        initialState: const AppState(),
        actionObservers: [if (kDebugMode) ConsoleActionObserver<AppState>()],
      ),
      child: const HomeConnector(),
    ),
  );
}

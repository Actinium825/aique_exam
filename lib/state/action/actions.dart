import 'package:async_redux/async_redux.dart';
import 'package:qube_project/state/app_state.dart';

/// Reusable loading page state for actions
abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({required this.actionKey});

  final String actionKey;

  @override
  void before() => dispatch(WaitAction.add(actionKey));

  @override
  void after() => dispatch(WaitAction.remove(actionKey));
}


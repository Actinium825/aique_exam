import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qube_project/database/database.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(Wait.empty) @JsonKey(includeFromJson: false, includeToJson: false) Wait wait,
    @Default(null) bool? isSuccessful,
    @Default(null) QubeItem? selectedQube,
  }) = _AppState;
}

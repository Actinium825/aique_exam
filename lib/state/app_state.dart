import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(Wait.empty) @JsonKey(includeFromJson: false, includeToJson: false) Wait wait,
    @Default(null) bool? isSuccessful,
  }) = _AppState;
}

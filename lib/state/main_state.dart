import 'package:flutter_testing/model/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState(Profile? profile) = _MainState;

  factory MainState.init() {
    return const MainState(null);
  }
}

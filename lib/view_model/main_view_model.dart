import 'package:dio/dio.dart';
import 'package:flutter_testing/extension/dio_error.dart';
import 'package:flutter_testing/hooks/use_error_dialog.dart';
import 'package:flutter_testing/repository/github_repository.dart';
import 'package:flutter_testing/repository/github_repository_impl.dart';
import 'package:flutter_testing/state/main_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainViewModelNotifier extends StateNotifier<MainState> {
  MainViewModelNotifier(this._ref) : super(MainState.init());

  final Ref _ref;

  late final GithubRepository _repository = _ref.read(githubRepositoryProvider);

  void getProfile(String userId) async {
    final profile =
        await _repository.getProfile(userId: userId).catchError((error) {
      state = MainState.init();
      if(error is DioError){
        useErrorDialog(_ref,error.errorMessage);
      }else{
        throw Exception(error);
      }

    });

    state = state.copyWith(profile: profile);
  }
}

final mainViewModelProvider =
    StateNotifierProvider<MainViewModelNotifier, MainState>((ref) {
  return MainViewModelNotifier(ref);
});

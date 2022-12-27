import 'package:flutter_testing/data_source/github_data_source.dart';
import 'package:flutter_testing/model/profile.dart';
import 'package:flutter_testing/repository/github_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubRepositoryProvider = Provider.autoDispose<GithubRepository>((ref) {
  return GithubRepositoryImpl(ref);
});

class GithubRepositoryImpl implements GithubRepository {
  GithubRepositoryImpl(this.ref);

  final Ref ref;

  late final dataSource = ref.read(githubDataSourceProvider);

  @override
  Future<Profile> getProfile({required String userId}) async {
    return await dataSource.getProfile(userId: userId);
  }
}

import 'package:flutter_testing/data_source/app_dio.dart';
import 'package:flutter_testing/model/profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'github_data_source.g.dart';

final githubDataSourceProvider = Provider.autoDispose((ref) {
  return GithubDataSource(ref);
});

@RestApi(baseUrl: "https://api.github.com")
abstract class GithubDataSource {
  factory GithubDataSource(Ref ref) => _GithubDataSource(ref.read(dioProvider));

  @GET("/users/{userId}")
  Future<Profile> getProfile({@Path() required String userId});
}

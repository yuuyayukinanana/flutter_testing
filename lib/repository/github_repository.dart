import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/profile.dart';

abstract class GithubRepository {
  Future<Profile> getProfile({required String userId});
}

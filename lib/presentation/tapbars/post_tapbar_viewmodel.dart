import 'dart:async';

import 'package:city_feed/core/services/api_service.dart';
import 'package:city_feed/presentation/tapbars/post_tapbar_model.dart';
import 'package:city_feed/presentation/tapbars/post_tapbar_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final skipProvider = StateProvider<int>((_) => 0);

final tapbarRepoProvider = Provider<PostTapbarRepository>((ref) {
  return PostTapbarRepository(apiService: ApiService());
});

class PostTapbarViewmodel extends AsyncNotifier<List<PostTapbarModel>> {
  @override
  FutureOr<List<PostTapbarModel>> build() {
    final service = ref.read(tapbarRepoProvider);
    final skipData = ref.read(skipProvider);
    return service.getApiData(skipData: skipData);
  }

  Future<void> refreshData() async {
    ref.read(skipProvider.notifier).state += 10;
    final service = ref.read(tapbarRepoProvider);
    final skipData = ref.read(skipProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return service.getApiData(skipData: skipData);
    });
  }
}

final postTapbarAsyncProvider =
    AsyncNotifierProvider<PostTapbarViewmodel, List<PostTapbarModel>>(
      PostTapbarViewmodel.new,
    );

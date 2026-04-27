import 'dart:async';

import 'package:city_feed/core/services/api_service.dart';
import 'package:city_feed/presentation/tapbars/post_tapbar_model.dart';
import 'package:city_feed/presentation/tapbars/post_tapbar_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final skipProvider = StateProvider<int>((_) => 0);

final loadMoreLoader = StateProvider<bool>((_) => false);

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

  Future<void> loadMore() async {
    ref.read(loadMoreLoader.notifier).state = true;
    final currentSkip = ref.read(skipProvider);

  
    ref.read(skipProvider.notifier).state = currentSkip + 3;

    final service = ref.read(tapbarRepoProvider);
    final newSkip = ref.read(skipProvider);

  
    final oldData = state.value ?? [];

   
    final newData = await AsyncValue.guard(
      () => service.getApiData(skipData: newSkip),
    );


    if (newData.hasValue) {
      state = AsyncData([...oldData, ...newData.value!]);
      ref.read(loadMoreLoader.notifier).state = false;
    } else if (newData.hasError) {
      state = AsyncError(newData.error!, newData.stackTrace!);
      ref.read(loadMoreLoader.notifier).state = false;
    }
  }
}

final postTapbarAsyncProvider =
    AsyncNotifierProvider<PostTapbarViewmodel, List<PostTapbarModel>>(
      PostTapbarViewmodel.new,
    );

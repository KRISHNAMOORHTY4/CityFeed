import 'package:city_feed/core/services/location_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = FutureProvider<String?>((ref) async {
  return await LocationService.getCurrentCity();
});

import 'package:city_feed/core/services/api_service.dart';
import 'package:city_feed/presentation/tapbars/post_tapbar_model.dart';

class PostTapbarRepository {
  final ApiService apiService;

  PostTapbarRepository({required this.apiService});

  Future<List<PostTapbarModel>> getApiData({required int skipData}) async {
    try {
      final url = "https://dummyjson.com/products?limit=10&skip=$skipData";
      final res = await apiService.getData(url: url);

      return (res['products'] as List).map((cur){
        return PostTapbarModel.fromJson(cur);
      }).toList();
    } catch (e) {
      print("MLLLLLL");
      throw Exception("$e");
    }
  }
}

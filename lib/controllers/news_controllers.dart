import 'package:advansio_test_mobile/api_requests/api_requests.dart';
import 'package:advansio_test_mobile/model/news_model.dart';
import 'package:riverpod_annotation/river';

@riverpod
class NewsControllers extends $NewsControllers {
  Future<List<AllNewsModel>> build() async {
    return _fecthNews();
  }

  final String apiKey =
      "https://newsdata.io/api/1/latest?apikey=pub_db4dae0a278c44b2a7b55280dcb33d43&country=ng";

  Future<List<AllNewsModel>> _fecthNews() async {
    final response = await ApiRequests(key: apiKey).getRequst();
    if (response == "failed") {
      throw Exception('Failed to fetch news.');
    }

    return (response['data'] as List)
        .map((e) => AllNewsModel.fromJson(e))
        .toList();
  }
}



/*https://gemini.google.com/app/bb9cdce55d40788d*/
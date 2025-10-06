import 'package:advansio_test_mobile/services/api_services.dart';
import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/model/news_model.dart';
import 'package:advansio_test_mobile/shared_state/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalRepository = Provider((ref) => GlobalRepository(ref));

class GlobalRepository {
  final Ref ref;
  GlobalRepository(this.ref);
  Future<void> fetchNews(String countrySuffix) async {
    var response = await ApiServices(
            key: "$newsRoute$countrySuffix", showProgressLoader: false)
        .getRequst(isFull: true);
    if (response == "failed") {
      return;
    }
    ref.read(appState).setNew(
        countrySuffix,
        (response["results"] as List)
            .map((e) => AllNewsModel.fromJson(e))
            .toList());
  }
}

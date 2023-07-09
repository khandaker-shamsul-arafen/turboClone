import 'dart:convert';

import 'package:get/get.dart';
import 'package:turbo_coone1/services/api_services.dart';

import '../models/fixture_details.dart';

class FixtureController extends GetxController {
  //  RxList<FixturesData> liveScores = <FixturesData>[].obs;
  // RxList<FixturesData> fixturesbyDate = <FixturesData>[].obs;
  RxList<Data> responseList = <Data>[].obs;
  Rx<FixtureDetailsResponse> responseModel = FixtureDetailsResponse().obs;
  // FixtureDetailsResponse response_model;

  loadScheudle() async {
    var response = await ApiService.get(
        'https://api.sportmonks.com/v3/football/fixtures/date/2023-07-09?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=league.country;participants',
        headers: {});
    responseModel.value =
        FixtureDetailsResponse.fromJson(jsonDecode(response.body));
    responseModel.value.data
        ?.map((e) => responseList.contains(e) ? null : responseList.add(e))
        .toList();

    print(responseModel.value.data?[0].league?.country?.name);
  }
}

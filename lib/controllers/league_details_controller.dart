import 'dart:convert';

import 'package:get/get.dart';
import '/services/api_services.dart';
import '/utils/helpers.dart';

import '../models/fixture_details.dart';
import '../models/leaue_details_response.dart';

class LeagueDetailsController extends GetxController {
  RxBool loading = true.obs;
  RxList<FixtureData> latestList = <FixtureData>[].obs;
  RxList<FixtureData> upComingList = <FixtureData>[].obs;
  Rx<LeagueDetailsResponse> responseModel = LeagueDetailsResponse().obs;
  //LeagueDetailsResponse

  recentMatches(int leagueId) async {
    loading.value = true;
    latestList.clear();
    upComingList.clear();
    try {
      var response = await ApiService.get(
          'https://api.sportmonks.com/v3/football/leagues/$leagueId?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=latest.participants;latest.state;latest.scores;upcoming.participants;upcoming.state;upcoming.periods',
          headers: {});

      responseModel.value =
          LeagueDetailsResponse.fromJson(jsonDecode(response.body));

      responseModel.value.data?.latest
          ?.map((e) => latestList.contains(e) ? null : latestList.add(e))
          .toList();
      responseModel.value.data?.upcoming
          ?.map((e) => upComingList.contains(e) ? null : upComingList.add(e))
          .toList();
      dd(responseModel.value.data?.toJson());
    } on Exception catch (e) {
      dd(e);
    } finally {
      loading.value = false;
    }
  }

  getLeagueOverviewTAble() {
    var response1 = ApiService.get(
        "https://api.sportmonks.com/v3/football/standings/seasons/20873?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=details.type;group;participant;stage;rule.type;form");
  }
}

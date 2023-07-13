import 'dart:convert';

import 'package:get/get.dart';
import '../models/team_overview_table_response.dart';
import '../models/top_scand_topast.dart';
import '/services/api_services.dart';
import '/utils/helpers.dart';

import '../models/fixture_details.dart';
import '../models/leaue_details_response.dart';

class LeagueDetailsController extends GetxController {
  RxBool loading = true.obs;
  RxBool tableOverViewloading = true.obs;
  RxBool topScorerLoading = true.obs;
  RxList<FixtureData> latestList = <FixtureData>[].obs;
  RxList<FixtureData> upComingList = <FixtureData>[].obs;
  RxList<TeamOverviewTableData> teamOverviewDataList =
      <TeamOverviewTableData>[].obs;
  RxList<Topscorers> topScorerList = <Topscorers>[].obs;
  Rx<LeagueDetailsResponse> responseModel = LeagueDetailsResponse().obs;
  Rx<TopScorerAndTopAssistResponse> responseModelTopSc =
      TopScorerAndTopAssistResponse().obs;
  Rx<TeamOverviewTableResponse> responseModelTeamTable =
      TeamOverviewTableResponse().obs;
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

  getLeagueOverviewTAble(String seasonId) async {
    tableOverViewloading.value = true;
    teamOverviewDataList.clear();
    try {
      var response1 = await ApiService.get(
          "https://api.sportmonks.com/v3/football/standings/seasons/$seasonId?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=details.type;group;participant;stage;rule.type;form",
          headers: {});

      responseModelTeamTable.value =
          TeamOverviewTableResponse.fromJson(jsonDecode(response1.body));
      responseModelTeamTable.value.data
          ?.map((e) => teamOverviewDataList.add(e))
          .toList();
    } on Exception catch (e) {
      dd(e);
    }

    // responseModelTeamTable.value.data?.

    finally {
      tableOverViewloading.value = false;
    }
  }

  getTopScorer(String seasonId) async {
    topScorerLoading.value = true;
    topScorerList.clear();
    try {
      var response2 = await ApiService.get(
          "https://api.sportmonks.com/v3/football/seasons/$seasonId?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=topscorers.player%3Btopscorers.participant",
          headers: {});

      responseModelTopSc.value =
          TopScorerAndTopAssistResponse.fromJson(jsonDecode(response2.body));
      responseModelTopSc.value.data?.topscorers
          ?.map((e) => topScorerList.add(e))
          .toList()
          .toList();
    } on Exception catch (e) {
      dd(e);
    }

    // responseModelTeamTable.value.data?.

    finally {
      topScorerLoading.value = false;
    }
  }
}

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/services/api_services.dart';
import '/utils/helpers.dart';

import '../models/fixture_details.dart';

class FixtureController extends GetxController {
  //  RxList<FixturesData> liveScores = <FixturesData>[].obs;
  // RxList<FixturesData> fixturesbyDate = <FixturesData>[].obs;
  RxList<FixtureData> responseList = <FixtureData>[].obs;
  RxList<FixtureData> liveResponseList = <FixtureData>[].obs;
  Rx<FixtureDetailsResponse> responseModel = FixtureDetailsResponse().obs;

  Rx<FixtureDetailsResponse> liveModel = FixtureDetailsResponse().obs;

  Rx<DateTime> selectedDate = DateTime.now().toUtc().obs;
  Map<String, List<FixtureData>> leagueGroup =
      <String, List<FixtureData>>{}.obs;
  Map<String, List<FixtureData>> leagueGroupLive =
      <String, List<FixtureData>>{}.obs;
  Map<String, List<FixtureData>> selectedLeague =
      <String, List<FixtureData>>{}.obs;
  Map<String, List<FixtureData>> selectedLeagueLive =
      <String, List<FixtureData>>{}.obs;
  Map<int, List<FixtureData>> leagueGroupKey = <int, List<FixtureData>>{}.obs;

  RxBool loading = true.obs;
  RxBool loadingLive = true.obs;

  RxList<String> group = <String>[].obs;
  RxList<String> groupLive = <String>[].obs;
  RxList<String> groupKey = <String>[].obs;
  RxString selectedValue = ''.obs;
  RxBool showLive = false.obs;

  loadScheudle() async {
    loading.value = true;
    leagueGroup.clear();
    group.clear();
    responseList.clear();
    String date =
        DateFormat("yyyy-MM-dd").format(selectedDate.value).toString();
    try {
      var response = await ApiService.get(
          'https://api.sportmonks.com/v3/football/fixtures/date/$date?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=league.country;participants;state;scores;periods',
          headers: {});
      responseModel.value =
          FixtureDetailsResponse.fromJson(jsonDecode(response.body));
      responseModel.value.data
          ?.map((e) => responseList.contains(e) ? null : responseList.add(e))
          .toList();
      selectedLeague = groupBy(responseList, (obj) => obj.league?.name ?? "");
      // leagueGroupKey = groupBy(responseList, (obj) => obj.leagueId ?? 0);
      group.add("All League");
      selectedLeague.entries.map((value1) => group.add(value1.key)).toList();
      //  leagueGroupKey.entries.map((value1) => group.add(value1.value[0].league?.name??"")).toList();
      selectedValue.value = group.first;

      leagueGroup = selectedLeague;
    } on Exception catch (e) {
      dd(e);
    } finally {
      loading.value = false;
    }
    // print("ds;glkdsgl;${group}");

    // print(responseModel.value.data?[0].league?.country?.name);
  }

  // live:

  getLeagueFixture(String value) {
    loading.value = true;
    selectedValue.value = value;
    (value == 'All League')
        ? selectedLeague = leagueGroup
        : selectedLeague = Map.fromEntries(leagueGroup.entries
            .where((entry) => entry.key.toLowerCase() == value.toLowerCase()));
    (value == 'All League')
        ? selectedLeagueLive = leagueGroupLive
        : selectedLeagueLive = Map.fromEntries(leagueGroupLive.entries
            .where((entry) => entry.key.toLowerCase() == value.toLowerCase()));
    loading.value = false;
  }

  liveScheudle() async {
    loadingLive.value = true;
    leagueGroupLive.clear();
    groupLive.clear();
    liveResponseList.clear();
    try {
      var liveResponse = await ApiService.get(
          'https://api.sportmonks.com/v3/football/livescores?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=league.country;participants;state;scores;periods',
          headers: {});
      liveModel.value =
          FixtureDetailsResponse.fromJson(jsonDecode(liveResponse.body));
      liveModel.value.data
          ?.map((e) =>
              liveResponseList.contains(e) ? null : liveResponseList.add(e))
          .toList();
      selectedLeagueLive =
          groupBy(liveResponseList, (obj) => obj.league?.name ?? "");
      groupLive.add("All League");
      selectedLeagueLive.entries
          .map((value1) => groupLive.add(value1.key))
          .toList();
      //  leagueGroupKey.entries.map((value1) => group.add(value1.value[0].league?.name??"")).toList();
      selectedValue.value = groupLive.first;

      leagueGroupLive = selectedLeagueLive;
    } on Exception catch (e) {
      dd(e);
    } finally {
      loadingLive.value = false;
    }
  }
}

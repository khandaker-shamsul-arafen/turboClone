import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:turbo_coone1/services/api_services.dart';

import '../models/fixture_details.dart';

class FixtureController extends GetxController {
  //  RxList<FixturesData> liveScores = <FixturesData>[].obs;
  // RxList<FixturesData> fixturesbyDate = <FixturesData>[].obs;
  RxList<Data> responseList = <Data>[].obs;
  Rx<FixtureDetailsResponse> responseModel = FixtureDetailsResponse().obs;
  Rx<DateTime> selectedDate = DateTime.now().toUtc().obs;
  Map<String, List<Data>> leagueGroup = <String, List<Data>>{}.obs;
  Map<int, List<Data>> leagueGroupKey = <int, List<Data>>{}.obs;
  RxBool loading = true.obs;
  RxList<String> group = <String>[].obs;
  RxList<String> groupKey = <String>[].obs;
  RxString selectedValue = 'Item1'.obs;
  final RxList<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ].obs;

  // FixtureDetailsResponse response_model;

  loadScheudle(String date) async {
    loading.value = true;
    leagueGroup.clear();
    group.clear();
    responseList.clear();
    var response = await ApiService.get(
        'https://api.sportmonks.com/v3/football/fixtures/date/$date?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=league.country;participants;state;scores',
        headers: {});
    responseModel.value =
        FixtureDetailsResponse.fromJson(jsonDecode(response.body));
    responseModel.value.data
        ?.map((e) => responseList.contains(e) ? null : responseList.add(e))
        .toList();
    leagueGroup = groupBy(responseList, (obj) => obj.league?.name ?? "");
    // leagueGroupKey = groupBy(responseList, (obj) => obj.leagueId ?? 0);

    leagueGroup.entries.map((value1) => group.add(value1.key)).toList();
    //  leagueGroupKey.entries.map((value1) => group.add(value1.value[0].league?.name??"")).toList();
    selectedValue.value = group.first;
    loading.value = false;
    print("ds;glkdsgl;${group}");

    // print(responseModel.value.data?[0].league?.country?.name);
  }
}

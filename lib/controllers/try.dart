// import 'dart:convert';
// import 'package:collection/collection.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:turbo_football_clone/models/fixture.dart';
// import 'package:turbo_football_clone/services/api_services.dart';

// class FixtureController extends GetxController {
//   RxBool isLoading = true.obs;
//   Rx<Fixture> fixtures = Fixture().obs;
//   Map<String, List<Data>> permanentLeagueGroup = <String, List<Data>>{}.obs;
//   Map<String, List<Data>> leagueGroup = <String, List<Data>>{}.obs;
//   RxList<String> allLeagues = <String>[].obs;
//   Rx<DateTime> currentDateIndex = DateTime.now().obs;
//   Rx<String> currentLeague = "".obs;

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     getAllFixtures(DateFormat("yyyy-MM-dd").format(DateTime.now()).toString());
//   }

//   getLeagueFixture(String value) {
//     isLoading.value = true;
//     currentLeague.value = value;

//     leagueGroup = value == allLeagues.first
//         ? permanentLeagueGroup
//         : Map.fromEntries(permanentLeagueGroup.entries
//             .where((entry) => entry.key.toLowerCase() == value.toLowerCase()));
//     isLoading.value = false;
//   }

//   getAllFixtures(String date) async {
//     var resposnse = await ApiService.get(
//         'https://api.sportmonks.com/v3/football/fixtures/date/${date}?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=league%3Bleague.country%3Bparticipants%3Bstage%3Bscores%3Bstate%3B',
//         headers: {});
//     var responseDecode = jsonDecode(resposnse.body);
//     fixtures.value = Fixture.fromJson(responseDecode);
//     leagueGroup = groupBy(
//         fixtures.value.data as Iterable<Data>, (p0) => p0.league?.name ?? "");

//     permanentLeagueGroup = leagueGroup;
//     allLeagues.value = ["ALL LEAGUES"];
//     List<String> currentLeagueList = leagueGroup.keys.toList();
//     allLeagues.value = [...allLeagues, ...currentLeagueList];
//     currentLeague.value = allLeagues.first;
//     isLoading.value = false;
//   }
// }

 //var newMap = groupBy(responseModel.value.data as Iterable<Data>, (obj) => obj.leagueId);
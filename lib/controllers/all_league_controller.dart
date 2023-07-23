import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbo_coone1/utils/helpers.dart';

import '../models/all_league.dart';
import '../models/team_response.dart';
import '../services/api_services.dart';

class AllLeagueController extends GetxController {
  RxList<Data> leagueList = <Data>[].obs;
  RxList<TeamData> teamList = <TeamData>[].obs;
  RxList<Data> searchLeagueList = <Data>[].obs;
  RxList<TeamData> searchTeamList = <TeamData>[].obs;
  RxList<Data> favouriteList = <Data>[].obs;
  RxList<TeamData> teamFavouriteList = <TeamData>[].obs;
  RxBool isLoading = true.obs;
  RxBool isSelected = false.obs;

  Rx<AllLeague> responseModel = AllLeague().obs;
  Rx<Team> responseModelTeam = Team().obs;
  Rx<Team> teams = Team().obs;

  loadLeagues() async {
    try {
      var response = await ApiService.get(
          "https://api.sportmonks.com/v3/football/leagues/?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=currentSeason;country&page=1",
          headers: {});

      responseModel.value = AllLeague.fromJson(jsonDecode(response.body));

      responseModel.value.data?.map((e) => leagueList.add(e)).toList();

      // print("Hellow${leagueList}");
    } catch (e, s) {
      dd(e);
    } finally {
      isLoading.value = false;
    }
  }

  searchLeague(String value) async {
    searchLeagueList.clear();

    try {
      var response = await ApiService.get(
          "https://api.sportmonks.com/v3/football/leagues/search/$value?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=currentSeason;country&page=1",
          headers: {});
      responseModel.value = AllLeague.fromJson(jsonDecode(response.body));

      responseModel.value.data?.map((e) => searchLeagueList.add(e)).toList();

      dd("Hellow${responseModel.value.data?[0].country?.name}");
    } catch (e, s) {
      dd(e);
    } finally {
      isLoading.value = false;
    }
  }

  loadTeams() async {
    try {
      var response = await ApiService.get(
          "https://api.sportmonks.com/v3/football/teams/?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=country&page=1",
          headers: {});

      Team responseModel = Team.fromJson(jsonDecode(response.body));
      responseModel.data?.map((e) => teamList.add(e)).toList();
    } catch (e, s) {
      dd(e);
      dd(s);
    } finally {
      isLoading.value = false;
    }
  }

  searchTeam(String value) async {
    searchTeamList.clear();

    try {
      var response = await ApiService.get(
          "https://api.sportmonks.com/v3/football/teams/search/$value?api_token=pOrQiOGJTy3tZzq0WxrGevTckFeZZo1IuNJZYlwml7sfCh5pEvMwrTc1KIZf&include=country&page=1",
          headers: {});
      responseModelTeam.value = Team.fromJson(jsonDecode(response.body));

      responseModelTeam.value.data?.map((e) => searchTeamList.add(e)).toList();

      dd("Hellow${responseModelTeam.value.data?[0].country?.name}");
    } catch (e, s) {
      dd(e);
    } finally {
      isLoading.value = false;
    }
  }

  getStorageRead() {
    var result = readStorage('FavouriteTeam') ?? '';
    dd(result);
    if (result != null && result != '') {
      List<dynamic> jsonData = jsonDecode(result);
      teamFavouriteList.value =
          jsonData.map((data) => TeamData.fromJson(data)).toList();
      print("Shanto$teamFavouriteList");
    }
  }

  getStorageLeagueRead() {
    var result = readStorage('FavouriteLeague') ?? '';
    dd(result);
    if (result != null && result != '') {
      List<dynamic> jsonData = jsonDecode(result);
      favouriteList.value =
          jsonData.map((data) => Data.fromJson(data)).toList();
      print("hii$favouriteList");
    }
  }

  makeFavourite(Data element) {
    if (favouriteList.contains(element)) {
      favouriteList.remove(element);
      leagueList.add(element);
    } else {
      favouriteList.add(element);
      leagueList.remove(element);
    }
    String jsonString = jsonEncode(teamFavouriteList);
    writeStorage('FavouriteLeague', jsonString);
  }

  makeTeamFavourite(TeamData element) {
    if (teamFavouriteList.contains(element)) {
      teamFavouriteList.remove(element);
      teamList.add(element);
    } else {
      teamFavouriteList.add(element);
      teamList.remove(element);
    }
    String jsonString = jsonEncode(teamFavouriteList);
    writeStorage('FavouriteTeam', jsonString);
  }
}

class TopScorerAndTopAssistResponse {
  Data? data;

  String? timezone;

  TopScorerAndTopAssistResponse({this.data, this.timezone});

  TopScorerAndTopAssistResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;

    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

    data['timezone'] = timezone;
    return data;
  }
}

class Data {
  int? id;
  int? sportId;
  int? leagueId;
  int? tieBreakerRuleId;
  String? name;
  bool? finished;
  bool? pending;
  bool? isCurrent;
  String? startingAt;
  String? endingAt;
  String? standingsRecalculatedAt;
  bool? gamesInCurrentWeek;
  List<Topscorers>? topscorers;

  Data(
      {this.id,
      this.sportId,
      this.leagueId,
      this.tieBreakerRuleId,
      this.name,
      this.finished,
      this.pending,
      this.isCurrent,
      this.startingAt,
      this.endingAt,
      this.standingsRecalculatedAt,
      this.gamesInCurrentWeek,
      this.topscorers});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportId = json['sport_id'];
    leagueId = json['league_id'];
    tieBreakerRuleId = json['tie_breaker_rule_id'];
    name = json['name'];
    finished = json['finished'];
    pending = json['pending'];
    isCurrent = json['is_current'];
    startingAt = json['starting_at'];
    endingAt = json['ending_at'];
    standingsRecalculatedAt = json['standings_recalculated_at'];
    gamesInCurrentWeek = json['games_in_current_week'];
    if (json['topscorers'] != null) {
      topscorers = <Topscorers>[];
      json['topscorers'].forEach((v) {
        topscorers!.add(Topscorers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sport_id'] = sportId;
    data['league_id'] = leagueId;
    data['tie_breaker_rule_id'] = tieBreakerRuleId;
    data['name'] = name;
    data['finished'] = finished;
    data['pending'] = pending;
    data['is_current'] = isCurrent;
    data['starting_at'] = startingAt;
    data['ending_at'] = endingAt;
    data['standings_recalculated_at'] = standingsRecalculatedAt;
    data['games_in_current_week'] = gamesInCurrentWeek;
    if (topscorers != null) {
      data['topscorers'] = topscorers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Topscorers {
  int? seasonId;
  int? playerId;
  int? typeId;
  int? position;
  int? total;
  int? participantId;
  Player? player;
  Participant? participant;

  Topscorers(
      {this.seasonId,
      this.playerId,
      this.typeId,
      this.position,
      this.total,
      this.participantId,
      this.player,
      this.participant});

  Topscorers.fromJson(Map<String, dynamic> json) {
    seasonId = json['season_id'];
    playerId = json['player_id'];
    typeId = json['type_id'];
    position = json['position'];
    total = json['total'];
    participantId = json['participant_id'];
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    participant = json['participant'] != null
        ? Participant.fromJson(json['participant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season_id'] = seasonId;
    data['player_id'] = playerId;
    data['type_id'] = typeId;
    data['position'] = position;
    data['total'] = total;
    data['participant_id'] = participantId;
    if (player != null) {
      data['player'] = player!.toJson();
    }
    if (participant != null) {
      data['participant'] = participant!.toJson();
    }
    return data;
  }
}

class Participant {
  int? id;
  int? sportId;
  int? countryId;
  int? venueId;
  String? gender;
  String? name;
  String? shortCode;
  String? imagePath;
  int? founded;
  String? type;
  bool? placeholder;
  String? lastPlayedAt;

  Participant(
      {this.id,
      this.sportId,
      this.countryId,
      this.venueId,
      this.gender,
      this.name,
      this.shortCode,
      this.imagePath,
      this.founded,
      this.type,
      this.placeholder,
      this.lastPlayedAt});

  Participant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportId = json['sport_id'];
    countryId = json['country_id'];
    venueId = json['venue_id'];
    gender = json['gender'];
    name = json['name'];
    shortCode = json['short_code'];
    imagePath = json['image_path'];
    founded = json['founded'];
    type = json['type'];
    placeholder = json['placeholder'];
    lastPlayedAt = json['last_played_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sport_id'] = sportId;
    data['country_id'] = countryId;
    data['venue_id'] = venueId;
    data['gender'] = gender;
    data['name'] = name;
    data['short_code'] = shortCode;
    data['image_path'] = imagePath;
    data['founded'] = founded;
    data['type'] = type;
    data['placeholder'] = placeholder;
    data['last_played_at'] = lastPlayedAt;
    return data;
  }
}

class Player {
  int? id;
  int? sportId;
  int? countryId;
  int? nationalityId;
  int? cityId;
  int? positionId;
  int? detailedPositionId;
  int? typeId;
  String? commonName;
  String? firstname;
  String? lastname;
  String? name;
  String? displayName;
  String? imagePath;
  int? height;
  int? weight;
  String? dateOfBirth;
  String? gender;

  Player(
      {this.id,
      this.sportId,
      this.countryId,
      this.nationalityId,
      this.cityId,
      this.positionId,
      this.detailedPositionId,
      this.typeId,
      this.commonName,
      this.firstname,
      this.lastname,
      this.name,
      this.displayName,
      this.imagePath,
      this.height,
      this.weight,
      this.dateOfBirth,
      this.gender});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportId = json['sport_id'];
    countryId = json['country_id'];
    nationalityId = json['nationality_id'];
    cityId = json['city_id'];
    positionId = json['position_id'];
    detailedPositionId = json['detailed_position_id'];
    typeId = json['type_id'];
    commonName = json['common_name'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    name = json['name'];
    displayName = json['display_name'];
    imagePath = json['image_path'];
    height = json['height'];
    weight = json['weight'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sport_id'] = sportId;
    data['country_id'] = countryId;
    data['nationality_id'] = nationalityId;
    data['city_id'] = cityId;
    data['position_id'] = positionId;
    data['detailed_position_id'] = detailedPositionId;
    data['type_id'] = typeId;
    data['common_name'] = commonName;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['name'] = name;
    data['display_name'] = displayName;
    data['image_path'] = imagePath;
    data['height'] = height;
    data['weight'] = weight;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    return data;
  }
}

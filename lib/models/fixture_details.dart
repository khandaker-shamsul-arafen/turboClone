class FixtureDetailsResponse {
  List<FixtureData>? data;
  Pagination? pagination;
  List<Subscription>? subscription;
  RateLimit? rateLimit;
  String? timezone;

  FixtureDetailsResponse(
      {this.data,
      this.pagination,
      this.subscription,
      this.rateLimit,
      this.timezone});

  FixtureDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FixtureData>[];
      json['data'].forEach((v) {
        data!.add(FixtureData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['subscription'] != null) {
      subscription = <Subscription>[];
      json['subscription'].forEach((v) {
        subscription!.add(Subscription.fromJson(v));
      });
    }
    rateLimit = json['rate_limit'] != null
        ? RateLimit.fromJson(json['rate_limit'])
        : null;
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (subscription != null) {
      data['subscription'] = subscription!.map((v) => v.toJson()).toList();
    }
    if (rateLimit != null) {
      data['rate_limit'] = rateLimit!.toJson();
    }
    data['timezone'] = timezone;
    return data;
  }
}

class FixtureData {
  int? id;
  int? sportId;
  int? leagueId;
  int? seasonId;
  int? stageId;
  int? groupId;
  int? aggregateId;
  int? roundId;
  int? stateId;
  int? venueId;
  String? name;
  String? startingAt;
  String? resultInfo;
  String? leg;
  String? details;
  int? length;
  bool? placeholder;
  bool? hasOdds;
  int? startingAtTimestamp;
  League? league;
  List<Participants>? participants;
  Status? state;
  List<Scores>? scores;
  List<Periods>? periods;

  FixtureData(
      {this.id,
      this.sportId,
      this.leagueId,
      this.seasonId,
      this.stageId,
      this.groupId,
      this.aggregateId,
      this.roundId,
      this.stateId,
      this.venueId,
      this.name,
      this.startingAt,
      this.resultInfo,
      this.leg,
      this.details,
      this.length,
      this.placeholder,
      this.hasOdds,
      this.startingAtTimestamp,
      this.league,
      this.participants,
      this.state,
      this.scores,
      this.periods});

  FixtureData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportId = json['sport_id'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    stageId = json['stage_id'];
    groupId = json['group_id'];
    aggregateId = json['aggregate_id'];
    roundId = json['round_id'];
    stateId = json['state_id'];
    venueId = json['venue_id'];
    name = json['name'];
    startingAt = json['starting_at'];
    resultInfo = json['result_info'];
    leg = json['leg'];
    details = json['details'];
    length = json['length'];
    placeholder = json['placeholder'];
    hasOdds = json['has_odds'];
    startingAtTimestamp = json['starting_at_timestamp'];
    league = json['league'] != null ? League.fromJson(json['league']) : null;
    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add(Participants.fromJson(v));
      });
    }
    state = json['state'] != null ? Status.fromJson(json['state']) : null;
    if (json['scores'] != null) {
      scores = <Scores>[];
      json['scores'].forEach((v) {
        scores!.add(Scores.fromJson(v));
      });
    }
    if (json['periods'] != null) {
      periods = <Periods>[];
      json['periods'].forEach((v) {
        periods!.add(Periods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sport_id'] = sportId;
    data['league_id'] = leagueId;
    data['season_id'] = seasonId;
    data['stage_id'] = stageId;
    data['group_id'] = groupId;
    data['aggregate_id'] = aggregateId;
    data['round_id'] = roundId;
    data['state_id'] = stateId;
    data['venue_id'] = venueId;
    data['name'] = name;
    data['starting_at'] = startingAt;
    data['result_info'] = resultInfo;
    data['leg'] = leg;
    data['details'] = details;
    data['length'] = length;
    data['placeholder'] = placeholder;
    data['has_odds'] = hasOdds;
    data['starting_at_timestamp'] = startingAtTimestamp;
    if (league != null) {
      data['league'] = league!.toJson();
    }
    if (participants != null) {
      data['participants'] = participants!.map((v) => v.toJson()).toList();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (scores != null) {
      data['scores'] = scores!.map((v) => v.toJson()).toList();
    }
    if (periods != null) {
      data['periods'] = periods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class League {
  int? id;
  int? sportId;
  int? countryId;
  String? name;
  bool? active;
  String? shortCode;
  String? imagePath;
  String? type;
  String? subType;
  String? lastPlayedAt;
  int? category;
  bool? hasJerseys;
  Country? country;

  League(
      {this.id,
      this.sportId,
      this.countryId,
      this.name,
      this.active,
      this.shortCode,
      this.imagePath,
      this.type,
      this.subType,
      this.lastPlayedAt,
      this.category,
      this.hasJerseys,
      this.country});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportId = json['sport_id'];
    countryId = json['country_id'];
    name = json['name'];
    active = json['active'];
    shortCode = json['short_code'];
    imagePath = json['image_path'];
    type = json['type'];
    subType = json['sub_type'];
    lastPlayedAt = json['last_played_at'];
    category = json['category'];
    hasJerseys = json['has_jerseys'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sport_id'] = sportId;
    data['country_id'] = countryId;
    data['name'] = name;
    data['active'] = active;
    data['short_code'] = shortCode;
    data['image_path'] = imagePath;
    data['type'] = type;
    data['sub_type'] = subType;
    data['last_played_at'] = lastPlayedAt;
    data['category'] = category;
    data['has_jerseys'] = hasJerseys;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  int? continentId;
  String? name;
  String? officialName;
  String? fifaName;
  String? iso2;
  String? iso3;
  String? latitude;
  String? longitude;
  List<String>? borders;
  String? imagePath;

  Country(
      {this.id,
      this.continentId,
      this.name,
      this.officialName,
      this.fifaName,
      this.iso2,
      this.iso3,
      this.latitude,
      this.longitude,
      this.borders,
      this.imagePath});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    continentId = json['continent_id'];
    name = json['name'];
    officialName = json['official_name'];
    fifaName = json['fifa_name'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    borders = json['borders'].cast<String>();
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['continent_id'] = continentId;
    data['name'] = name;
    data['official_name'] = officialName;
    data['fifa_name'] = fifaName;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['borders'] = borders;
    data['image_path'] = imagePath;
    return data;
  }
}

class Participants {
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
  Meta? meta;

  Participants(
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
      this.lastPlayedAt,
      this.meta});

  Participants.fromJson(Map<String, dynamic> json) {
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
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
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
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Meta {
  String? location;
  bool? winner;
  int? position;

  Meta({this.location, this.winner, this.position});

  Meta.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    winner = json['winner'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['winner'] = winner;
    data['position'] = position;
    return data;
  }
}

class Status {
  int? id;
  String? state;
  String? name;
  String? shortName;
  String? developerName;

  Status({this.id, this.state, this.name, this.shortName, this.developerName});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    name = json['name'];
    shortName = json['short_name'];
    developerName = json['developer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state'] = state;
    data['name'] = name;
    data['short_name'] = shortName;
    data['developer_name'] = developerName;
    return data;
  }
}

class Scores {
  int? id;
  int? fixtureId;
  int? typeId;
  int? participantId;
  Score? score;
  String? description;

  Scores(
      {this.id,
      this.fixtureId,
      this.typeId,
      this.participantId,
      this.score,
      this.description});

  Scores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fixtureId = json['fixture_id'];
    typeId = json['type_id'];
    participantId = json['participant_id'];
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fixture_id'] = fixtureId;
    data['type_id'] = typeId;
    data['participant_id'] = participantId;
    if (score != null) {
      data['score'] = score!.toJson();
    }
    data['description'] = description;
    return data;
  }
}

class Score {
  int? goals;
  String? participant;

  Score({this.goals, this.participant});

  Score.fromJson(Map<String, dynamic> json) {
    goals = json['goals'];
    participant = json['participant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['goals'] = goals;
    data['participant'] = participant;
    return data;
  }
}

class Periods {
  int? id;
  int? fixtureId;
  int? typeId;
  int? started;
  int? ended;
  int? countsFrom;
  bool? ticking;
  int? sortOrder;
  String? description;
  int? timeAdded;
  int? periodLength;
  int? minutes;
  int? seconds;

  Periods(
      {this.id,
      this.fixtureId,
      this.typeId,
      this.started,
      this.ended,
      this.countsFrom,
      this.ticking,
      this.sortOrder,
      this.description,
      this.timeAdded,
      this.periodLength,
      this.minutes,
      this.seconds});

  Periods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fixtureId = json['fixture_id'];
    typeId = json['type_id'];
    started = json['started'];
    ended = json['ended'];
    countsFrom = json['counts_from'];
    ticking = json['ticking'];
    sortOrder = json['sort_order'];
    description = json['description'];
    timeAdded = json['time_added'];
    periodLength = json['period_length'];
    minutes = json['minutes'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fixture_id'] = fixtureId;
    data['type_id'] = typeId;
    data['started'] = started;
    data['ended'] = ended;
    data['counts_from'] = countsFrom;
    data['ticking'] = ticking;
    data['sort_order'] = sortOrder;
    data['description'] = description;
    data['time_added'] = timeAdded;
    data['period_length'] = periodLength;
    data['minutes'] = minutes;
    data['seconds'] = seconds;
    return data;
  }
}

class Pagination {
  int? count;
  int? perPage;
  int? currentPage;
  String? nextPage;
  bool? hasMore;

  Pagination(
      {this.count,
      this.perPage,
      this.currentPage,
      this.nextPage,
      this.hasMore});

  Pagination.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    nextPage = json['next_page'];
    hasMore = json['has_more'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    data['next_page'] = nextPage;
    data['has_more'] = hasMore;
    return data;
  }
}

class Subscription {
  Meta? meta;
  List<Plans>? plans;
  List<void>? addOns;
  List<void>? widgets;

  Subscription({this.meta, this.plans, this.addOns, this.widgets});

  Subscription.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Metadata {
  String? trialEndsAt;
  String? endsAt;

  Metadata({this.trialEndsAt, this.endsAt});

  Metadata.fromJson(Map<String, dynamic> json) {
    trialEndsAt = json['trial_ends_at'];
    endsAt = json['ends_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trial_ends_at'] = trialEndsAt;
    data['ends_at'] = endsAt;
    return data;
  }
}

class Plans {
  String? plan;
  String? sport;
  String? category;

  Plans({this.plan, this.sport, this.category});

  Plans.fromJson(Map<String, dynamic> json) {
    plan = json['plan'];
    sport = json['sport'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plan'] = plan;
    data['sport'] = sport;
    data['category'] = category;
    return data;
  }
}

class RateLimit {
  int? resetsInSeconds;
  int? remaining;
  String? requestedEntity;

  RateLimit({this.resetsInSeconds, this.remaining, this.requestedEntity});

  RateLimit.fromJson(Map<String, dynamic> json) {
    resetsInSeconds = json['resets_in_seconds'];
    remaining = json['remaining'];
    requestedEntity = json['requested_entity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resets_in_seconds'] = resetsInSeconds;
    data['remaining'] = remaining;
    data['requested_entity'] = requestedEntity;
    return data;
  }
}

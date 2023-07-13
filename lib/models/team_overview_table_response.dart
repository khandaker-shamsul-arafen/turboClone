class TeamOverviewTableResponse {
  List<TeamOverviewTableData>? data;
  List<Subscription>? subscription;
  RateLimit? rateLimit;
  String? timezone;

  TeamOverviewTableResponse(
      {this.data, this.subscription, this.rateLimit, this.timezone});

  TeamOverviewTableResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TeamOverviewTableData>[];
      json['data'].forEach((v) {
        data!.add(TeamOverviewTableData.fromJson(v));
      });
    }
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

class TeamOverviewTableData {
  int? id;
  int? participantId;
  int? sportId;
  int? leagueId;
  int? seasonId;
  int? stageId;
  int? groupId;
  int? roundId;
  int? standingRuleId;
  int? position;
  String? result;
  int? points;
  List<Details>? details;
  Group? group;
  Participant? participant;
  Stage? stage;
  Rule? rule;
  List<Form>? form;

  TeamOverviewTableData(
      {this.id,
      this.participantId,
      this.sportId,
      this.leagueId,
      this.seasonId,
      this.stageId,
      this.groupId,
      this.roundId,
      this.standingRuleId,
      this.position,
      this.result,
      this.points,
      this.details,
      this.group,
      this.participant,
      this.stage,
      this.rule,
      this.form});

  TeamOverviewTableData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    participantId = json['participant_id'];
    sportId = json['sport_id'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    stageId = json['stage_id'];
    groupId = json['group_id'];
    roundId = json['round_id'];
    standingRuleId = json['standing_rule_id'];
    position = json['position'];
    result = json['result'];
    points = json['points'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
    participant = json['participant'] != null
        ? Participant.fromJson(json['participant'])
        : null;
    stage = json['stage'] != null ? Stage.fromJson(json['stage']) : null;
    rule = json['rule'] != null ? Rule.fromJson(json['rule']) : null;
    if (json['form'] != null) {
      form = <Form>[];
      json['form'].forEach((v) {
        form!.add(Form.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['participant_id'] = participantId;
    data['sport_id'] = sportId;
    data['league_id'] = leagueId;
    data['season_id'] = seasonId;
    data['stage_id'] = stageId;
    data['group_id'] = groupId;
    data['round_id'] = roundId;
    data['standing_rule_id'] = standingRuleId;
    data['position'] = position;
    data['result'] = result;
    data['points'] = points;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (participant != null) {
      data['participant'] = participant!.toJson();
    }
    if (stage != null) {
      data['stage'] = stage!.toJson();
    }
    if (rule != null) {
      data['rule'] = rule!.toJson();
    }
    if (form != null) {
      data['form'] = form!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  String? standingType;
  int? standingId;
  int? typeId;
  int? value;
  Type? type;

  Details(
      {this.id,
      this.standingType,
      this.standingId,
      this.typeId,
      this.value,
      this.type});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    standingType = json['standing_type'];
    standingId = json['standing_id'];
    typeId = json['type_id'];
    value = json['value'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['standing_type'] = standingType;
    data['standing_id'] = standingId;
    data['type_id'] = typeId;
    data['value'] = value;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class Type {
  int? id;
  String? name;
  String? code;
  String? developerName;
  String? modelType;
  String? statGroup;

  Type(
      {this.id,
      this.name,
      this.code,
      this.developerName,
      this.modelType,
      this.statGroup});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    developerName = json['developer_name'];
    modelType = json['model_type'];
    statGroup = json['stat_group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['developer_name'] = developerName;
    data['model_type'] = modelType;
    data['stat_group'] = statGroup;
    return data;
  }
}

class Group {
  int? id;
  int? sportId;
  int? leagueId;
  int? seasonId;
  int? stageId;
  String? name;
  String? startingAt;
  String? endingAt;
  bool? gamesInCurrentWeek;
  bool? isCurrent;
  bool? finished;
  bool? pending;

  Group(
      {this.id,
      this.sportId,
      this.leagueId,
      this.seasonId,
      this.stageId,
      this.name,
      this.startingAt,
      this.endingAt,
      this.gamesInCurrentWeek,
      this.isCurrent,
      this.finished,
      this.pending});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportId = json['sport_id'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    stageId = json['stage_id'];
    name = json['name'];
    startingAt = json['starting_at'];
    endingAt = json['ending_at'];
    gamesInCurrentWeek = json['games_in_current_week'];
    isCurrent = json['is_current'];
    finished = json['finished'];
    pending = json['pending'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sport_id'] = sportId;
    data['league_id'] = leagueId;
    data['season_id'] = seasonId;
    data['stage_id'] = stageId;
    data['name'] = name;
    data['starting_at'] = startingAt;
    data['ending_at'] = endingAt;
    data['games_in_current_week'] = gamesInCurrentWeek;
    data['is_current'] = isCurrent;
    data['finished'] = finished;
    data['pending'] = pending;
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

class Stage {
  int? id;
  int? sportId;
  int? leagueId;
  int? seasonId;
  int? typeId;
  String? name;
  int? sortOrder;
  bool? finished;
  bool? isCurrent;
  String? startingAt;
  String? endingAt;
  bool? gamesInCurrentWeek;
  int? tieBreakerRuleId;

  Stage(
      {this.id,
      this.sportId,
      this.leagueId,
      this.seasonId,
      this.typeId,
      this.name,
      this.sortOrder,
      this.finished,
      this.isCurrent,
      this.startingAt,
      this.endingAt,
      this.gamesInCurrentWeek,
      this.tieBreakerRuleId});

  Stage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportId = json['sport_id'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    typeId = json['type_id'];
    name = json['name'];
    sortOrder = json['sort_order'];
    finished = json['finished'];
    isCurrent = json['is_current'];
    startingAt = json['starting_at'];
    endingAt = json['ending_at'];
    gamesInCurrentWeek = json['games_in_current_week'];
    tieBreakerRuleId = json['tie_breaker_rule_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sport_id'] = sportId;
    data['league_id'] = leagueId;
    data['season_id'] = seasonId;
    data['type_id'] = typeId;
    data['name'] = name;
    data['sort_order'] = sortOrder;
    data['finished'] = finished;
    data['is_current'] = isCurrent;
    data['starting_at'] = startingAt;
    data['ending_at'] = endingAt;
    data['games_in_current_week'] = gamesInCurrentWeek;
    data['tie_breaker_rule_id'] = tieBreakerRuleId;
    return data;
  }
}

class Rule {
  int? id;
  String? modelType;
  int? modelId;
  int? typeId;
  int? position;
  Type? type;

  Rule(
      {this.id,
      this.modelType,
      this.modelId,
      this.typeId,
      this.position,
      this.type});

  Rule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    typeId = json['type_id'];
    position = json['position'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['model_type'] = modelType;
    data['model_id'] = modelId;
    data['type_id'] = typeId;
    data['position'] = position;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class Type1 {
  int? id;
  String? name;
  String? code;
  String? developerName;
  String? modelType;
  String? statGroup;

  Type1(
      {this.id,
      this.name,
      this.code,
      this.developerName,
      this.modelType,
      this.statGroup});

  Type1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    developerName = json['developer_name'];
    modelType = json['model_type'];
    statGroup = json['stat_group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['developer_name'] = developerName;
    data['model_type'] = modelType;
    data['stat_group'] = statGroup;
    return data;
  }
}

class Form {
  int? id;
  String? standingType;
  int? standingId;
  int? fixtureId;
  String? form;
  int? sortOrder;

  Form(
      {this.id,
      this.standingType,
      this.standingId,
      this.fixtureId,
      this.form,
      this.sortOrder});

  Form.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    standingType = json['standing_type'];
    standingId = json['standing_id'];
    fixtureId = json['fixture_id'];
    form = json['form'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['standing_type'] = standingType;
    data['standing_id'] = standingId;
    data['fixture_id'] = fixtureId;
    data['form'] = form;
    data['sort_order'] = sortOrder;
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

class Meta {
  String? trialEndsAt;
  String? endsAt;

  Meta({this.trialEndsAt, this.endsAt});

  Meta.fromJson(Map<String, dynamic> json) {
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

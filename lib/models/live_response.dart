class LiveResponse {
  List<Data>? data;
  List<Subscription>? subscription;
  RateLimit? rateLimit;
  String? timezone;

  LiveResponse({this.data, this.subscription, this.rateLimit, this.timezone});

  LiveResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    if (json['subscription'] != null) {
      subscription = <Subscription>[];
      json['subscription'].forEach((v) {
        subscription!.add(new Subscription.fromJson(v));
      });
    }
    rateLimit = json['rate_limit'] != null
        ? new RateLimit.fromJson(json['rate_limit'])
        : null;
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.map((v) => v.toJson()).toList();
    }
    if (this.rateLimit != null) {
      data['rate_limit'] = this.rateLimit!.toJson();
    }
    data['timezone'] = this.timezone;
    return data;
  }
}

class Data {
  int? id;
  int? sportId;
  int? leagueId;
  int? seasonId;
  int? stageId;
  Null? groupId;
  Null? aggregateId;
  Null? roundId;
  int? stateId;
  int? venueId;
  String? name;
  String? startingAt;
  Null? resultInfo;
  String? leg;
  Null? details;
  int? length;
  bool? placeholder;
  bool? hasOdds;
  int? startingAtTimestamp;

  Data(
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
      this.startingAtTimestamp});

  Data.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sport_id'] = this.sportId;
    data['league_id'] = this.leagueId;
    data['season_id'] = this.seasonId;
    data['stage_id'] = this.stageId;
    data['group_id'] = this.groupId;
    data['aggregate_id'] = this.aggregateId;
    data['round_id'] = this.roundId;
    data['state_id'] = this.stateId;
    data['venue_id'] = this.venueId;
    data['name'] = this.name;
    data['starting_at'] = this.startingAt;
    data['result_info'] = this.resultInfo;
    data['leg'] = this.leg;
    data['details'] = this.details;
    data['length'] = this.length;
    data['placeholder'] = this.placeholder;
    data['has_odds'] = this.hasOdds;
    data['starting_at_timestamp'] = this.startingAtTimestamp;
    return data;
  }
}

class Subscription {
  Meta? meta;
  List<Plans>? plans;
  List<Null>? addOns;
  List<Null>? widgets;

  Subscription({this.meta, this.plans, this.addOns, this.widgets});

  Subscription.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trial_ends_at'] = this.trialEndsAt;
    data['ends_at'] = this.endsAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan'] = this.plan;
    data['sport'] = this.sport;
    data['category'] = this.category;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resets_in_seconds'] = this.resetsInSeconds;
    data['remaining'] = this.remaining;
    data['requested_entity'] = this.requestedEntity;
    return data;
  }
}

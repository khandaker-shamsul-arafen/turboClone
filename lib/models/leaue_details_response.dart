// ignore: camel_case_types
// ignore_for_file: prefer_void_to_null

import '/models/fixture_details.dart';

class LeagueDetailsResponse {
  Data? data;
  List<Subscription>? subscription;
  RateLimit? rateLimit;
  String? timezone;

  LeagueDetailsResponse(
      {this.data, this.subscription, this.rateLimit, this.timezone});

  LeagueDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
      data['data'] = this.data!.toJson();
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

class Data {
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
  List<FixtureData>? latest;
  List<FixtureData>? upcoming;

  Data(
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
      this.latest,
      this.upcoming});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['latest'] != null) {
      latest = <FixtureData>[];
      json['latest'].forEach((v) {
        latest!.add(FixtureData.fromJson(v));
      });
    }
    if (json['upcoming'] != null) {
      upcoming = <FixtureData>[];
      json['upcoming'].forEach((v) {
        upcoming!.add(FixtureData.fromJson(v));
      });
    }
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
    if (latest != null) {
      data['latest'] = latest!.map((v) => v.toJson()).toList();
    }
    if (upcoming != null) {
      data['upcoming'] = upcoming!.map((v) => v.toJson()).toList();
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

class Meta1 {
  String? location;
  Null winner;
  int? position;

  Meta1({this.location, this.winner, this.position});

  Meta1.fromJson(Map<String, dynamic> json) {
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

class Subscription {
  Meta? meta;
  List<Plans>? plans;

  Subscription({
    this.meta,
    this.plans,
  });

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

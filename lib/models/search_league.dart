class SearchLeague {
  List<Data>? data;
  Pagination? pagination;
  List<Subscription>? subscription;
  RateLimit? rateLimit;
  String? timezone;

  SearchLeague(
      {this.data,
      this.pagination,
      this.subscription,
      this.rateLimit,
      this.timezone});

  SearchLeague.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
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
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
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
      this.country});

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
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sport_id'] = this.sportId;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['active'] = this.active;
    data['short_code'] = this.shortCode;
    data['image_path'] = this.imagePath;
    data['type'] = this.type;
    data['sub_type'] = this.subType;
    data['last_played_at'] = this.lastPlayedAt;
    data['category'] = this.category;
    data['has_jerseys'] = this.hasJerseys;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['continent_id'] = this.continentId;
    data['name'] = this.name;
    data['official_name'] = this.officialName;
    data['fifa_name'] = this.fifaName;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['borders'] = this.borders;
    data['image_path'] = this.imagePath;
    return data;
  }
}

class Pagination {
  int? count;
  int? perPage;
  int? currentPage;
  Null? nextPage;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['next_page'] = this.nextPage;
    data['has_more'] = this.hasMore;
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

class CharacterModel {
  final CharacterData? character;
  final Information? information;

  CharacterModel({this.character, this.information});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      character:
          json['character'] != null
              ? CharacterData.fromJson(json['character'])
              : null,
      information:
          json['information'] != null
              ? Information.fromJson(json['information'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'character': character?.toJson(),
      'information': information?.toJson(),
    };
  }
}

class CharacterData {
  final Character? character;
  final AccountInformation? accountInformation;
  final List<OtherCharacter> otherCharacters;

  CharacterData({
    this.character,
    this.accountInformation,
    required this.otherCharacters,
  });

  factory CharacterData.fromJson(Map<String, dynamic> json) {
    return CharacterData(
      character:
          json['character'] != null
              ? Character.fromJson(json['character'])
              : null,
      accountInformation:
          json['account_information'] != null
              ? AccountInformation.fromJson(json['account_information'])
              : null,
      otherCharacters:
          json['other_characters'] != null
              ? (json['other_characters'] as List)
                  .map((e) => OtherCharacter.fromJson(e))
                  .toList()
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'character': character?.toJson(),
      'account_information': accountInformation?.toJson(),
      'other_characters': otherCharacters.map((e) => e.toJson()).toList(),
    };
  }
}

class Character {
  final String name;
  final String? sex;
  final String? title;
  final int? unlockedTitles;
  final String? vocation;
  final int? level;
  final int? achievementPoints;
  final String? world;
  final String? residence;
  final Guild? guild;
  final String? lastLogin;
  final String? accountStatus;

  Character({
    required this.name,
    this.sex,
    this.title,
    this.unlockedTitles,
    this.vocation,
    this.level,
    this.achievementPoints,
    this.world,
    this.residence,
    this.guild,
    this.lastLogin,
    this.accountStatus,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? '',
      sex: json['sex'],
      title: json['title'],
      unlockedTitles: json['unlocked_titles'],
      vocation: json['vocation'],
      level: json['level'],
      achievementPoints: json['achievement_points'],
      world: json['world'],
      residence: json['residence'],
      guild: json['guild'] != null ? Guild.fromJson(json['guild']) : null,
      lastLogin: json['last_login'],
      accountStatus: json['account_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sex': sex,
      'title': title,
      'unlocked_titles': unlockedTitles,
      'vocation': vocation,
      'level': level,
      'achievement_points': achievementPoints,
      'world': world,
      'residence': residence,
      'guild': guild?.toJson(),
      'last_login': lastLogin,
      'account_status': accountStatus,
    };
  }
}

class Guild {
  final String? name;
  final String? rank;

  Guild({this.name, this.rank});

  factory Guild.fromJson(Map<String, dynamic> json) {
    return Guild(name: json['name'], rank: json['rank']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'rank': rank};
  }
}

class AccountInformation {
  final String? created;
  final String? loyaltyTitle;

  AccountInformation({this.created, this.loyaltyTitle});

  factory AccountInformation.fromJson(Map<String, dynamic> json) {
    return AccountInformation(
      created: json['created'],
      loyaltyTitle: json['loyalty_title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'created': created, 'loyalty_title': loyaltyTitle};
  }
}

class OtherCharacter {
  final String name;
  final String? world;
  final String? status;
  final bool? deleted;
  final bool? main;
  final bool? traded;

  OtherCharacter({
    required this.name,
    this.world,
    this.status,
    this.deleted,
    this.main,
    this.traded,
  });

  factory OtherCharacter.fromJson(Map<String, dynamic> json) {
    return OtherCharacter(
      name: json['name'] ?? '',
      world: json['world'],
      status: json['status'],
      deleted: json['deleted'],
      main: json['main'],
      traded: json['traded'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'world': world,
      'status': status,
      'deleted': deleted,
      'main': main,
      'traded': traded,
    };
  }
}

class Information {
  final Api? api;
  final String? timestamp;
  final List<String> tibiaUrls;
  final Status? status;

  Information({this.api, this.timestamp, required this.tibiaUrls, this.status});

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      api: json['api'] != null ? Api.fromJson(json['api']) : null,
      timestamp: json['timestamp'],
      tibiaUrls:
          json['tibia_urls'] != null
              ? List<String>.from(json['tibia_urls'])
              : [],
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'api': api?.toJson(),
      'timestamp': timestamp,
      'tibia_urls': tibiaUrls,
      'status': status?.toJson(),
    };
  }
}

class Api {
  final int? version;
  final String? release;
  final String? commit;

  Api({this.version, this.release, this.commit});

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      version: json['version'],
      release: json['release'],
      commit: json['commit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'version': version, 'release': release, 'commit': commit};
  }
}

class Status {
  final int? httpCode;

  Status({this.httpCode});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(httpCode: json['http_code']);
  }

  Map<String, dynamic> toJson() {
    return {'http_code': httpCode};
  }
}

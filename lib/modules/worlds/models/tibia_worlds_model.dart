import 'package:projectcaju/core/constants/image_constants.dart';

class TibiaWorlds {
  final Worlds? worlds;
  final Information? information;

  TibiaWorlds({this.worlds, this.information});

  factory TibiaWorlds.fromJson(Map<String, dynamic> json) {
    return TibiaWorlds(
      worlds: json['worlds'] != null ? Worlds.fromJson(json['worlds']) : null,
      information:
          json['information'] != null
              ? Information.fromJson(json['information'])
              : null,
    );
  }

  Worlds get safeWorlds => worlds ?? _defaultWorlds();

  static Worlds _defaultWorlds() {
    return Worlds(
      playersOnline: 0,
      recordPlayers: 0,
      recordDate: DateTime(1970),
      regularWorlds: [],
      tournamentWorlds: [],
    );
  }
}

class Worlds {
  final int playersOnline;
  final int recordPlayers;
  final DateTime recordDate;
  final List<RegularWorld> regularWorlds;
  final dynamic tournamentWorlds;

  Worlds({
    required this.playersOnline,
    required this.recordPlayers,
    required this.recordDate,
    required this.regularWorlds,
    this.tournamentWorlds,
  });

  factory Worlds.fromJson(Map<String, dynamic> json) {
    return Worlds(
      playersOnline: json['players_online'] ?? 0,
      recordPlayers: json['record_players'] ?? 0,
      recordDate: _parseDateTime(json['record_date']),
      regularWorlds:
          json['regular_worlds'] != null
              ? List<RegularWorld>.from(
                json['regular_worlds'].map((x) => RegularWorld.fromJson(x)),
              )
              : [],
      tournamentWorlds: json['tournament_worlds'] ?? [],
    );
  }

  static DateTime _parseDateTime(String? dateString) {
    try {
      return dateString != null ? DateTime.parse(dateString) : DateTime(1970);
    } catch (e) {
      return DateTime(1970);
    }
  }

  List<RegularWorld> get safeTournamentWorlds {
    if (tournamentWorlds is List) {
      return List<RegularWorld>.from(
        (tournamentWorlds as List).map((x) => RegularWorld.fromJson(x)),
      );
    }
    return [];
  }
}

class RegularWorld {
  final String name;
  final String status;
  final int playersOnline;
  final String location;
  final String pvpType;
  final bool premiumOnly;
  final String transferType;
  final bool battleyeProtected;
  final String battleyeDate;
  final String gameWorldType;
  final String tournamentWorldType;

  RegularWorld({
    required this.name,
    required this.status,
    required this.playersOnline,
    required this.location,
    required this.pvpType,
    required this.premiumOnly,
    required this.transferType,
    required this.battleyeProtected,
    required this.battleyeDate,
    required this.gameWorldType,
    required this.tournamentWorldType,
  });

  factory RegularWorld.fromJson(Map<String, dynamic> json) {
    String rawLocation = json['location'] ?? 'Unknown Location';
    String rawStatus = json['status'] ?? 'Unknown Status';
    String locationWithEmoji = _getLocationWithEmoji(rawLocation);
    String statusWithEmoji = _getStatusImage(rawStatus);

    return RegularWorld(
      name: json['name'] ?? 'Unknown World',
      status: statusWithEmoji,
      playersOnline: json['players_online'] ?? 0,
      location: locationWithEmoji,
      pvpType: json['pvp_type'] ?? 'Unknown PvP Type',
      premiumOnly: json['premium_only'] ?? false,
      transferType: json['transfer_type'] ?? 'Unknown Transfer',
      battleyeProtected: json['battleye_protected'] ?? false,
      battleyeDate: json['battleye_date'] ?? 'Unknown Date',
      gameWorldType: json['game_world_type'] ?? 'Regular',
      tournamentWorldType: json['tournament_world_type'] ?? 'None',
    );
  }

  static String _getLocationWithEmoji(String location) {
    switch (location) {
      case 'North America':
        return '🇺🇸';
      case 'South America':
        return '🇧🇷';
      case 'Europe':
        return '🇪🇺';
      case 'Oceania':
        return '🇦🇺';
      default:
        return '🏳️';
    }
  }
}

String _getStatusImage(String? status) {
  if (status == null) return ImagesConstants.manutencao;
  switch (status.toLowerCase()) {
    case 'online':
      return ImagesConstants.online;
    case 'offline':
      return ImagesConstants.offline;
    default:
      return ImagesConstants.manutencao;
  }
}

class Information {
  final Api api;
  final DateTime timestamp;
  final List<String> tibiaUrls;
  final Status status;

  Information({
    required this.api,
    required this.timestamp,
    required this.tibiaUrls,
    required this.status,
  });

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      api: Api.fromJson(json['api'] ?? {}),
      timestamp: _parseInfoDateTime(json['timestamp']),
      tibiaUrls: List<String>.from(json['tibia_urls'] ?? []),
      status: Status.fromJson(json['status'] ?? {}),
    );
  }

  static DateTime _parseInfoDateTime(String? dateString) {
    try {
      return dateString != null ? DateTime.parse(dateString) : DateTime.now();
    } catch (e) {
      return DateTime.now();
    }
  }
}

class Api {
  final int version;
  final String release;
  final String commit;

  Api({required this.version, required this.release, required this.commit});

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      version: json['version'] ?? 0,
      release: json['release'] ?? 'Unknown',
      commit: json['commit'] ?? 'Unknown',
    );
  }
}

class Status {
  final int httpCode;
  final int error;
  final String message;

  Status({required this.httpCode, required this.error, required this.message});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      httpCode: json['http_code'] ?? 0,
      error: json['error'] ?? 0,
      message: json['message'] ?? 'Unknown Status',
    );
  }
}

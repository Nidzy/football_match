class MatchModel {
  Filters filters;
  ResultSet resultSet;
  Competition competition;
  List<Matches> matches;

  MatchModel({this.filters, this.resultSet, this.competition, this.matches});

  MatchModel.fromJson(Map<String, dynamic> json) {
    this.filters = json["filters"] == null ? null : Filters.fromJson(json["filters"]);
    this.resultSet = json["resultSet"] == null ? null : ResultSet.fromJson(json["resultSet"]);
    this.competition = json["competition"] == null ? null : Competition.fromJson(json["competition"]);
    this.matches = json["matches"]==null ? null : (json["matches"] as List).map((e)=>Matches.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.filters != null)
      data["filters"] = this.filters.toJson();
    if(this.resultSet != null)
      data["resultSet"] = this.resultSet.toJson();
    if(this.competition != null)
      data["competition"] = this.competition.toJson();
    if(this.matches != null)
      data["matches"] = this.matches.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Matches {
  Area area;
  Competition1 competition;
  Season season;
  int id;
  String utcDate;
  String status;
  dynamic matchday;
  String stage;
  dynamic group;
  String lastUpdated;
  HomeTeam homeTeam;
  AwayTeam awayTeam;
  Score score;
  Odds odds;
  List<Referees> referees;

  Matches({this.area, this.competition, this.season, this.id, this.utcDate, this.status, this.matchday, this.stage, this.group, this.lastUpdated, this.homeTeam, this.awayTeam, this.score, this.odds, this.referees});

  Matches.fromJson(Map<String, dynamic> json) {
    this.area = json["area"] == null ? null : Area.fromJson(json["area"]);
    this.competition = json["competition"] == null ? null : Competition1.fromJson(json["competition"]);
    this.season = json["season"] == null ? null : Season.fromJson(json["season"]);
    this.id = json["id"];
    this.utcDate = json["utcDate"];
    this.status = json["status"];
    this.matchday = json["matchday"];
    this.stage = json["stage"];
    this.group = json["group"];
    this.lastUpdated = json["lastUpdated"];
    this.homeTeam = json["homeTeam"] == null ? null : HomeTeam.fromJson(json["homeTeam"]);
    this.awayTeam = json["awayTeam"] == null ? null : AwayTeam.fromJson(json["awayTeam"]);
    this.score = json["score"] == null ? null : Score.fromJson(json["score"]);
    this.odds = json["odds"] == null ? null : Odds.fromJson(json["odds"]);
    this.referees = json["referees"]==null ? null : (json["referees"] as List).map((e)=>Referees.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.area != null)
      data["area"] = this.area.toJson();
    if(this.competition != null)
      data["competition"] = this.competition.toJson();
    if(this.season != null)
      data["season"] = this.season.toJson();
    data["id"] = this.id;
    data["utcDate"] = this.utcDate;
    data["status"] = this.status;
    data["matchday"] = this.matchday;
    data["stage"] = this.stage;
    data["group"] = this.group;
    data["lastUpdated"] = this.lastUpdated;
    if(this.homeTeam != null)
      data["homeTeam"] = this.homeTeam.toJson();
    if(this.awayTeam != null)
      data["awayTeam"] = this.awayTeam.toJson();
    if(this.score != null)
      data["score"] = this.score.toJson();
    if(this.odds != null)
      data["odds"] = this.odds.toJson();
    if(this.referees != null)
      data["referees"] = this.referees.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Referees {
  int id;
  String name;
  String type;
  String nationality;

  Referees({this.id, this.name, this.type, this.nationality});

  Referees.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.type = json["type"];
    this.nationality = json["nationality"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["type"] = this.type;
    data["nationality"] = this.nationality;
    return data;
  }
}

class Odds {
  String msg;

  Odds({this.msg});

  Odds.fromJson(Map<String, dynamic> json) {
    this.msg = json["msg"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["msg"] = this.msg;
    return data;
  }
}

class Score {
  String winner;
  String duration;
  FullTime fullTime;
  HalfTime halfTime;

  Score({this.winner, this.duration, this.fullTime, this.halfTime});

  Score.fromJson(Map<String, dynamic> json) {
    this.winner = json["winner"];
    this.duration = json["duration"];
    this.fullTime = json["fullTime"] == null ? null : FullTime.fromJson(json["fullTime"]);
    this.halfTime = json["halfTime"] == null ? null : HalfTime.fromJson(json["halfTime"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["winner"] = this.winner;
    data["duration"] = this.duration;
    if(this.fullTime != null)
      data["fullTime"] = this.fullTime.toJson();
    if(this.halfTime != null)
      data["halfTime"] = this.halfTime.toJson();
    return data;
  }
}

class HalfTime {
  int home;
  int away;

  HalfTime({this.home, this.away});

  HalfTime.fromJson(Map<String, dynamic> json) {
    this.home = json["home"];
    this.away = json["away"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["home"] = this.home;
    data["away"] = this.away;
    return data;
  }
}

class FullTime {
  int home;
  int away;

  FullTime({this.home, this.away});

  FullTime.fromJson(Map<String, dynamic> json) {
    this.home = json["home"];
    this.away = json["away"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["home"] = this.home;
    data["away"] = this.away;
    return data;
  }
}

class AwayTeam {
  int id;
  String name;
  String shortName;
  String tla;
  dynamic crest;

  AwayTeam({this.id, this.name, this.shortName, this.tla, this.crest});

  AwayTeam.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.shortName = json["shortName"];
    this.tla = json["tla"];
    this.crest = json["crest"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["shortName"] = this.shortName;
    data["tla"] = this.tla;
    data["crest"] = this.crest;
    return data;
  }
}

class HomeTeam {
  int id;
  String name;
  String shortName;
  String tla;
  dynamic crest;

  HomeTeam({this.id, this.name, this.shortName, this.tla, this.crest});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.shortName = json["shortName"];
    this.tla = json["tla"];
    this.crest = json["crest"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["shortName"] = this.shortName;
    data["tla"] = this.tla;
    data["crest"] = this.crest;
    return data;
  }
}

class Season {
  int id;
  String startDate;
  String endDate;
  int currentMatchday;
  dynamic winner;

  Season({this.id, this.startDate, this.endDate, this.currentMatchday, this.winner});

  Season.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.startDate = json["startDate"];
    this.endDate = json["endDate"];
    this.currentMatchday = json["currentMatchday"];
    this.winner = json["winner"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["startDate"] = this.startDate;
    data["endDate"] = this.endDate;
    data["currentMatchday"] = this.currentMatchday;
    data["winner"] = this.winner;
    return data;
  }
}

class Competition1 {
  int id;
  String name;
  String code;
  String type;
  String emblem;

  Competition1({this.id, this.name, this.code, this.type, this.emblem});

  Competition1.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.code = json["code"];
    this.type = json["type"];
    this.emblem = json["emblem"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["code"] = this.code;
    data["type"] = this.type;
    data["emblem"] = this.emblem;
    return data;
  }
}

class Area {
  int id;
  String name;
  String code;
  String flag;

  Area({this.id, this.name, this.code, this.flag});

  Area.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.code = json["code"];
    this.flag = json["flag"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["code"] = this.code;
    data["flag"] = this.flag;
    return data;
  }
}

class Competition {
  int id;
  String name;
  String code;
  String type;
  String emblem;

  Competition({this.id, this.name, this.code, this.type, this.emblem});

  Competition.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.code = json["code"];
    this.type = json["type"];
    this.emblem = json["emblem"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["code"] = this.code;
    data["type"] = this.type;
    data["emblem"] = this.emblem;
    return data;
  }
}

class ResultSet {
  int count;
  String first;
  String last;
  int played;

  ResultSet({this.count, this.first, this.last, this.played});

  ResultSet.fromJson(Map<String, dynamic> json) {
    this.count = json["count"];
    this.first = json["first"];
    this.last = json["last"];
    this.played = json["played"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["count"] = this.count;
    data["first"] = this.first;
    data["last"] = this.last;
    data["played"] = this.played;
    return data;
  }
}

class Filters {
  String season;

  Filters({this.season});

  Filters.fromJson(Map<String, dynamic> json) {
    this.season = json["season"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["season"] = this.season;
    return data;
  }
}
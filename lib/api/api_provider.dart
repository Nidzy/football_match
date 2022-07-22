import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bt/data/match.dart';
import 'package:flutter_bt/utility/constants.dart';

class ApiProvider {
  //call api of champions league matches
  Future<MatchModel> loadMatchesLatest(String todayDate, String dateBeforeThirtyDays) async {
    final response = await Dio().get('https://api.football-data.org/v4/competitions/CL/matches',
    queryParameters: {'dateFrom' : dateBeforeThirtyDays , 'dateTo': todayDate},
        options: Options(headers: {"X-Auth-token": x_auth_token}));
    print("loadMatches " + response.toString());

    if (response.statusCode == 200) {
      return MatchModel.fromJson(json.decode(response.toString()));
    } else {
      throw Exception("Failed to get matches");
    }
  }
}

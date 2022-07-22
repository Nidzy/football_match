import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bt/api/api_client.dart';
import 'package:flutter_bt/data/match.dart';
import 'package:flutter_bt/utility/api_constants.dart';
import 'package:flutter_bt/utility/constants.dart';

class ApiInterface {
  Future<MatchModel> loadMatchesLatest() async {
    String matchUrl = ApiClient.matchUrl;

    //final response = await http.get(Uri.parse(requestUrl));
    // final response = await Dio().get('https://api.football-data.org/v4/competitions/CL/matches',
    final response = await Dio().get(matches_url,
        options: Options(headers: {"X-Auth-token": x_auth_token}));

    print("loadMatches " + matchUrl);
    print("loadMatches " + response.toString());

    if (response.statusCode == 200) {
      return MatchModel.fromJson(json.decode(response.toString()));
    } else {
      throw Exception("Failed to get matches");
    }
  }
}

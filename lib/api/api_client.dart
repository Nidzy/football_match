import 'package:flutter_bt/api/api_interface.dart';
import 'package:flutter_bt/utility/api_constants.dart';

class ApiClient {
  // static const String baseUrl = "http://api.football-data.org/v4/competitions/CL/matches";
  static const String matchUrl = matches_url;
  static ApiInterface network = ApiInterface();
}

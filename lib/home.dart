import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bt/api/api_client.dart';
import 'package:flutter_bt/data/match.dart';
import 'package:flutter_bt/utility/constants.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

bool isTablet;
bool isPhone;

final double devicePixelRatio = ui.window.devicePixelRatio;
final ui.Size size = ui.window.physicalSize;
final double width = size.width;
final double height = size.height;
final ValueNotifier<bool> isPortrait = ValueNotifier<bool>(true);

DateTime now = DateTime.now();
String formattedTodayDate = DateFormat(dateFormat).format(now);
var jiffy = Jiffy().subtract(days: 30);
DateTime dateBeforeThirtyDays = jiffy.dateTime;
String s = jiffy.format(dateFormat);
String formattedDateBeforeThirtyDays =
    DateFormat(dateFormat).format(dateBeforeThirtyDays);

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<MatchModel> matchModel;

  @override
  void initState() {
    super.initState();
    matchModel = ApiClient.network
        .loadMatchesLatest(formattedTodayDate, formattedDateBeforeThirtyDays);
  }

  @override
  Widget build(BuildContext context) {
    if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      isTablet = true;
      isPhone = false;
    } else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      isTablet = true;
      isPhone = false;
    } else {
      isTablet = false;
      isPhone = true;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Champions League',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
        ),
        body: uiWidgets());
  }

  Widget uiWidgets() {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      isPortrait.value = orientation == Orientation.portrait;
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
            future: matchModel,
            builder: (context, AsyncSnapshot<MatchModel> snapshot) {
              List<Matches> allMatchData;
              if (snapshot.hasData) {
                allMatchData = snapshot.data.matches;
                return createMatchList(allMatchData, context);
              } else {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ));
              }
            }),
      );
    });
  }

  Widget createMatchList(List<Matches> allMatchData, BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(5),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 5,
        );
      },
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: allMatchData.length,
      itemBuilder: (context, int index) {
        return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                allMatchData[index].score.winner != null &&
                        allMatchData[index].awayTeam.name != null &&
                        allMatchData[index].homeTeam.name != null
                    ? Text(
                        allMatchData[index].score.winner != "DRAW"
                            ? "Winner: " + allMatchData[index].score.winner
                            : allMatchData[index].score.winner,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'MuktaSemiBold'),
                      )
                    : Container(
                        child: Text('Data Not Found'),
                      ),
                Text(allMatchData[index].score.winner != null &&
                        allMatchData[index].score.winner == "AWAY_TEAM"
                    ? allMatchData[index].awayTeam.name != null
                        ? "Team Name: " + allMatchData[index].awayTeam.name
                        : ""
                    : allMatchData[index].homeTeam.name != null
                        ? "Team Name: " + allMatchData[index].homeTeam.name
                        : "")
              ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                ],
              ),
              height: 80,
              width: width,
            ));
      },
    );
  }
}

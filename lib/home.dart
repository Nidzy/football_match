import 'package:flutter/material.dart';
import 'package:flutter_bt/api/api_client.dart';
import 'package:flutter_bt/data/match.dart';
import 'package:intl/intl.dart';

import 'dart:ui' as ui;

bool isTablet;
bool isPhone;

final double devicePixelRatio = ui.window.devicePixelRatio;
final ui.Size size = ui.window.physicalSize;
final double width = size.width;
final double height = size.height;
final ValueNotifier<bool> isPortrait = ValueNotifier<bool>(true);

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<MatchModel> matchModel;
  String fromDate = "2022-06-22";
  String toDate = "2022-07-22";

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    super.initState();

    dateInput.text = ""; //set the initial value of text field
    matchModel = ApiClient.network.loadMatchesLatest();
  }

  @override
  Widget build(BuildContext context) {

    if(devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      isTablet = true;
      isPhone = false;
    }
    else if(devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      isTablet = true;
      isPhone = false;
    }
    else {
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
        body: OrientationBuilder(
    builder: (BuildContext context, Orientation orientation) {
    isPortrait.value = orientation == Orientation.portrait; return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(children: [
          Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.width / 3,
              child: Center(
                  child: TextField(
                controller: dateInput,
                //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ))),
          FutureBuilder(
              future: matchModel,
              builder: (context, AsyncSnapshot<MatchModel> snapshot) {
                List<Matches> allMatchData;
                // allMatchData = snapshot.data.matchess;
                // return createMatchList(allMatchData, context);
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
        ]));}));
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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  allMatchData[index].score.winner,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'MuktaSemiBold'),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, spreadRadius: 0.5),
                  ],
                ),
                height: 80,
                width: MediaQuery.of(context).size.width,
              ),
            );
          },
        );
  }
}

/*void getHttp() async {
  try {
    var response = await Dio().get('https://api.football-data.org/v4/competitions/CL/matches?dateFrom ="2022-06-22",dateTo="2022-07-22"',*/ /*queryParameters: {
    "X-Auth-token": x_auth_token,
    }*/ /*options: Options(headers: {"X-Auth-token": x_auth_token}));
    print(response);
  } catch (e) {
    print(e);
  }
}*/

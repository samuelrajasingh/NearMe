import 'package:NearMe/constant.dart';
import 'package:NearMe/model/Distwise.dart';
import 'package:NearMe/model/covidmodel.dart';
import 'package:NearMe/widgets/counter.dart';
import 'package:NearMe/widgets/my_header_info.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';
  
import 'package:fl_chart/fl_chart.dart';
import 'indicator.dart';
import 'model/Districtwise.dart';
import 'model/covidmodel.dart';

class DistrictData extends StatefulWidget {
  final  Statewise statewise;
  

  const DistrictData({
    Key key,
    this.statewise,
  }) : super(key: key);

  @override
  _DistrictDataState createState() => _DistrictDataState();
}

class _DistrictDataState extends State<DistrictData> {
  final controller = ScrollController();
  double offset = 0;
  Districtwise districtwise;
  DistrictDatum districtDatum;
  int touchedIndex;
  int active ;
   Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];
  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
    // dataMap.putIfAbsent("Infected", () => widget.statewise.);
    // dataMap.putIfAbsent("Active", () =>((widget.statewise.active).toInt());
    // dataMap.putIfAbsent("Death", () => 2);
    // dataMap.putIfAbsent("Recovered", () => 2)
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader2(
              image: "assets/icons/coronadr.svg",
              textTop: "District Wise Data",
              textBottom: "Stay safe.",
              offset: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    widget.statewise.state != "Total"
                        ? Text(
                            widget.statewise.state,
                            style: kTitleTextstyle,
                          )
                        : Text(
                            "India",
                            style: kTitleTextstyle,
                          ),
                    SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: DataCard(
              value:
                  "${widget.statewise.confirmed}",
              title: "Confirmed",
              isActive: true,
              color: kInfectedColor,
              
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: DataCard(
                value:
                    "${widget.statewise.active}",
                title: "Active",
                color: kPrimaryColor),
                          ),
              Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: DataCard(
                value:
                    "${widget.statewise.recovered}",
                title: "Recovered",
                color: kRecovercolor),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: DataCard(
              value:
                  "${widget.statewise.deaths}",
              title: "Deaths",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(height: 0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:widget.statewise.confirmed !="0"? buildpie(context):Container(height:0,width:0),
                    ),
                    widget.statewise.state != "Total"
                        ? Text("Distrct Wise Data", style: kTitleTextstyle)
                        : Container(),
                    // SizedBox(height: 10),

           widget.statewise.state != "Total"
                        ?       Container(
                      child: FutureBuilder<List<Districtwise>>(
                          future: getDist(),
                          builder: (context, snapshot) {
                            List<Districtwise> districtwise = snapshot.data;
                            //List<DistrictDatum> districtdata;

                            if (snapshot.hasError) {
              return Column(
                children: <Widget>[
                  Center(
                      child: Text(
                    "Something Went Wrong",
                    style: TextStyle(color: kPrimaryColor),
                  ))
                ],
              );
                            }
                            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                      child: CircularProgressIndicator(
                          //backgroundColor: Colors.pink[500],
                          )),
                );
              case ConnectionState.waiting:
              //  return Padding(
              //    padding: const EdgeInsets.all(20.0),
              //    child: Center(
              //         child: CircularProgressIndicator(
              //             //backgroundColor: Colors.pink[500],
              //             )),
              //  );
              case ConnectionState.active:
                    //  return Center(
                    // child: CircularProgressIndicator(
                    //     //backgroundColor: Colors.pink[500],
                    //     ));
              case ConnectionState.done:
                if (snapshot.hasData) {
                  for (var i = 0;
                      i <= districtwise?.length ?? 0;
                      i++) {
                    if (widget.statewise.state ==
                        snapshot.data[i].state)
                      return _build(
                          context, snapshot.data[i].districtData);
                  }
                }
              //  }
              // return ListView.builder(
              //     shrinkWrap: true,
              //     physics: ClampingScrollPhysics(),
              //     itemCount: districtwise?.length ?? 0,
              //     itemBuilder: (BuildContext context, int index) {
              //       // districtdata =
              //       //     snapshot.data[index].districtData;
              //       return widget.statewise.state ==
              //               snapshot.data[index].state
              //           ? _build(context,
              //               snapshot.data[index].districtData)
              //           : Container();
                            } //}
                            return Container(height: 0, width: 0);
                          }),
                    ):Container(),
                    
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }

  Widget _build(context, districtDatum) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListView.builder(
          itemCount: districtDatum?.length ?? 0,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          districtDatum[index].district,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: Counter(
                                color: kInfectedColor,
                                number:
                                    districtDatum[index].confirmed.toString(),
                                title: "Infected",
                              ),
                            ),
                            Expanded(
                              child: Counter(
                                color: kDeathColor,
                                number:
                                    districtDatum[index].deceased.toString(),
                                title: "Deaths",
                              ),
                            ),
                            Expanded(
                              child: Counter(
                                color: kRecovercolor,
                                number:
                                    districtDatum[index].recovered.toString(),
                                title: "Recovered",
                              ),
                            )
                          ])),
                ],
              ),
            );
          }),
    );
  }
 Widget buildpie(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 2,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.4,
                child: PieChart(
                
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              pieTouchResponse.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                 
                  Indicator(
                    color: kInfectedColor,
                    text: 'Active',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: kRecovercolor,
                    text: 'Recovered',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Colors.black,
                    text: 'Death',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }
List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        // case 0:
        //   return PieChartSectionData(
        //     color: const Color(0xff0293ee),
        //     value: double.parse(widget.statewise.confirmed),
        //     title: '40%',
        //     radius: radius,
        //     titleStyle: TextStyle(
        //         fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
        //   );
        case 0:
          return PieChartSectionData(
            color: kInfectedColor,
            value:  double.parse(widget.statewise.active),
            title: '${((double.parse(widget.statewise.active) / double.parse(widget.statewise.confirmed) * 100).toStringAsPrecision(3))}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: kRecovercolor,
            value:  double.parse(widget.statewise.recovered),
            title: '${((double.parse(widget.statewise.recovered) / double.parse(widget.statewise.confirmed) * 100).toStringAsPrecision(3))}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.black,
            value:  double.parse(widget.statewise.deaths),
            title: '${((double.parse(widget.statewise.deaths) / double.parse(widget.statewise.confirmed) * 100).toStringAsPrecision(3))}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }


}



class DataCard extends StatelessWidget {
  final String value;
  final String title;
  final bool isActive;
  final color;
  const DataCard({
    Key key,
    this.value,
    this.title,
    this.isActive = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: Center(
                  child: Text(
                value,
                style: TextStyle(
                    fontSize: .04 * MediaQuery.of(context).size.width,
                    fontWeight: FontWeight.w800,
                    color: color),
              )),
              height: 60,
              width: 100,
            ),
          ),
          //Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

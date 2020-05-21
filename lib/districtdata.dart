import 'package:NearMe/constant.dart';
import 'package:NearMe/model/Distwise.dart';
import 'package:NearMe/model/covidmodel.dart';
import 'package:NearMe/widgets/counter.dart';
import 'package:NearMe/widgets/my_header_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';

import 'model/Districtwise.dart';
import 'model/covidmodel.dart';

class DistrictData extends StatefulWidget {
  final Statewise statewise;

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
  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
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
                  SizedBox(height: 2),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: DataCard(
                            value:
                                "${((double.parse(widget.statewise.active) / double.parse(widget.statewise.confirmed) * 100).toStringAsPrecision(3))}%",
                            title: "Active(%)",
                            isActive: true,
                            color: kInfectedColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: DataCard(
                              value:
                                  "${((double.parse(widget.statewise.recovered) / double.parse(widget.statewise.confirmed) * 100).toStringAsPrecision(3))}%",
                              title: "Recovery rate",
                              color: kRecovercolor),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: DataCard(
                            value:
                                "${((double.parse(widget.statewise.deaths) / double.parse(widget.statewise.confirmed) * 100).toStringAsPrecision(3))}%",
                            title: "Mortality rate",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  widget.statewise.state != "Total"
                      ? Text("Distrct Wise Data", style: kTitleTextstyle)
                      : Container(),
                  // SizedBox(height: 10),
                  Container(
                    child: FutureBuilder<List<Districtwise>>(
                        future: getDist(),
                        builder: (context, snapshot) {
                          List<Districtwise> districtwise = snapshot.data;
                          //List<DistrictDatum> districtdata;
                          if (snapshot.hasError) {
                            return Column(
                              children: <Widget>[
                                Center(child: Text("Something Went Wrong",style: TextStyle(color:kPrimaryColor),))
                              ],
                            );
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: districtwise?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                // districtdata =
                                //     snapshot.data[index].districtData;
                                return widget.statewise.state ==
                                        snapshot.data[index].state
                                    ? _build(context,
                                        snapshot.data[index].districtData)
                                    : Container();
                              });
                        }),
                  ),
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
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
                    fontSize: .06 * MediaQuery.of(context).size.width,
                    fontWeight: FontWeight.w600,
                    color: color),
              )),
              height: 60,
              width: 90,
            ),
          ),
          //Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

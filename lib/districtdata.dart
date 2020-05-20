import 'package:NearMe/constant.dart';
import 'package:NearMe/model/covidmodel.dart';
import 'package:NearMe/widgets/my_header_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constant.dart';
import 'constant.dart';
import 'model/covidmodel.dart';

class DistrictData extends StatefulWidget {
 final Statewise statewise;
 
  const DistrictData({Key key, this.statewise, }) : super(key: key);

   

  @override
  _DistrictDataState createState() => _DistrictDataState();
}

class _DistrictDataState extends State<DistrictData> {
  final controller = ScrollController();
  double offset = 0;

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
                  Text(
                   widget.statewise.state,
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 2),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        DataCard(
                          value: "${((double.parse(widget.statewise.active)/double.parse(widget.statewise.confirmed)*100).toStringAsPrecision(3))}%",
                          title: "Active(%)",
                          isActive: true,
                          color: kInfectedColor,
                        ),
                        DataCard(
                          value: "${((double.parse(widget.statewise.recovered)/double.parse(widget.statewise.confirmed)*100).toStringAsPrecision(3))}%",
                          title: "Recovery rate",
                          color:kRecovercolor
                        ),
                        DataCard(
                          value: "${((double.parse(widget.statewise.deaths)/double.parse(widget.statewise.confirmed)*100).toStringAsPrecision(3))}%",
                          title: "Mortality rate",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Distrct Wise Data", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  // PreventCard(
                  //   text:
                  //       "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                  //   image: "assets/images/wear_mask.png",
                  //   title: "Wear face mask",
                  // ),
                  // PreventCard(
                  //   text:
                  //       "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                  //   image: "assets/images/wash_hands.png",
                  //   title: "Wash your hands",
                  // ),
                  // SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
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
    this.isActive = false, this.color, 
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
            child: Container(child: Center(child: Text(value,style: TextStyle(fontSize: .06*MediaQuery.of(context).size.width,fontWeight: FontWeight.w600,color: color ),)),height: 60,width: 70,),
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

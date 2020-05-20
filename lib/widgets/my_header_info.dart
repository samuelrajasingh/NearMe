import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant.dart';
import 'my_header.dart';

class MyHeader2 extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  final String screen;
  const MyHeader2(
      {Key key, this.image, this.textTop, this.textBottom, this.offset, this.screen})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader2> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 50, right: 20),
        height: .45*MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        //  mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed:(){Navigator.pop(context);}

              ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    child: SvgPicture.asset(
                      widget.image,
                      width: .5*MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 20 - widget.offset / 2,
                    left:.4*MediaQuery.of(context).size.width,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
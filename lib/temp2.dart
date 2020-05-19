// import 'package:NearMe/constant.dart';
// import 'package:NearMe/map.dart';
// import 'package:NearMe/widgets/counter.dart';
// import 'package:NearMe/widgets/my_header.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Near Me',
//       theme: ThemeData(
//           scaffoldBackgroundColor: kBackgroundColor,
//           fontFamily: "Poppins",
//           textTheme: TextTheme(
//             bodyText1: kHeadingTextStyle),
//           ),
// darkTheme: ThemeData(
// scaffoldBackgroundColor:kBackgroundColordark,
// textTheme:TextTheme(
// bodyText1:TextStyle(color:kBodyTextColordark),
// )
// ),
//       home: HomeScreen(),
//       routes: {
//          'map':(context) => Maper(),
//           'home':(context)=>HomeScreen(),
//       },
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final controller = ScrollController();
//   double offset = 0;
//   String _state;
//   String mapname="andhra.png";
//   List<String> _states = new List<String>();
//   var stateMap = new Map();

//   @override
//   void initState() {
//     _states.addAll([
//       'Andhra Pradesh',
//       'Arunachal Pradesh',
//       'Assam',
//       'Bihar',
//       'Chhattisgarh',
//       'Goa',
//       'Gujarat',
//       'Haryana',
//       'Himachal Pradesh',
//       'Jharkhand',
//       'Karnataka',
//       'Kerala',
//       'Madhya  Pradesh',
//       'Manipur',
//       'Meghalaya',
//       'Mizoram',
//       'Nagaland',
//       'Odisha',
//       'Punjab',
//       'Rajasthan',
//       'Sikkim',
//       'Tamil Nadu',
//       'Telangana',
//       'Tripura',
//       'Uttar Pradesh',
//       'UttraKhand',
//       'WestBengal'
//     ]);
//     stateMap["states"] = _states;
//     stateMap["Andhra Pradesh"] = "andhra.png";
//     stateMap["Andaman"] = "andaman.png";
//     stateMap["Arunachal Pradesh"] = "arunachal.png";
//     stateMap["Assam"] = "assam.png";
//     stateMap["Bihar"] = "bihar.png";
//     stateMap["Chhattisgarh"] = "chhattisgarh.png";
//     stateMap["Delhi"] = "delhi.png";
//     stateMap["Daman and Diu"] = "daman.png";
//     stateMap["Goa"] = "goa.png";
//     stateMap["Gujart"] = "gujarat.png";
//     stateMap["Haryana"] = "haryana.png";
//     stateMap["Himachal Pradesh"] = "himachal.png";
//     stateMap["Jharkhand"] = "jharkhand.png";
//     stateMap["Karnataka"] = "karnataka.png";
//     stateMap["Kerala"] = "kerala.png";
//     stateMap["Ladakh"] = "ladakh.png";
//    // stateMap["Lakshadweep"] = "lakshadweep.png";
//     stateMap["Madhya Pradesh"] = "madhya.png";
//     stateMap["Manipur"] = "manipur.png";
//     stateMap["Meghalaya"] = "meghalaya.png";
//     stateMap["Mizoram"] = "mizoram.png";
//     stateMap["Nagaland"] = "nagaland.png";
//     stateMap["Odisha"] = "odisha.png";
//     stateMap["Puducherry"] = "puducherry.png";
//     stateMap["Punjab"] = "punjab.png";
//     stateMap["Rajasthan"] = "rajasthan.png";
//     stateMap["Sikkim"] = "sikkim.png";
//     stateMap["Tamil Nadu"] = "tamilNadu.png";
//     stateMap["Telangana"] = "telangana.png";
//     stateMap["Tripura"] = "Tripura.png";
//     stateMap["Uttar Pradesh"] = "uttar.png";
//     stateMap["UttraKhand"] = "uttraKhand.png";
//     stateMap["West Bengal"] = "westbengal.png";
//     _state = _states.elementAt(0);
//     super.initState();
//     controller.addListener(onScroll);
//   }
//   _dropdownChanged(){
// debugPrint('mapname= $mapname'+ "before set state");

//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   void onScroll() {
//     setState(() {
//       offset = (controller.hasClients) ? controller.offset : 0;
//     });
//   }
//    _renderstate(mapname) {
//     // print('inside render state '+ mapname);
//     return Image.asset(
//       "assets/states/$mapname",
//       fit: BoxFit.contain,
//     );

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         controller: controller,
//         child: Column(
//           children: <Widget>[
//             MyHeader(
//               image: "assets/icons/Drcorona.svg",
//               textTop: "All you need",
//               textBottom: "is stay at home.",
//               offset: offset,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               height: 60,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(25),
//                 border: Border.all(
//                   color: Color(0xFFE5E5E5),
//                 ),
//               ),
//               child: Row(
//                 children: <Widget>[
//                   SvgPicture.asset("assets/icons/maps-and-flags.svg"),
//                   SizedBox(width: 20),
//                   Expanded(
//                     child: DropdownButton(
//                       isExpanded: true,
//                       underline: SizedBox(),
//                       icon: SvgPicture.asset("assets/icons/dropdown.svg"),
//                       value: _state,
//                       elevation: 16,
//                       onChanged: (state) async {
//                         _dropdownChanged();
//                         setState(() {
//                           _state = state;
//                           mapname = stateMap[state] ;
//                         });
//                         debugPrint('inside onchanged ${stateMap[state]}  mapname  $mapname' );
//                         var mapvalue=stateMap[state] ;
//                         await _renderstate(mapvalue);
//                       },
//                       items: _states
//                           .map<DropdownMenuItem<String>>((String _state) {
//                         return DropdownMenuItem<String>(
//                           value: _state,
//                           child: Text(_state),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Case Update\n",
//                               style: kTitleTextstyle,
//                             ),
//                             TextSpan(
//                               text: "Newest update March 28",
//                               style: TextStyle(
//                                 color: kTextLightColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       Text(
//                         "See details",
//                         style: TextStyle(
//                           color: kPrimaryColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           offset: Offset(0, 4),
//                           blurRadius: 30,
//                           color: kShadowColor,
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Counter(
//                           color: kInfectedColor,
//                           number: 1046,
//                           title: "Infected",
//                         ),
//                         Counter(
//                           color: kDeathColor,
//                           number: 87,
//                           title: "Deaths",
//                         ),
//                         Counter(
//                           color: kRecovercolor,
//                           number: 46,
//                           title: "Recovered",
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "Spread of Virus",
//                         style: kTitleTextstyle,
//                       ),
//                       Text(
//                         "See details",
//                         style: TextStyle(
//                           color: kPrimaryColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 20),
//                     padding: EdgeInsets.all(20),
//                     height: 178,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           offset: Offset(0, 10),
//                           blurRadius: 30,
//                           color: kShadowColor,
//                         ),
//                       ],
//                     ),
//                     child: GestureDetector(
//                       onTap: () => Navigator.pushNamed(context, 'map'),
//                       child:  _renderstate(mapname),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // Image.asset(
// //                       "assets/images/map.png",
// //                       fit: BoxFit.contain,
// //                     ),

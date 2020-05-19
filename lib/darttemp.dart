// import 'package:NearMe/constant.dart';
// import 'package:NearMe/map.dart';
// import 'package:NearMe/widgets/counter.dart';
// import 'package:NearMe/widgets/my_header.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'model/covidmodel.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

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
//   Statewise cstatewise;
//   double offset = 0;
//   String _state ;
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
//   //  _state = _states.elementAt(0);
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
//                       child: FutureBuilder<List<Statewise>>(
//                       future:_fetchData(),
//                       builder: (BuildContext context, AsyncSnapshot<List<Statewise>> snapshot) {
//                         if (!snapshot.hasData) return Container();
//                         return DropdownButton(
//                           isExpanded: true,
//                           underline: SizedBox(),
//                           icon: SvgPicture.asset("assets/icons/dropdown.svg"),
//                           value:cstatewise,
//                           elevation: 16,
//                           hint: Text("India"),
//                           onChanged: (value) async {
//                             _dropdownChanged();
//                             setState(() {
//                                     cstatewise=value;
//                              // _state = statewise.state;
//                               //mapname = stateMap[statewise.state] ;
//                             });
//                             debugPrint('inside onchanged ${stateMap[cstatewise.state]}  mapname  $mapname' );
//                            // var mapvalue=stateMap[cstatewise.state] ;
//                             //await _renderstate(mapvalue);
//                           },
//                           items: snapshot.data
//                               .map((statewise) => DropdownMenuItem<Statewise>(
//                               child: Text(statewise.state),
//                               value: statewise,

//                             ))
//                         .toList(),
//                         );
//                       }

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

// Future<List<Statewise>> _fetchData() async {
//     final listAPIUrl = 'https://api.covid19india.org/data.json';
//     final response = await http.get(listAPIUrl);
//     try {
//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.body)['statewise'].cast<Map<String, dynamic>>();
        
//        List<Statewise> listOfStates = jsonResponse.map<Statewise>((json) {
//         return Statewise.fromJson(json);
//       }).toList();
//         return listOfStates;
        
        
//       } else {
//         throw Exception('Failed to load jobs from API');
//       }
//     } catch (e) {
//       throw Exception('Failed to load jobs from API');
//     }
//   }

// }
// // Image.asset(
// //                       "assets/images/map.png",
// //                       fit: BoxFit.contain,
// //                     ),

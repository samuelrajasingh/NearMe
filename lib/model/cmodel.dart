// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:json_annotation/json_annotation.dart';
// part 'cmodel.g.dart';


// @JsonSerializable()
// class Coviddetails {
//   final List<CasesTimeSeries> casesTimeSeries;
//   final List<Statewise> statewise;
//   final List<Tested> tested;

//   Coviddetails({this.casesTimeSeries, this.statewise, this.tested});
//   factory Coviddetails.fromJson(Map<String, dynamic> json) =>
//       _$CoviddetailsFromJson(json);
//   Map<String, dynamic> toJson() => _$CoviddetailsToJson(this);

  
// }

// @JsonSerializable()
// class CasesTimeSeries {
//   final String dailyconfirmed;
//   final String dailydeceased;
//   final String dailyrecovered;
//   final String date;
//   final String totalconfirmed;
//   final String totaldeceased;
//   final String totalrecovered;

//   CasesTimeSeries(
//       {this.dailyconfirmed,
//       this.dailydeceased,
//       this.dailyrecovered,
//       this.date,
//       this.totalconfirmed,
//       this.totaldeceased,
//       this.totalrecovered});

//     factory CasesTimeSeries.fromJson(Map<String, dynamic> json) =>
//       _$CasesTimeSeriesFromJson(json);
//   Map<String, dynamic> toJson() => _$CasesTimeSeriesToJson(this);

//   }

 


// @JsonSerializable()
// class Statewise {
//   final String active;
//   final String confirmed;
//   final String deaths;
//   final String deltaconfirmed;
//   final String deltadeaths;
//   final String deltarecovered;
//   final String lastupdatedtime;
//   final String recovered;
//   final String state;
//   final String statecode;
//   final String statenotes;

//   Statewise(
//       {this.active,
//       this.confirmed,
//       this.deaths,
//       this.deltaconfirmed,
//       this.deltadeaths,
//       this.deltarecovered,
//       this.lastupdatedtime,
//       this.recovered,
//       this.state,
//       this.statecode,
//       this.statenotes});

//     factory Statewise.fromJson(Map<String, dynamic> json) =>
//       _$StatewiseFromJson(json);
//   Map<String, dynamic> toJson() => _$StatewiseToJson(this);
// }

// @JsonSerializable()
// class Tested {
//   final String individualstestedperconfirmedcase;
//   final String positivecasesfromsamplesreported;
//   final String samplereportedtoday;
//   final String source;
//   final String testpositivityrate;
//   final String testsconductedbyprivatelabs;
//   final String testsperconfirmedcase;
//   final String totalindividualstested;
//   final String totalpositivecases;
//   final String totalsamplestested;
//   final String updatetimestamp;

//   Tested(
//       {this.individualstestedperconfirmedcase,
//       this.positivecasesfromsamplesreported,
//       this.samplereportedtoday,
//       this.source,
//       this.testpositivityrate,
//       this.testsconductedbyprivatelabs,
//       this.testsperconfirmedcase,
//       this.totalindividualstested,
//       this.totalpositivecases,
//       this.totalsamplestested,
//       this.updatetimestamp});

  
//     factory Tested.fromJson(Map<String, dynamic> json) =>
//       _$TestedFromJson(json);
//   Map<String, dynamic> toJson() => _$TestedToJson(this);
// }

//  Future<Coviddetails> getData() async {
//     const url = 'https://api.covid19india.org/data.json';

//     // Retrieve the locations of Google offices
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       return Coviddetails.fromJson(json.decode(response.body));
//     } else {
//       throw HttpException(
//           'Unexpected status code ${response.statusCode}:'
//           ' ${response.reasonPhrase}',
//           uri: Uri.parse(url));
//     }
//   }
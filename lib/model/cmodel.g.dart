// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'cmodel.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// Coviddetails _$CoviddetailsFromJson(Map<String, dynamic> json) {
//   return Coviddetails(
//     casesTimeSeries: (json['casesTimeSeries'] as List)
//         ?.map((e) => e == null
//             ? null
//             : CasesTimeSeries.fromJson(e as Map<String, dynamic>))
//         ?.toList(),
//     statewise: (json['statewise'] as List)
//         ?.map((e) =>
//             e == null ? null : Statewise.fromJson(e as Map<String, dynamic>))
//         ?.toList(),
//     tested: (json['tested'] as List)
//         ?.map((e) =>
//             e == null ? null : Tested.fromJson(e as Map<String, dynamic>))
//         ?.toList(),
//   );
// }

// Map<String, dynamic> _$CoviddetailsToJson(Coviddetails instance) =>
//     <String, dynamic>{
//       'casesTimeSeries': instance.casesTimeSeries,
//       'statewise': instance.statewise,
//       'tested': instance.tested,
//     };

// CasesTimeSeries _$CasesTimeSeriesFromJson(Map<String, dynamic> json) {
//   return CasesTimeSeries(
//     dailyconfirmed: json['dailyconfirmed'] as String,
//     dailydeceased: json['dailydeceased'] as String,
//     dailyrecovered: json['dailyrecovered'] as String,
//     date: json['date'] as String,
//     totalconfirmed: json['totalconfirmed'] as String,
//     totaldeceased: json['totaldeceased'] as String,
//     totalrecovered: json['totalrecovered'] as String,
//   );
// }

// Map<String, dynamic> _$CasesTimeSeriesToJson(CasesTimeSeries instance) =>
//     <String, dynamic>{
//       'dailyconfirmed': instance.dailyconfirmed,
//       'dailydeceased': instance.dailydeceased,
//       'dailyrecovered': instance.dailyrecovered,
//       'date': instance.date,
//       'totalconfirmed': instance.totalconfirmed,
//       'totaldeceased': instance.totaldeceased,
//       'totalrecovered': instance.totalrecovered,
//     };

// Statewise _$StatewiseFromJson(Map<String, dynamic> json) {
//   return Statewise(
//     active: json['active'] as String,
//     confirmed: json['confirmed'] as String,
//     deaths: json['deaths'] as String,
//     deltaconfirmed: json['deltaconfirmed'] as String,
//     deltadeaths: json['deltadeaths'] as String,
//     deltarecovered: json['deltarecovered'] as String,
//     lastupdatedtime: json['lastupdatedtime'] as String,
//     recovered: json['recovered'] as String,
//     state: json['state'] as String,
//     statecode: json['statecode'] as String,
//     statenotes: json['statenotes'] as String,
//   );
// }

// Map<String, dynamic> _$StatewiseToJson(Statewise instance) => <String, dynamic>{
//       'active': instance.active,
//       'confirmed': instance.confirmed,
//       'deaths': instance.deaths,
//       'deltaconfirmed': instance.deltaconfirmed,
//       'deltadeaths': instance.deltadeaths,
//       'deltarecovered': instance.deltarecovered,
//       'lastupdatedtime': instance.lastupdatedtime,
//       'recovered': instance.recovered,
//       'state': instance.state,
//       'statecode': instance.statecode,
//       'statenotes': instance.statenotes,
//     };

// Tested _$TestedFromJson(Map<String, dynamic> json) {
//   return Tested(
//     individualstestedperconfirmedcase:
//         json['individualstestedperconfirmedcase'] as String,
//     positivecasesfromsamplesreported:
//         json['positivecasesfromsamplesreported'] as String,
//     samplereportedtoday: json['samplereportedtoday'] as String,
//     source: json['source'] as String,
//     testpositivityrate: json['testpositivityrate'] as String,
//     testsconductedbyprivatelabs: json['testsconductedbyprivatelabs'] as String,
//     testsperconfirmedcase: json['testsperconfirmedcase'] as String,
//     totalindividualstested: json['totalindividualstested'] as String,
//     totalpositivecases: json['totalpositivecases'] as String,
//     totalsamplestested: json['totalsamplestested'] as String,
//     updatetimestamp: json['updatetimestamp'] as String,
//   );
// }

// Map<String, dynamic> _$TestedToJson(Tested instance) => <String, dynamic>{
//       'individualstestedperconfirmedcase':
//           instance.individualstestedperconfirmedcase,
//       'positivecasesfromsamplesreported':
//           instance.positivecasesfromsamplesreported,
//       'samplereportedtoday': instance.samplereportedtoday,
//       'source': instance.source,
//       'testpositivityrate': instance.testpositivityrate,
//       'testsconductedbyprivatelabs': instance.testsconductedbyprivatelabs,
//       'testsperconfirmedcase': instance.testsperconfirmedcase,
//       'totalindividualstested': instance.totalindividualstested,
//       'totalpositivecases': instance.totalpositivecases,
//       'totalsamplestested': instance.totalsamplestested,
//       'updatetimestamp': instance.updatetimestamp,
//     };

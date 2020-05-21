// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// class Districtwise {
//     StateUnassigned stateUnassigned;
//     AndamanAndNicobarIslands andamanAndNicobarIslands;
//     AndhraPradesh andhraPradesh;
//     AndhraPradesh arunachalPradesh;
//     AndhraPradesh assam;
//     AndhraPradesh bihar;
//     Chandigarh chandigarh;
//     AndhraPradesh chhattisgarh;
//     AndhraPradesh delhi;
//     DadraAndNagarHaveliAndDamanAndDiu dadraAndNagarHaveliAndDamanAndDiu;
//     Goa goa;
//     AndhraPradesh gujarat;
//     AndhraPradesh himachalPradesh;
//     AndhraPradesh haryana;
//     AndhraPradesh jharkhand;
//     AndhraPradesh jammuAndKashmir;
//     AndhraPradesh karnataka;
//     AndhraPradesh kerala;
//     Ladakh ladakh;
//     Lakshadweep lakshadweep;
//     AndhraPradesh maharashtra;
//     AndhraPradesh meghalaya;
//     AndhraPradesh manipur;
//     AndhraPradesh madhyaPradesh;
//     AndhraPradesh mizoram;
//     AndhraPradesh nagaland;
//     AndhraPradesh odisha;
//     AndhraPradesh punjab;
//     Puducherry puducherry;
//     AndhraPradesh rajasthan;
//     Sikkim sikkim;
//     AndhraPradesh telangana;
//     AndhraPradesh tamilNadu;
//     Tripura tripura;
//     AndhraPradesh uttarPradesh;
//     AndhraPradesh uttarakhand;
//     AndhraPradesh westBengal;

//     Districtwise({
//         this.stateUnassigned,
//         this.andamanAndNicobarIslands,
//         this.andhraPradesh,
//         this.arunachalPradesh,
//         this.assam,
//         this.bihar,
//         this.chandigarh,
//         this.chhattisgarh,
//         this.delhi,
//         this.dadraAndNagarHaveliAndDamanAndDiu,
//         this.goa,
//         this.gujarat,
//         this.himachalPradesh,
//         this.haryana,
//         this.jharkhand,
//         this.jammuAndKashmir,
//         this.karnataka,
//         this.kerala,
//         this.ladakh,
//         this.lakshadweep,
//         this.maharashtra,
//         this.meghalaya,
//         this.manipur,
//         this.madhyaPradesh,
//         this.mizoram,
//         this.nagaland,
//         this.odisha,
//         this.punjab,
//         this.puducherry,
//         this.rajasthan,
//         this.sikkim,
//         this.telangana,
//         this.tamilNadu,
//         this.tripura,
//         this.uttarPradesh,
//         this.uttarakhand,
//         this.westBengal,
//     });

//     factory Districtwise.fromJson(Map<String, dynamic> json) => Districtwise(
//         stateUnassigned: StateUnassigned.fromJson(json["State Unassigned"]),
//         andamanAndNicobarIslands: AndamanAndNicobarIslands.fromJson(json["Andaman and Nicobar Islands"]),
//         andhraPradesh: AndhraPradesh.fromJson(json["Andhra Pradesh"]),
//         arunachalPradesh: AndhraPradesh.fromJson(json["Arunachal Pradesh"]),
//         assam: AndhraPradesh.fromJson(json["Assam"]),
//         bihar: AndhraPradesh.fromJson(json["Bihar"]),
//         chandigarh: Chandigarh.fromJson(json["Chandigarh"]),
//         chhattisgarh: AndhraPradesh.fromJson(json["Chhattisgarh"]),
//         delhi: AndhraPradesh.fromJson(json["Delhi"]),
//         dadraAndNagarHaveliAndDamanAndDiu: DadraAndNagarHaveliAndDamanAndDiu.fromJson(json["Dadra and Nagar Haveli and Daman and Diu"]),
//         goa: Goa.fromJson(json["Goa"]),
//         gujarat: AndhraPradesh.fromJson(json["Gujarat"]),
//         himachalPradesh: AndhraPradesh.fromJson(json["Himachal Pradesh"]),
//         haryana: AndhraPradesh.fromJson(json["Haryana"]),
//         jharkhand: AndhraPradesh.fromJson(json["Jharkhand"]),
//         jammuAndKashmir: AndhraPradesh.fromJson(json["Jammu and Kashmir"]),
//         karnataka: AndhraPradesh.fromJson(json["Karnataka"]),
//         kerala: AndhraPradesh.fromJson(json["Kerala"]),
//         ladakh: Ladakh.fromJson(json["Ladakh"]),
//         lakshadweep: Lakshadweep.fromJson(json["Lakshadweep"]),
//         maharashtra: AndhraPradesh.fromJson(json["Maharashtra"]),
//         meghalaya: AndhraPradesh.fromJson(json["Meghalaya"]),
//         manipur: AndhraPradesh.fromJson(json["Manipur"]),
//         madhyaPradesh: AndhraPradesh.fromJson(json["Madhya Pradesh"]),
//         mizoram: AndhraPradesh.fromJson(json["Mizoram"]),
//         nagaland: AndhraPradesh.fromJson(json["Nagaland"]),
//         odisha: AndhraPradesh.fromJson(json["Odisha"]),
//         punjab: AndhraPradesh.fromJson(json["Punjab"]),
//         puducherry: Puducherry.fromJson(json["Puducherry"]),
//         rajasthan: AndhraPradesh.fromJson(json["Rajasthan"]),
//         sikkim: Sikkim.fromJson(json["Sikkim"]),
//         telangana: AndhraPradesh.fromJson(json["Telangana"]),
//         tamilNadu: AndhraPradesh.fromJson(json["Tamil Nadu"]),
//         tripura: Tripura.fromJson(json["Tripura"]),
//         uttarPradesh: AndhraPradesh.fromJson(json["Uttar Pradesh"]),
//         uttarakhand: AndhraPradesh.fromJson(json["Uttarakhand"]),
//         westBengal: AndhraPradesh.fromJson(json["West Bengal"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "State Unassigned": stateUnassigned.toJson(),
//         "Andaman and Nicobar Islands": andamanAndNicobarIslands.toJson(),
//         "Andhra Pradesh": andhraPradesh.toJson(),
//         "Arunachal Pradesh": arunachalPradesh.toJson(),
//         "Assam": assam.toJson(),
//         "Bihar": bihar.toJson(),
//         "Chandigarh": chandigarh.toJson(),
//         "Chhattisgarh": chhattisgarh.toJson(),
//         "Delhi": delhi.toJson(),
//         "Dadra and Nagar Haveli and Daman and Diu": dadraAndNagarHaveliAndDamanAndDiu.toJson(),
//         "Goa": goa.toJson(),
//         "Gujarat": gujarat.toJson(),
//         "Himachal Pradesh": himachalPradesh.toJson(),
//         "Haryana": haryana.toJson(),
//         "Jharkhand": jharkhand.toJson(),
//         "Jammu and Kashmir": jammuAndKashmir.toJson(),
//         "Karnataka": karnataka.toJson(),
//         "Kerala": kerala.toJson(),
//         "Ladakh": ladakh.toJson(),
//         "Lakshadweep": lakshadweep.toJson(),
//         "Maharashtra": maharashtra.toJson(),
//         "Meghalaya": meghalaya.toJson(),
//         "Manipur": manipur.toJson(),
//         "Madhya Pradesh": madhyaPradesh.toJson(),
//         "Mizoram": mizoram.toJson(),
//         "Nagaland": nagaland.toJson(),
//         "Odisha": odisha.toJson(),
//         "Punjab": punjab.toJson(),
//         "Puducherry": puducherry.toJson(),
//         "Rajasthan": rajasthan.toJson(),
//         "Sikkim": sikkim.toJson(),
//         "Telangana": telangana.toJson(),
//         "Tamil Nadu": tamilNadu.toJson(),
//         "Tripura": tripura.toJson(),
//         "Uttar Pradesh": uttarPradesh.toJson(),
//         "Uttarakhand": uttarakhand.toJson(),
//         "West Bengal": westBengal.toJson(),
//     };
// }

// class AndamanAndNicobarIslands {
//     AndamanAndNicobarIslandsDistrictData districtData;
//     String statecode;

//     AndamanAndNicobarIslands({
//         this.districtData,
//         this.statecode,
//     });

//     factory AndamanAndNicobarIslands.fromJson(Map<String, dynamic> json) => AndamanAndNicobarIslands(
//         districtData: AndamanAndNicobarIslandsDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class AndamanAndNicobarIslandsDistrictData {
//     Nicobars nicobars;
//     Nicobars northAndMiddleAndaman;
//     Nicobars southAndaman;

//     AndamanAndNicobarIslandsDistrictData({
//         this.nicobars,
//         this.northAndMiddleAndaman,
//         this.southAndaman,
//     });

//     factory AndamanAndNicobarIslandsDistrictData.fromJson(Map<String, dynamic> json) => AndamanAndNicobarIslandsDistrictData(
//         nicobars: Nicobars.fromJson(json["Nicobars"]),
//         northAndMiddleAndaman: Nicobars.fromJson(json["North and Middle Andaman"]),
//         southAndaman: Nicobars.fromJson(json["South Andaman"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "Nicobars": nicobars.toJson(),
//         "North and Middle Andaman": northAndMiddleAndaman.toJson(),
//         "South Andaman": southAndaman.toJson(),
//     };
// }

// class Nicobars {
//     String notes;
//     int active;
//     int confirmed;
//     int deceased;
//     int recovered;
//     Delta delta;

//     Nicobars({
//         this.notes,
//         this.active,
//         this.confirmed,
//         this.deceased,
//         this.recovered,
//         this.delta,
//     });

//     factory Nicobars.fromJson(Map<String, dynamic> json) => Nicobars(
//         notes: json["notes"],
//         active: json["active"],
//         confirmed: json["confirmed"],
//         deceased: json["deceased"],
//         recovered: json["recovered"],
//         delta: Delta.fromJson(json["delta"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "notes": notes,
//         "active": active,
//         "confirmed": confirmed,
//         "deceased": deceased,
//         "recovered": recovered,
//         "delta": delta.toJson(),
//     };
// }

// class Delta {
//     int confirmed;
//     int deceased;
//     int recovered;

//     Delta({
//         this.confirmed,
//         this.deceased,
//         this.recovered,
//     });

//     factory Delta.fromJson(Map<String, dynamic> json) => Delta(
//         confirmed: json["confirmed"],
//         deceased: json["deceased"],
//         recovered: json["recovered"],
//     );

//     Map<String, dynamic> toJson() => {
//         "confirmed": confirmed,
//         "deceased": deceased,
//         "recovered": recovered,
//     };
// }

// class AndhraPradesh {
//     Map<String, Nicobars> districtData;
//     String statecode;

//     AndhraPradesh({
//         this.districtData,
//         this.statecode,
//     });

//     factory AndhraPradesh.fromJson(Map<String, dynamic> json) => AndhraPradesh(
//         districtData: Map.from(json["districtData"]).map((k, v) => MapEntry<String, Nicobars>(k, Nicobars.fromJson(v))),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": Map.from(districtData).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "statecode": statecode,
//     };
// }

// class Chandigarh {
//     ChandigarhDistrictData districtData;
//     String statecode;

//     Chandigarh({
//         this.districtData,
//         this.statecode,
//     });

//     factory Chandigarh.fromJson(Map<String, dynamic> json) => Chandigarh(
//         districtData: ChandigarhDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class ChandigarhDistrictData {
//     Nicobars chandigarh;

//     ChandigarhDistrictData({
//         this.chandigarh,
//     });

//     factory ChandigarhDistrictData.fromJson(Map<String, dynamic> json) => ChandigarhDistrictData(
//         chandigarh: Nicobars.fromJson(json["Chandigarh"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "Chandigarh": chandigarh.toJson(),
//     };
// }

// class DadraAndNagarHaveliAndDamanAndDiu {
//     DadraAndNagarHaveliAndDamanAndDiuDistrictData districtData;
//     String statecode;

//     DadraAndNagarHaveliAndDamanAndDiu({
//         this.districtData,
//         this.statecode,
//     });

//     factory DadraAndNagarHaveliAndDamanAndDiu.fromJson(Map<String, dynamic> json) => DadraAndNagarHaveliAndDamanAndDiu(
//         districtData: DadraAndNagarHaveliAndDamanAndDiuDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class DadraAndNagarHaveliAndDamanAndDiuDistrictData {
//     Nicobars dadraAndNagarHaveli;
//     Nicobars daman;
//     Nicobars diu;

//     DadraAndNagarHaveliAndDamanAndDiuDistrictData({
//         this.dadraAndNagarHaveli,
//         this.daman,
//         this.diu,
//     });

//     factory DadraAndNagarHaveliAndDamanAndDiuDistrictData.fromJson(Map<String, dynamic> json) => DadraAndNagarHaveliAndDamanAndDiuDistrictData(
//         dadraAndNagarHaveli: Nicobars.fromJson(json["Dadra and Nagar Haveli"]),
//         daman: Nicobars.fromJson(json["Daman"]),
//         diu: Nicobars.fromJson(json["Diu"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "Dadra and Nagar Haveli": dadraAndNagarHaveli.toJson(),
//         "Daman": daman.toJson(),
//         "Diu": diu.toJson(),
//     };
// }

// class Goa {
//     GoaDistrictData districtData;
//     String statecode;

//     Goa({
//         this.districtData,
//         this.statecode,
//     });

//     factory Goa.fromJson(Map<String, dynamic> json) => Goa(
//         districtData: GoaDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class GoaDistrictData {
//     Nicobars northGoa;
//     Nicobars southGoa;
//     Nicobars unknown;

//     GoaDistrictData({
//         this.northGoa,
//         this.southGoa,
//         this.unknown,
//     });

//     factory GoaDistrictData.fromJson(Map<String, dynamic> json) => GoaDistrictData(
//         northGoa: Nicobars.fromJson(json["North Goa"]),
//         southGoa: Nicobars.fromJson(json["South Goa"]),
//         unknown: Nicobars.fromJson(json["Unknown"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "North Goa": northGoa.toJson(),
//         "South Goa": southGoa.toJson(),
//         "Unknown": unknown.toJson(),
//     };
// }

// class Ladakh {
//     LadakhDistrictData districtData;
//     String statecode;

//     Ladakh({
//         this.districtData,
//         this.statecode,
//     });

//     factory Ladakh.fromJson(Map<String, dynamic> json) => Ladakh(
//         districtData: LadakhDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class LadakhDistrictData {
//     Nicobars kargil;
//     Nicobars leh;

//     LadakhDistrictData({
//         this.kargil,
//         this.leh,
//     });

//     factory LadakhDistrictData.fromJson(Map<String, dynamic> json) => LadakhDistrictData(
//         kargil: Nicobars.fromJson(json["Kargil"]),
//         leh: Nicobars.fromJson(json["Leh"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "Kargil": kargil.toJson(),
//         "Leh": leh.toJson(),
//     };
// }

// class Lakshadweep {
//     LakshadweepDistrictData districtData;
//     String statecode;

//     Lakshadweep({
//         this.districtData,
//         this.statecode,
//     });

//     factory Lakshadweep.fromJson(Map<String, dynamic> json) => Lakshadweep(
//         districtData: LakshadweepDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class LakshadweepDistrictData {
//     Nicobars lakshadweep;

//     LakshadweepDistrictData({
//         this.lakshadweep,
//     });

//     factory LakshadweepDistrictData.fromJson(Map<String, dynamic> json) => LakshadweepDistrictData(
//         lakshadweep: Nicobars.fromJson(json["Lakshadweep"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "Lakshadweep": lakshadweep.toJson(),
//     };
// }

// class Puducherry {
//     PuducherryDistrictData districtData;
//     String statecode;

//     Puducherry({
//         this.districtData,
//         this.statecode,
//     });

//     factory Puducherry.fromJson(Map<String, dynamic> json) => Puducherry(
//         districtData: PuducherryDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class PuducherryDistrictData {
//     Nicobars karaikal;
//     Nicobars mahe;
//     Nicobars puducherry;
//     Nicobars yanam;

//     PuducherryDistrictData({
//         this.karaikal,
//         this.mahe,
//         this.puducherry,
//         this.yanam,
//     });

//     factory PuducherryDistrictData.fromJson(Map<String, dynamic> json) => PuducherryDistrictData(
//         karaikal: Nicobars.fromJson(json["Karaikal"]),
//         mahe: Nicobars.fromJson(json["Mahe"]),
//         puducherry: Nicobars.fromJson(json["Puducherry"]),
//         yanam: Nicobars.fromJson(json["Yanam"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "Karaikal": karaikal.toJson(),
//         "Mahe": mahe.toJson(),
//         "Puducherry": puducherry.toJson(),
//         "Yanam": yanam.toJson(),
//     };
// }

// class Sikkim {
//     SikkimDistrictData districtData;
//     String statecode;

//     Sikkim({
//         this.districtData,
//         this.statecode,
//     });

//     factory Sikkim.fromJson(Map<String, dynamic> json) => Sikkim(
//         districtData: SikkimDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class SikkimDistrictData {
//     Nicobars eastDistrict;
//     Nicobars northDistrict;
//     Nicobars southDistrict;
//     Nicobars westDistrict;

//     SikkimDistrictData({
//         this.eastDistrict,
//         this.northDistrict,
//         this.southDistrict,
//         this.westDistrict,
//     });

//     factory SikkimDistrictData.fromJson(Map<String, dynamic> json) => SikkimDistrictData(
//         eastDistrict: Nicobars.fromJson(json["East District"]),
//         northDistrict: Nicobars.fromJson(json["North District"]),
//         southDistrict: Nicobars.fromJson(json["South District"]),
//         westDistrict: Nicobars.fromJson(json["West District"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "East District": eastDistrict.toJson(),
//         "North District": northDistrict.toJson(),
//         "South District": southDistrict.toJson(),
//         "West District": westDistrict.toJson(),
//     };
// }

// class StateUnassigned {
//     StateUnassignedDistrictData districtData;
//     String statecode;

//     StateUnassigned({
//         this.districtData,
//         this.statecode,
//     });

//     factory StateUnassigned.fromJson(Map<String, dynamic> json) => StateUnassigned(
//         districtData: StateUnassignedDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class StateUnassignedDistrictData {
//     Nicobars unassigned;

//     StateUnassignedDistrictData({
//         this.unassigned,
//     });

//     factory StateUnassignedDistrictData.fromJson(Map<String, dynamic> json) => StateUnassignedDistrictData(
//         unassigned: Nicobars.fromJson(json["Unassigned"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "Unassigned": unassigned.toJson(),
//     };
// }

// class Tripura {
//     TripuraDistrictData districtData;
//     String statecode;

//     Tripura({
//         this.districtData,
//         this.statecode,
//     });

//     factory Tripura.fromJson(Map<String, dynamic> json) => Tripura(
//         districtData: TripuraDistrictData.fromJson(json["districtData"]),
//         statecode: json["statecode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "districtData": districtData.toJson(),
//         "statecode": statecode,
//     };
// }

// class TripuraDistrictData {
//     Nicobars dhalai;
//     Nicobars gomati;
//     Nicobars khowai;
//     Nicobars northTripura;
//     Nicobars sipahijala;
//     Nicobars southTripura;
//     Nicobars unokoti;
//     Nicobars westTripura;
//     Nicobars unknown;

//     TripuraDistrictData({
//         this.dhalai,
//         this.gomati,
//         this.khowai,
//         this.northTripura,
//         this.sipahijala,
//         this.southTripura,
//         this.unokoti,
//         this.westTripura,
//         this.unknown,
//     });

//     factory TripuraDistrictData.fromJson(Map<String, dynamic> json) => TripuraDistrictData(
//         dhalai: Nicobars.fromJson(json["Dhalai"]),
//         gomati: Nicobars.fromJson(json["Gomati"]),
//         khowai: Nicobars.fromJson(json["Khowai"]),
//         northTripura: Nicobars.fromJson(json["North Tripura"]),
//         sipahijala: Nicobars.fromJson(json["Sipahijala"]),
//         southTripura: Nicobars.fromJson(json["South Tripura"]),
//         unokoti: Nicobars.fromJson(json["Unokoti"]),
//         westTripura: Nicobars.fromJson(json["West Tripura"]),
//         unknown: Nicobars.fromJson(json["Unknown"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "Dhalai": dhalai.toJson(),
//         "Gomati": gomati.toJson(),
//         "Khowai": khowai.toJson(),
//         "North Tripura": northTripura.toJson(),
//         "Sipahijala": sipahijala.toJson(),
//         "South Tripura": southTripura.toJson(),
//         "Unokoti": unokoti.toJson(),
//         "West Tripura": westTripura.toJson(),
//         "Unknown": unknown.toJson(),
//     };
// }

// Future<Districtwise> getDist() async {
//     const cityURL = 'https://api.covid19india.org/state_district_wise.json';

//     // Retrieve the locations of Google offices
//     final response = await http.get(cityURL);
//     if (response.statusCode == 200) {
//       return Districtwise.fromJson(json.decode(response.body));
         
//     } else {
//       throw HttpException(
//           'Unexpected status code ${response.statusCode}:'
//           ' ${response.reasonPhrase}',
//           uri: Uri.parse(cityURL));
//     }
//   }

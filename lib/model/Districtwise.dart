import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
class Districtwise {
    final String state;
    final String statecode;
    final List<DistrictDatum> districtData;

    Districtwise({
        this.state,
        this.statecode,
        this.districtData,
    });

    factory Districtwise.fromJson(Map<String, dynamic> json) => Districtwise(
        state: json["state"],
        statecode: json["statecode"],
        districtData: List<DistrictDatum>.from(json["districtData"].map((x) => DistrictDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "statecode": statecode,
        "districtData": List<dynamic>.from(districtData.map((x) => x.toJson())),
    };
}

class DistrictDatum {
   final  String district;
    final String notes;
    final int active;
    final int confirmed;
    final int deceased;
    final int recovered;
    final Delta delta;

    DistrictDatum({
        this.district,
        this.notes,
        this.active,
        this.confirmed,
        this.deceased,
        this.recovered,
        this.delta,
    });

    factory DistrictDatum.fromJson(Map<String, dynamic> json) => DistrictDatum(
        district: json["district"],
        notes: json["notes"],
        active: json["active"],
        confirmed: json["confirmed"],
        deceased: json["deceased"],
        recovered: json["recovered"],
        delta: Delta.fromJson(json["delta"]),
    );

    Map<String, dynamic> toJson() => {
        "district": district,
        "notes": notes,
        "active": active,
        "confirmed": confirmed,
        "deceased": deceased,
        "recovered": recovered,
        "delta": delta.toJson(),
    };
}

class Delta {
    final int confirmed;
   final int deceased;
    final int recovered;

    Delta({
        this.confirmed,
        this.deceased,
        this.recovered,
    });

    factory Delta.fromJson(Map<String, dynamic> json) => Delta(
        confirmed: json["confirmed"],
        deceased: json["deceased"],
        recovered: json["recovered"],
    );

    Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "deceased": deceased,
        "recovered": recovered,
    };
}
 Future<List<Districtwise>> getDist() async {
    const cityURL = 'https://api.covid19india.org/v2/state_district_wise.json';

    // Retrieve the locations of Google offices
    final response = await http.get(cityURL);
    if (response.statusCode == 200) {
      final jsonResponse = json
            .decode(response.body) .cast<Map<String, dynamic>>();

        List<Districtwise> listOfDist = jsonResponse.map<Districtwise>((json) {
          return Districtwise.fromJson(json);
        }).toList();
        return listOfDist;
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(cityURL));
    }
  }


  

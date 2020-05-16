import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Hotspots {
  List<Cities> cities;

  Hotspots({this.cities});

  Hotspots.fromJson(Map<String, dynamic> json) {
    if (json['Cities'] != null) {
      cities = new List<Cities>();
      json['Cities'].forEach((v) {
        cities.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cities != null) {
      data['Cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    return data;
  }
Future<Hotspots> getCities() async {
  const cityURL = 'https://my-json-server.typicode.com/Afthad/hotspotjson/db';

  // Retrieve the locations of Google offices
  final response = await http.get(cityURL);
  if (response.statusCode == 200) {
    return Hotspots.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(cityURL));
  }


}


}

class Cities {
  String name;
  double longitude;
  double latitude;

  Cities({this.name, this.longitude, this.latitude});

  Cities.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    return data;
  }



}
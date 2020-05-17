import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Hotspots {
  final List<Cities> cities;

  Hotspots({this.cities});
 factory Hotspots.fromJson(Map<String, dynamic> json) =>
      _$HotspotsFromJson(json);
  Map<String, dynamic> toJson() => _$HotspotsToJson(this);

 
}

@JsonSerializable()
class Cities {
  final String name;
  final double longitude;
  final double latitude;

  Cities({this.name, this.longitude, this.latitude});
  factory Cities.fromJson(Map<String, dynamic> json) => _$CitiesFromJson(json);
  Map<String, dynamic> toJson() => _$CitiesToJson(this);

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
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:NearMe/model/covidmodel.dart';

class Repo{

File jsonFile;
Directory dir;
String fileName = "repoData.json";
bool fileExist  = false;
Map<String,dynamic>  fileContent;

File create(Map<String,dynamic> map){

}
File writeToFile( Map<String,dynamic> map){
print('writing tofile');
Map<String,dynamic> content = {'key':'value'};
Map<String,dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
}



  Future<List<Statewise>> _fetchData() async {
    final listAPIUrl = 'https://api.covid19india.org/data.json';
    final response = await http.get(listAPIUrl);
    try {
      if (response.statusCode == 200) {
        final jsonResponse = json
            .decode(response.body)['statewise']
            .cast<Map<String, dynamic>>();

        List<Statewise> listOfStates = jsonResponse.map<Statewise>((json) {
          return Statewise.fromJson(json);
        }).toList();
        return listOfStates;
      } else {
        throw Exception('Failed to load jobs from API');
      }
    } catch (e) {
      throw Exception('Failed to load jobs from API');
    }
  }
}

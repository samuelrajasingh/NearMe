// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotspots _$HotspotsFromJson(Map<String, dynamic> json) {
  return Hotspots(
    cities: (json['cities'] as List)
        ?.map((e) =>
            e == null ? null : Cities.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HotspotsToJson(Hotspots instance) => <String, dynamic>{
      'cities': instance.cities,
    };

Cities _$CitiesFromJson(Map<String, dynamic> json) {
  return Cities(
    name: json['name'] as String,
    longitude: (json['longitude'] as num)?.toDouble(),
    latitude: (json['latitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CitiesToJson(Cities instance) => <String, dynamic>{
      'name': instance.name,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };

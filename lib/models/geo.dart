import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable()
class Geo {
  @JsonKey(name: 'lat')
  String latitude;
  @JsonKey(name: 'lng')
  String longitude;

  Geo({
    required this.latitude,
    required this.longitude,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}

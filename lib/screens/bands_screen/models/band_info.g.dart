// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BandInfo _$BandInfoFromJson(Map<String, dynamic> json) {
  return BandInfo(
    name: json['name'] as String,
    votes: json['votes'] as int,
  );
}

Map<String, dynamic> _$BandInfoToJson(BandInfo instance) => <String, dynamic>{
      'name': instance.name,
      'votes': instance.votes,
    };

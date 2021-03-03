import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'band_info.g.dart';

@JsonSerializable()
class BandInfo {
  @required
  final String name;
  @required
  final int votes;

  BandInfo({this.name, this.votes});

  factory BandInfo.fromJson(Map<String, dynamic> json) =>
      _$BandInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BandInfoToJson(this);

  static List<BandInfo> getBandInfos(List<dynamic> bandInfos) {
    List<BandInfo> bandInfoList = bandInfos.map((value) {
      return BandInfo.fromJson(value);
    }).toList();
    return bandInfoList;
  }
}

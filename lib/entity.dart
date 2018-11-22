import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

@JsonSerializable()
class Entity extends Object {
  @JsonKey(name: 'reason')
  String reason;

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'error_code')
  int errorCode;

  Entity(
    this.reason,
    this.result,
    this.errorCode,
  );

  factory Entity.fromJson(Map<String, dynamic> srcJson) =>
      _$EntityFromJson(srcJson);
}

@JsonSerializable()
class Result extends Object {
  @JsonKey(name: 'stat')
  String stat;

  @JsonKey(name: 'data')
  List<Data> data;

  Result(
    this.stat,
    this.data,
  );

  factory Result.fromJson(Map<String, dynamic> srcJson) =>
      _$ResultFromJson(srcJson);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'uniquekey')
  String uniquekey;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'author_name')
  String authorName;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'thumbnail_pic_s')
  String thumbnailPicS;

  @JsonKey(name: 'thumbnail_pic_s02')
  String thumbnailPicS02;

  @JsonKey(name: 'thumbnail_pic_s03')
  String thumbnailPicS03;

  Data(
    this.uniquekey,
    this.title,
    this.date,
    this.category,
    this.authorName,
    this.url,
    this.thumbnailPicS,
    this.thumbnailPicS02,
    this.thumbnailPicS03,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);
}

import 'package:json_annotation/json_annotation.dart';

part 'home_entity.g.dart';

@JsonSerializable()
class HomeEntity extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'readCount')
  String readCount;

  @JsonKey(name: 'homeInfoList')
  List<HomeInfoList> homeInfoList;

  HomeEntity(this.id,this.picUrl,this.readCount,this.homeInfoList);


  factory HomeEntity.fromJson(Map<String, dynamic> srcJson) => _$HomeEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeEntityToJson(this);
}

@JsonSerializable()
class HomeInfoList extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'readCount')
  String readCount;

  @JsonKey(name: 'picUrl')
  String picUrl;

  HomeInfoList(this.id,this.picUrl,this.readCount);

  factory HomeInfoList.fromJson(Map<String, dynamic> srcJson) => _$HomeInfoListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeInfoListToJson(this);

}
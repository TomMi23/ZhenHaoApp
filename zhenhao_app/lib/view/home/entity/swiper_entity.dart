import 'package:json_annotation/json_annotation.dart';

part 'swiper_entity.g.dart';

@JsonSerializable()
class HomeSwiperEntity extends Object {
  @JsonKey(name: 'swipeAdvInfoList')
  List<SwipeAdvInfoList> swipeAdvInfoList;

  HomeSwiperEntity(this.swipeAdvInfoList);

  factory HomeSwiperEntity.fromJson(Map<String, dynamic> srcJson) => _$HomeSwiperEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeSwiperEntityToJson(this);
}



@JsonSerializable()
class SwipeAdvInfoList extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'position')
  String position;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'enabled')
  int enabled;

  @JsonKey(name: 'addTime')
  String addTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'deleted')
  int deleted;

  SwipeAdvInfoList(this.id,this.name,this.link,this.url,this.position
      ,this.content,this.enabled,this.addTime,this.updateTime,this.deleted);

  factory SwipeAdvInfoList.fromJson(Map<String, dynamic> srcJson) => _$SwipeAdvInfoListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SwipeAdvInfoListToJson(this);

}
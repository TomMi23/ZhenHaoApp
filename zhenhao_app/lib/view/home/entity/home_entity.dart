import 'package:json_annotation/json_annotation.dart';

part 'home_entity.g.dart';

@JsonSerializable()
class HomeEntity extends Object {


  @JsonKey(name: 'swipeAdvInfoList')
  List<SwipeAdvInfoList> swipeAdvInfoList;

  @JsonKey(name: 'channelInfoList')
  List<ChannelInfoList> channelInfoList;

  @JsonKey(name: 'groupBuyInfoList')
  List<GroupBuyInfoList> grouponBuyList;

  HomeEntity(this.swipeAdvInfoList,this.channelInfoList,this.grouponBuyList);

  factory HomeEntity.fromJson(Map<String, dynamic> srcJson) => _$HomeEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeEntityToJson(this);
}

@JsonSerializable()
class ChannelInfoList extends Object {

  @JsonKey(name: 'channelID')
  String channelID;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'iconUrl')
  String iconUrl;

  ChannelInfoList(this.channelID,this.name,this.iconUrl);

  factory ChannelInfoList.fromJson(Map<String, dynamic> srcJson) => _$ChannelInfoListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChannelInfoListToJson(this);

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

@JsonSerializable()
class GroupBuyInfoList extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'brief')
  String brief;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'counterPrice')
  double counterPrice;

  @JsonKey(name: 'retailPrice')
  double retailPrice;

  @JsonKey(name: 'grouponPrice')
  double grouponPrice;

  @JsonKey(name: 'grouponDiscount')
  int grouponDiscount;

  @JsonKey(name: 'grouponMember')
  int grouponMember;

  GroupBuyInfoList(this.id,this.name,this.brief,this.picUrl,this.counterPrice,this.retailPrice,this.grouponPrice,this.grouponDiscount,this.grouponMember);

  factory GroupBuyInfoList.fromJson(Map<String, dynamic> srcJson) => _$GrouponListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GrouponListToJson(this);

}
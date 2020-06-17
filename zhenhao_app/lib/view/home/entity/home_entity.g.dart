part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) {
  return HomeEntity(
      (json['swipeAdvInfoList'] as List)
      ?.map((e) =>
  e == null ? null : SwipeAdvInfoList.fromJson(e as Map<String, dynamic>))
      ?.toList(),
    (json['channelInfoList'] as List)
        ?.map((e) =>
    e == null ? null : ChannelInfoList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
      (json['groupBuyInfoList'] as List)
          ?.map((e) =>
      e == null ? null : GroupBuyInfoList.fromJson(e as Map<String, dynamic>))
          ?.toList());

}

Map<String, dynamic> _$HomeEntityToJson(HomeEntity instance) =>
    <String, dynamic>{
      'swipeAdvInfoList': instance.swipeAdvInfoList,
      'channelInfoList': instance.channelInfoList,
      'grouponList': instance.grouponBuyList,
    };


SwipeAdvInfoList _$SwipeAdvInfoListFromJson(Map<String, dynamic> json) {
  return SwipeAdvInfoList(
      json['id'] as int,
      json['name'] as String,
      json['link'] as String,
      json['url'] as String,
      json['position'] as String,
      json['content'] as String,
      json['enabled'] as int,
      json['addTime'] as String,
      json['updateTime'] as String,
      json['deleted'] as int);
}

ChannelInfoList _$ChannelInfoListFromJson(Map<String, dynamic> json) {
  return ChannelInfoList(
    json['channelID'] as String,
    json['name'] as String,
    json['iconUrl'] as String,);
}

Map<String, dynamic> _$SwipeAdvInfoListToJson(SwipeAdvInfoList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'url': instance.url,
      'position': instance.position,
      'content': instance.content,
      'enabled': instance.enabled,
      'addTime': instance.addTime,
      'updateTime': instance.updateTime,
      'deleted': instance.deleted
    };

Map<String, dynamic> _$ChannelInfoListToJson(ChannelInfoList instance) =>
    <String, dynamic>{
      'channelID': instance.channelID,
      'name': instance.name,
      'iconUrl': instance.iconUrl
    };

GroupBuyInfoList _$GrouponListFromJson(Map<String, dynamic> json) {
  return GroupBuyInfoList(
      json['id'] as String,
      json['name'] as String,
      json['brief'] as String,
      json['picUrl'] as String,
      (json['counterPrice'] as num)?.toDouble(),
      (json['retailPrice'] as num)?.toDouble(),
      (json['grouponPrice'] as num)?.toDouble(),
      json['grouponDiscount'] as int,
      json['grouponMember'] as int);
}

Map<String, dynamic> _$GrouponListToJson(GroupBuyInfoList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brief': instance.brief,
      'picUrl': instance.picUrl,
      'counterPrice': instance.counterPrice,
      'retailPrice': instance.retailPrice,
      'grouponPrice': instance.grouponPrice,
      'grouponDiscount': instance.grouponDiscount,
      'grouponMember': instance.grouponMember
    };

part of 'swiper_entity.dart';

HomeSwiperEntity _$HomeSwiperEntityFromJson(Map<String, dynamic> json) {
  return HomeSwiperEntity(
      (json['swipeAdvInfoList'] as List)
          ?.map((e) =>
      e == null ? null : SwipeAdvInfoList.fromJson(e as Map<String, dynamic>))
          ?.toList());

}

Map<String, dynamic> _$HomeSwiperEntityToJson(HomeSwiperEntity instance) =>
    <String, dynamic>{
      'homeInfoList': instance.swipeAdvInfoList,
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
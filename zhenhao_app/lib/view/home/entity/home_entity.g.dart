part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEntity _$HomeEntityFromJson(Map<String, dynamic> json) {
  return HomeEntity(
      json['id'] as int,
      json['picUrl'] as String,
      json['readCount'] as String,
      (json['homeInfoList'] as List)
      ?.map((e) =>
  e == null ? null : HomeInfoList.fromJson(e as Map<String, dynamic>))
      ?.toList());

}

Map<String, dynamic> _$HomeEntityToJson(HomeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'picUrl': instance.picUrl,
      'readCount': instance.readCount,
      'homeInfoList': instance.homeInfoList,
    };


HomeInfoList _$HomeInfoListFromJson(Map<String, dynamic> json) {
  return HomeInfoList(
      json['id'] as int,
      json['picUrl'] as String,
      json['readCount'] as String);
}

Map<String, dynamic> _$HomeInfoListToJson(HomeInfoList instance) => <String, dynamic>{
  'id': instance.id,
  'picUrl': instance.picUrl,
  'readCount': instance.readCount,
};
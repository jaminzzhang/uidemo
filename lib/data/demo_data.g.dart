// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemData _$ItemDataFromJson(Map<String, dynamic> json) {
  return ItemData(
    json['title'] as String,
    json['detail'] as String,
    json['imageUrl'] as String,
    json['routeUrl'] as String,
  );
}

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'imageUrl': instance.imageUrl,
      'routeUrl': instance.routeUrl,
    };

DemoData _$DemoDataFromJson(Map<String, dynamic> json) {
  return DemoData(
    (json['bannerList'] as List)
        ?.map((e) =>
            e == null ? null : ItemData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['newsList'] as List)
        ?.map((e) =>
            e == null ? null : ItemData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DemoDataToJson(DemoData instance) => <String, dynamic>{
      'bannerList': instance.bannerList?.map((e) => e?.toJson())?.toList(),
      'newsList': instance.newsList?.map((e) => e?.toJson())?.toList(),
    };

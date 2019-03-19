// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListBean _$NewsListBeanFromJson(Map<String, dynamic> json) {
  return NewsListBean(
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : Items.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['last_page'] as int,
      json['total'] as int,
      json['page'] as int,
      json['per_page'] as int);
}

Map<String, dynamic> _$NewsListBeanToJson(NewsListBean instance) =>
    <String, dynamic>{
      'items': instance.items,
      'last_page': instance.lastPage,
      'total': instance.total,
      'page': instance.page,
      'per_page': instance.perPage
    };

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
      json['item_type'] as int,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ItemsToJson(Items instance) =>
    <String, dynamic>{'item_type': instance.itemType, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['view_count'] as int,
      json['source_name'] as String,
      json['title'] as String,
      json['comment_count'] as int,
      json['is_top'] as bool,
      (json['pics'] as List)?.map((e) => e as String)?.toList(),
      json['cover_img_url'] as String,
      json['create_time'] as int,
      json['news_type'] as int,
      json['id'] as int);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'view_count': instance.viewCount,
      'source_name': instance.sourceName,
      'title': instance.title,
      'comment_count': instance.commentCount,
      'is_top': instance.isTop,
      'pics': instance.pics,
      'cover_img_url': instance.coverImgUrl,
      'create_time': instance.createTime,
      'news_type': instance.newsType,
      'id': instance.id
    };

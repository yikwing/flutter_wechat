import 'package:json_annotation/json_annotation.dart';

part 'news_list_bean.g.dart';

@JsonSerializable()
class NewsListBean extends Object {
  @JsonKey(name: 'items')
  List<Items> items;

  @JsonKey(name: 'last_page')
  int lastPage;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'per_page')
  int perPage;

  NewsListBean(
    this.items,
    this.lastPage,
    this.total,
    this.page,
    this.perPage,
  );

  factory NewsListBean.fromJson(Map<String, dynamic> srcJson) =>
      _$NewsListBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsListBeanToJson(this);
}

@JsonSerializable()
class Items extends Object {
  @JsonKey(name: 'item_type')
  int itemType;

  @JsonKey(name: 'data')
  Data data;

  Items(
    this.itemType,
    this.data,
  );

  factory Items.fromJson(Map<String, dynamic> srcJson) =>
      _$ItemsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'view_count')
  int viewCount;

  @JsonKey(name: 'source_name')
  String sourceName;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'comment_count')
  int commentCount;

  @JsonKey(name: 'is_top')
  bool isTop;

  @JsonKey(name: 'pics')
  List<String> pics;

  @JsonKey(name: 'cover_img_url')
  String coverImgUrl;

  @JsonKey(name: 'create_time')
  int createTime;

  @JsonKey(name: 'news_type')
  int newsType;

  @JsonKey(name: 'id')
  int id;

  Data(
    this.viewCount,
    this.sourceName,
    this.title,
    this.commentCount,
    this.isTop,
    this.pics,
    this.coverImgUrl,
    this.createTime,
    this.newsType,
    this.id,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

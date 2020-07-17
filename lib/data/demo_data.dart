
import 'package:json_annotation/json_annotation.dart';

/// This allows the `DemoData` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'demo_data.g.dart';

@JsonSerializable()
class ItemData {
  String title;
  String detail;
  String imageUrl;
  String routeUrl;


  ItemData(this.title, this.detail, this.imageUrl, this.routeUrl);

  factory ItemData.fromJson(Map<String, dynamic> json) => _$ItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDataToJson(this);
}


@JsonSerializable(explicitToJson: true)
class DemoData {
  List<ItemData> bannerList;
  List<ItemData> newsList;

  bool get isEmpty {
    return (this.bannerList == null || this.bannerList.length == 0)
        || (this.newsList == null || this.newsList.length == 0) ;

  }

  DemoData(this.bannerList, this.newsList);



  factory DemoData.fromJson(Map<String, dynamic> json) => _$DemoDataFromJson(json);
  Map<String, dynamic> toJson() => _$DemoDataToJson(this);
}

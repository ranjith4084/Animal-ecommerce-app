// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.odataContext,
    this.value,
  });

  String odataContext;
  List<Value> value;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        odataContext: json["@odata.context"],
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@odata.context": odataContext,
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    this.name,
    this.description,
    this.bottomDescription,
    this.categoryTemplateId,
    this.metaKeywords,
    this.metaDescription,
    this.metaTitle,
    this.seName,
    this.parentCategoryId,
    this.pictureId,
    this.pageSize,
    this.allowCustomersToSelectPageSize,
    this.pageSizeOptions,
    this.priceRanges,
    this.showOnHomePage,
    this.featuredProductsOnHomaPage,
    this.includeInTopMenu,
    this.published,
    this.displayOrder,
    this.flag,
    this.flagStyle,
    this.icon,
    this.hideOnCatalog,
    this.showOnSearchBox,
    this.searchBoxDisplayOrder,
    this.id,
  });

  String name;
  dynamic description;
  dynamic bottomDescription;
  String categoryTemplateId;
  dynamic metaKeywords;
  dynamic metaDescription;
  dynamic metaTitle;
  String seName;
  String parentCategoryId;
  String pictureId;
  int pageSize;
  bool allowCustomersToSelectPageSize;
  String pageSizeOptions;
  dynamic priceRanges;
  bool showOnHomePage;
  bool featuredProductsOnHomaPage;
  bool includeInTopMenu;
  bool published;
  int displayOrder;
  dynamic flag;
  dynamic flagStyle;
  dynamic icon;
  bool hideOnCatalog;
  bool showOnSearchBox;
  int searchBoxDisplayOrder;
  String id;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        name: json["Name"],
        description: json["Description"],
        bottomDescription: json["BottomDescription"],
        categoryTemplateId: json["CategoryTemplateId"],
        metaKeywords: json["MetaKeywords"],
        metaDescription: json["MetaDescription"],
        metaTitle: json["MetaTitle"],
        seName: json["SeName"],
        parentCategoryId: json["ParentCategoryId"],
        pictureId: json["PictureId"],
        pageSize: json["PageSize"],
        allowCustomersToSelectPageSize: json["AllowCustomersToSelectPageSize"],
        pageSizeOptions: json["PageSizeOptions"],
        priceRanges: json["PriceRanges"],
        showOnHomePage: json["ShowOnHomePage"],
        featuredProductsOnHomaPage: json["FeaturedProductsOnHomaPage"],
        includeInTopMenu: json["IncludeInTopMenu"],
        published: json["Published"],
        displayOrder: json["DisplayOrder"],
        flag: json["Flag"],
        flagStyle: json["FlagStyle"],
        icon: json["Icon"],
        hideOnCatalog: json["HideOnCatalog"],
        showOnSearchBox: json["ShowOnSearchBox"],
        searchBoxDisplayOrder: json["SearchBoxDisplayOrder"],
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Description": description,
        "BottomDescription": bottomDescription,
        "CategoryTemplateId": categoryTemplateId,
        "MetaKeywords": metaKeywords,
        "MetaDescription": metaDescription,
        "MetaTitle": metaTitle,
        "SeName": seName,
        "ParentCategoryId": parentCategoryId,
        "PictureId": pictureId,
        "PageSize": pageSize,
        "AllowCustomersToSelectPageSize": allowCustomersToSelectPageSize,
        "PageSizeOptions": pageSizeOptions,
        "PriceRanges": priceRanges,
        "ShowOnHomePage": showOnHomePage,
        "FeaturedProductsOnHomaPage": featuredProductsOnHomaPage,
        "IncludeInTopMenu": includeInTopMenu,
        "Published": published,
        "DisplayOrder": displayOrder,
        "Flag": flag,
        "FlagStyle": flagStyle,
        "Icon": icon,
        "HideOnCatalog": hideOnCatalog,
        "ShowOnSearchBox": showOnSearchBox,
        "SearchBoxDisplayOrder": searchBoxDisplayOrder,
        "Id": id,
      };
}

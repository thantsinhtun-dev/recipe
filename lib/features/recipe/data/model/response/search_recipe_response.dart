import 'package:recipe/features/recipe/domain/entities/search_ingredient_entity.dart';
import 'package:recipe/shared/domain/models/base_response_model.dart';

class SearchRecipeResponse extends BaseResponseModel<SearchRecipeResponse> {
  List<SearchRecipeModel>? results;

  SearchRecipeResponse({this.results});

  @override
  SearchRecipeResponse fromJson(Map<String, dynamic> json) {
    return SearchRecipeResponse(
        results: json["recipes"] == null
            ? []
            : List<SearchRecipeModel>.from(
                json["recipes"]!.map((x) => SearchRecipeModel.fromJson(x))));
  }

  @override
  SearchRecipeResponse fromJsonList(List<dynamic> list) {
    return SearchRecipeResponse(
        results: list
            .map((x) => SearchRecipeModel.fromJson(x as Map<String, dynamic>))
            .toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "recipes":
          results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
  }
}

class SearchRecipeModel {
  int? id;
  String? title;
  String? image;
  int? usedIngredientCount;
  int? missedIngredientCount;
  List<SedIngredientModel>? missedIngredients;
  List<SedIngredientModel>? usedIngredients;
  int? likes;

  SearchRecipeModel({
    this.id,
    this.title,
    this.image,
    this.usedIngredientCount,
    this.missedIngredientCount,
    this.missedIngredients,
    this.usedIngredients,
    this.likes,
  });

  factory SearchRecipeModel.fromJson(Map<String, dynamic> json) => SearchRecipeModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        usedIngredientCount: json["usedIngredientCount"],
        missedIngredientCount: json["missedIngredientCount"],
        missedIngredients: json["missedIngredients"] == null
            ? []
            : List<SedIngredientModel>.from(
                json["missedIngredients"]!.map((x) => SedIngredientModel.fromJson(x))),
        usedIngredients: json["usedIngredients"] == null
            ? []
            : List<SedIngredientModel>.from(
                json["usedIngredients"]!.map((x) => SedIngredientModel.fromJson(x))),
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "usedIngredientCount": usedIngredientCount,
        "missedIngredientCount": missedIngredientCount,
        "missedIngredients": missedIngredients == null
            ? []
            : List<dynamic>.from(missedIngredients!.map((x) => x.toJson())),
        "usedIngredients": usedIngredients == null
            ? []
            : List<dynamic>.from(usedIngredients!.map((x) => x.toJson())),
        "likes": likes,
      };

  SearchRecipeEntity toEntity() {
    return SearchRecipeEntity(
      id: id.toString(),
      title: title ?? "",
      image: image ?? "",
      usedIngredientCount: usedIngredientCount ?? 0,
      missedIngredientCount: missedIngredientCount ?? 0,
      missedIngredients: missedIngredients?.map((e) => e.name ?? "").toList() ?? [],
      usedIngredients: usedIngredients?.map((e) => e.name ?? "").toList() ?? [],
      likes: likes ?? 0,
    );
  }
}

class SedIngredientModel {
  int? id;
  double? amount;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? aisle;
  String? name;
  String? original;
  String? originalName;
  List<String>? meta;
  String? image;
  String? extendedName;

  SedIngredientModel({
    this.id,
    this.amount,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.aisle,
    this.name,
    this.original,
    this.originalName,
    this.meta,
    this.image,
    this.extendedName,
  });

  factory SedIngredientModel.fromJson(Map<String, dynamic> json) => SedIngredientModel(
        id: json["id"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        unitLong: json["unitLong"],
        unitShort: json["unitShort"],
        aisle: json["aisle"],
        name: json["name"],
        original: json["original"],
        originalName: json["originalName"],
        meta: json["meta"] == null ? [] : List<String>.from(json["meta"]!.map((x) => x)),
        image: json["image"],
        extendedName: json["extendedName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "unit": unit,
        "unitLong": unitLong,
        "unitShort": unitShort,
        "aisle": aisle,
        "name": name,
        "original": original,
        "originalName": originalName,
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "image": image,
        "extendedName": extendedName,
      };
}


import 'package:recipe/features/recipe/data/model/response/recipe_detail_response.dart';

import '../../../../../shared/domain/models/base_response_model.dart';

class RecipeResponse extends BaseResponseModel<RecipeResponse> {
  List<RecipeDetailResponse>? results;

  RecipeResponse({this.results});

  @override
  RecipeResponse fromJson(Map<String, dynamic> json) {
    return RecipeResponse(
        results: json["recipes"] == null
            ? []
            : List<RecipeDetailResponse>.from(
            json["recipes"]!.map((x) => RecipeDetailResponse().fromJson(x))));
  }

  @override
  RecipeResponse fromJsonList(List<dynamic> list) {
    return RecipeResponse(results: []);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "recipes":
      results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
  }
}
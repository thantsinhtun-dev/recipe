import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/data/model/response/recipe_detail_response.dart';
import '../../../../../shared/services/services.dart';
import '../../model/recipe_models.dart';
import '../../model/response/recipe_response.dart';

final recipeApiServiceProvider = Provider<RecipeApiService>(
  (ref) => RecipeApiService(dio: ref.read(dioProvider)),
);

class RecipeApiService extends BaseApiService {
  RecipeApiService({required super.dio});

  Future<SearchRecipeResponse> searchRecipeByIngredients(String ingredients) async {
    return await getServerCall(
      SearchRecipeResponse(),
      ApiConst.pathSearchRecipeByIngredients(ingredients),
    );
  }

  Future<RecipeDetailResponse> getRecipeDetail(String id) async {
    return await getServerCall(
      RecipeDetailResponse(),
      ApiConst.pathGetRecipeDetail(id),
    );
  }
  Future<RecipeResponse> getRecipeByMealType(String mealType) async {
    return await getServerCall(
      RecipeResponse(),
      ApiConst.pathGetRecipeByMealType(mealType),
    );
  }


}

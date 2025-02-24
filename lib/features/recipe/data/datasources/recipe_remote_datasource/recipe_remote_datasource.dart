import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/data/model/recipe_models.dart';
import 'package:recipe/features/recipe/data/model/response/recipe_detail_response.dart';

import '../recipe_datasource.dart';

final recipeRemoteDataSourceProvider = Provider(
  (ref) => RecipeRemoteDataSourceImpl(ref.read(recipeApiServiceProvider)),
);

abstract class RecipeRemoteDataSource {
  Future<List<SearchRecipeModel>> searchRecipeByIngredients(String ingredients);
  Future<RecipeDetailResponse> getRecipeDetail(String id);
}

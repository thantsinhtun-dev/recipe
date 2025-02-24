import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/entities/search_ingredient_entity.dart';

import '../../data/datasources/recipe_datasource.dart';
import '../../data/repositories/recipe_repository_impl.dart';
import '../entities/recipe_detail_entity.dart';

final recipeRepositoryProvider = Provider(
  (ref) => RecipeRepositoryImpl(ref.read(recipeRemoteDataSourceProvider)),
);

abstract class RecipeRepository {
  Future<List<SearchRecipeEntity>> searchRecipeByIngredients(String ingredients);
  Future<RecipeDetailEntity> getRecipeDetail(String id);
}

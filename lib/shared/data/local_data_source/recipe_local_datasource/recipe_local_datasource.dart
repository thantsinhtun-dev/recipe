import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/recipe/domain/entities/recipe_detail_entity.dart';
import '../../../services/local/app_database.dart';
import 'recipe_local_datasource_impl.dart';

final recipeLocalDataSourceProvider = Provider(
  (ref) => RecipeLocalDataSourceImpl(ref.read(databaseProvider).recipeDao),
);

abstract class RecipeLocalDataSource {
  Future<void> insertAll(List<RecipeDetailEntity> routes);

  Future<void> update(RecipeDetailEntity entity);

  Future<RecipeDetailEntity?> getRecipeDetail(String id);

  Future<List<RecipeDetailEntity>> getAllData();

  Future<int> deleteAll();

  Stream<List<RecipeDetailEntity>> getFavouriteRecipes();
}

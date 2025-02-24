import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/shared/data/local_data_source/recipe_local_datasource/recipe_local_datasource.dart';

import '../../../../../shared/services/local/dao/recipe_dao.dart';

class RecipeLocalDataSourceImpl extends RecipeLocalDataSource {
  final RecipeDao _dao;
  RecipeLocalDataSourceImpl(this._dao);

  @override
  Future<int> deleteAll() {
   return _dao.deleteAll();
  }

  @override
  Future<RecipeDetailEntity?> getRecipeDetail(String id) {
    return _dao.get(id);
  }

  @override
  Stream<List<RecipeDetailEntity>> getAllData() {
    return _dao.getAllData();
  }

  @override
  Future<void> insertAll(List<RecipeDetailEntity> routes) {
    return _dao.insertAll(routes);
  }

  @override
  Future<void> update(RecipeDetailEntity entity) {
    return _dao.insert(entity);
  }

  @override
  Stream<List<RecipeDetailEntity>> getFavouriteRecipes() {
    return _dao.getFavouriteRecipes();
  }

}
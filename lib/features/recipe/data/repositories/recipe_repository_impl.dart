import 'package:dio/dio.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/features/recipe/domain/repositories/recipe_repository.dart';
import '../../../../shared/data/local_data_source/recipe_local_datasource/recipe_local_datasource.dart';
import '../../../../shared/services/services.dart';
import '../../domain/entities/search_ingredient_entity.dart';
import '../datasources/recipe_datasource.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeRemoteDataSource _recipeRemoteDataSource;
  final RecipeLocalDataSource _recipeLocalDataSource;

  RecipeRepositoryImpl(
    this._recipeRemoteDataSource,
    this._recipeLocalDataSource,
  );

  @override
  Future<List<SearchRecipeEntity>> searchRecipeByIngredients(String ingredients) async {
    try {
      var result = await _recipeRemoteDataSource.searchRecipeByIngredients(ingredients);
      return result.map((e) => e.toEntity()).toList();
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<RecipeDetailEntity> getRecipeDetail(String id) async {
    try {
      var entity = await _recipeLocalDataSource.getRecipeDetail(id);
      if (entity != null) return entity;
      if(entity == null){
        var result = await _recipeRemoteDataSource.getRecipeDetail(id);
        await _recipeLocalDataSource.update(result.toEntity());
        return result.toEntity();
      }else{
        return entity;
      }
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> updateRecipe(RecipeDetailEntity entity) async {
    try {
      return await _recipeLocalDataSource.update(entity);
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Stream<List<RecipeDetailEntity>> getFavouriteRecipes()  {
    try {
      return _recipeLocalDataSource.getFavouriteRecipes();
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeDetailEntity>> getRecipeByMealType(String mealType) async {
    try {
      var res = await _recipeRemoteDataSource.getRecipeByMealType(mealType);
      return res.map((e) => e.toEntity()).toList();
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }
}

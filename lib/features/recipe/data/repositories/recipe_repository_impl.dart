import 'package:dio/dio.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/features/recipe/domain/repositories/recipe_repository.dart';
import '../../../../shared/services/services.dart';
import '../../domain/entities/search_ingredient_entity.dart';
import '../datasources/recipe_datasource.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeRemoteDataSource _recipeRemoteDataSource;
  RecipeRepositoryImpl(this._recipeRemoteDataSource);
  @override
  Future<List<SearchRecipeEntity>> searchRecipeByIngredients(String ingredients) async {
    try {
      var result = await  _recipeRemoteDataSource.searchRecipeByIngredients(ingredients);
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
      var result = await  _recipeRemoteDataSource.getRecipeDetail(id);
      return result.toEntity();
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }
}
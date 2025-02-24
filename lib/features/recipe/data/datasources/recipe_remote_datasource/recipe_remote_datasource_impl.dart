import 'package:dio/dio.dart';
import 'package:recipe/features/recipe/data/model/response/recipe_detail_response.dart';

import '../../../../../shared/services/remote/dio/error_handler.dart';
import '../../model/recipe_models.dart';
import '../recipe_datasource.dart';

class RecipeRemoteDataSourceImpl extends RecipeRemoteDataSource {
  final RecipeApiService _recipeApiService;

  RecipeRemoteDataSourceImpl(this._recipeApiService);

  @override
  Future<List<SearchRecipeModel>> searchRecipeByIngredients(String ingredients) async {
    try {
      var result = await  _recipeApiService.searchRecipeByIngredients(ingredients);
      return result.results ?? [];
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<RecipeDetailResponse> getRecipeDetail(String id) async {
    try {
      var result = await  _recipeApiService.getRecipeDetail(id);
      return result;
    } on DioException catch (dioError) {
      throw ErrorHandler.dioException(error: dioError);
    } catch (error) {
      rethrow;
    }
  }
}

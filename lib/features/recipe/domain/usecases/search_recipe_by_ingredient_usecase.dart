import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/entities/search_ingredient_entity.dart';

import '../repositories/recipe_repository.dart';

final searchRecipeByIngredientUseCaseProvider = Provider(
  (ref) => SearchRecipeByIngredientUseCase(ref.read(recipeRepositoryProvider)),
);

class SearchRecipeByIngredientUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipeByIngredientUseCase(this._recipeRepository);

  Future<List<SearchRecipeEntity>> execute(String ingredients) {
    return _recipeRepository.searchRecipeByIngredients(ingredients);
  }
}

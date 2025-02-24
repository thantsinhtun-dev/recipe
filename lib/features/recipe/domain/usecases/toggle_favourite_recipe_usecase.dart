import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import '../repositories/recipe_repository.dart';

final toggleFavouriteRecipeUseCase = Provider(
      (ref) => ToggleFavouriteRecipeUseCase(ref.read(recipeRepositoryProvider)),
);

class ToggleFavouriteRecipeUseCase {
  final RecipeRepository _recipeRepository;

  ToggleFavouriteRecipeUseCase(this._recipeRepository);

  Future<void> execute(RecipeDetailEntity entity) {
    return _recipeRepository.updateRecipe(entity);
  }
}

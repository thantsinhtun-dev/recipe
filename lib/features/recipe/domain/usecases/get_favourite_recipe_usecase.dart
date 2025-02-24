import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import '../repositories/recipe_repository.dart';

final getFavouriteRecipeUseCase = Provider(
      (ref) => GetFavouriteRecipeUseCase(ref.read(recipeRepositoryProvider)),
);

class GetFavouriteRecipeUseCase {
  final RecipeRepository _recipeRepository;

  GetFavouriteRecipeUseCase(this._recipeRepository);

  Stream<List<RecipeDetailEntity>> execute() {
    return _recipeRepository.getFavouriteRecipes();
  }
}

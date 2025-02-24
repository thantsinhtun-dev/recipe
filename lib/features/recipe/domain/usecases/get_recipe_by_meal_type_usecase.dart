import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/features/recipe/domain/entities/search_ingredient_entity.dart';

import '../repositories/recipe_repository.dart';

final getRecipeByMealTypeUseCase = Provider(
      (ref) => GetRecipeByMealTypeUseCase(ref.read(recipeRepositoryProvider)),
);

class GetRecipeByMealTypeUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipeByMealTypeUseCase(this._recipeRepository);

  Future<List<RecipeDetailEntity>> execute(String mealType) {
    return _recipeRepository.getRecipeByMealType(mealType);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/features/recipe/domain/entities/search_ingredient_entity.dart';

import '../repositories/recipe_repository.dart';

final getRecipeDetailUseCase = Provider(
      (ref) => GetRecipeDetailUseCase(ref.read(recipeRepositoryProvider)),
);

class GetRecipeDetailUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipeDetailUseCase(this._recipeRepository);

  Future<RecipeDetailEntity> execute(String id) {
    return _recipeRepository.getRecipeDetail(id);
  }
}

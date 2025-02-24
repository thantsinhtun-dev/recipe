import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/meal_plan/domain/repository/meal_plan_repository.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';

final getAllRecipeListUseCase = Provider(
      (ref) => GetAllRecipeListUseCase(ref.read(mealPlanRepositoryProvider)),
);

class GetAllRecipeListUseCase {
  final MealPlanRepository _recipeRepository;

  GetAllRecipeListUseCase(this._recipeRepository);

  Stream<List<RecipeDetailEntity>> execute() {
    return _recipeRepository.getRecipesList();
  }
}

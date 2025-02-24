import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/meal_plan/domain/entities/meal_plan_entity.dart';
import 'package:recipe/features/meal_plan/domain/repository/meal_plan_repository.dart';

final updateMealPlanUseCase = Provider(
      (ref) => UpdateMealPlanUseCase(ref.read(mealPlanRepositoryProvider)),
);

class UpdateMealPlanUseCase {
  final MealPlanRepository _recipeRepository;

  UpdateMealPlanUseCase(this._recipeRepository);

  Future<void> execute(MealPlanEntity entity) {
    return _recipeRepository.insertMealPlan(entity);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/meal_plan/domain/entities/meal_plan_entity.dart';
import 'package:recipe/features/meal_plan/domain/repository/meal_plan_repository.dart';

final getAllMealPlanUseCase = Provider(
      (ref) => GetAllMealPlanUseCase(ref.read(mealPlanRepositoryProvider)),
);

class GetAllMealPlanUseCase {
  final MealPlanRepository _recipeRepository;

  GetAllMealPlanUseCase(this._recipeRepository);

  Stream<List<MealPlanEntity>> execute() {
    return _recipeRepository.getAllMealPlan();
  }
}

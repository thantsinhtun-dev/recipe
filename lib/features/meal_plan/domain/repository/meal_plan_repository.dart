import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/data/local_data_source/recipe_local_datasource/recipe_local_datasource.dart';
import '../../../recipe/domain/entities/recipe_detail_entity.dart';
import '../../data/meal_plan_local_datasource/meal_plan_local_datasource.dart';
import '../../data/repository/meal_plan_repository_impl.dart';
import '../entities/meal_plan_entity.dart';

final mealPlanRepositoryProvider = Provider(
  (ref) => MealPlanRepositoryImpl(ref.read(recipeLocalDataSourceProvider), ref.read(mealPlanLocalDataSourceProvider)),
);

abstract class MealPlanRepository {
  Stream<List<RecipeDetailEntity>> getRecipesList();
  Future<void> insertMealPlan(MealPlanEntity entity);
  Stream<List<MealPlanEntity>> getAllMealPlan();

}

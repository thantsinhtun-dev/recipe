import 'package:recipe/features/meal_plan/data/meal_plan_local_datasource/meal_plan_local_datasource.dart';
import 'package:recipe/features/meal_plan/domain/entities/meal_plan_entity.dart';
import 'package:recipe/features/meal_plan/domain/repository/meal_plan_repository.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/shared/data/local_data_source/recipe_local_datasource/recipe_local_datasource.dart';

class MealPlanRepositoryImpl extends MealPlanRepository {
  final RecipeLocalDataSource _recipeLocalDataSource;
  final MealPlanLocalDataSource _mealPlanLocalDataSource;

  MealPlanRepositoryImpl(this._recipeLocalDataSource, this._mealPlanLocalDataSource);

  @override
  Stream<List<RecipeDetailEntity>> getRecipesList() {
    return _recipeLocalDataSource.getAllData();
  }

  @override
  Stream<List<MealPlanEntity>> getAllMealPlan() {
    return _mealPlanLocalDataSource.getMealPlan();
  }

  @override
  Future<void> insertMealPlan(MealPlanEntity entity) {
    return _mealPlanLocalDataSource.insertMealPlan(entity);
  }
}

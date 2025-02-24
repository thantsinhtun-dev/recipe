import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/meal_plan/domain/entities/meal_plan_entity.dart';

import '../../../../shared/services/local/app_database.dart';
import 'meal_plan_local_datasource_impl.dart';

final mealPlanLocalDataSourceProvider = Provider(
  (ref) => MealPlanLocalDataSourceImpl(ref.read(databaseProvider).mealPlanDao),
);
abstract class MealPlanLocalDataSource {
  Stream<List<MealPlanEntity>> getMealPlan();
  Future<void> insertMealPlan(MealPlanEntity entity);

}
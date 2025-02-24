import 'package:recipe/features/meal_plan/domain/entities/meal_plan_entity.dart';
import 'package:recipe/shared/services/local/dao/meal_plan_dao.dart';

import 'meal_plan_local_datasource.dart';

class MealPlanLocalDataSourceImpl extends MealPlanLocalDataSource {
  final MealPlanDao _dao;

  MealPlanLocalDataSourceImpl(this._dao);

  @override
  Stream<List<MealPlanEntity>> getMealPlan() {
    return _dao.getAllData();
  }

  @override
  Future<void> insertMealPlan(MealPlanEntity entity) {
    return _dao.insert(entity);
  }
}

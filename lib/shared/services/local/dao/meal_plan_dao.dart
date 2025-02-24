import 'package:drift/drift.dart';
import 'package:recipe/features/meal_plan/domain/entities/meal_plan_entity.dart';

import '../app_database.dart';
import '../tables/meal_plan_table.dart';

part 'meal_plan_dao.g.dart';

@DriftAccessor(tables: [MealPlanTable])
class MealPlanDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase _db;
  MealPlanDao(this._db) : super(_db);

  Future<void> insertAll(List<MealPlanEntity> routes) async {
    await batch((batch) => batch.insertAllOnConflictUpdate(_db.mealPlanTable, routes));
  }

  Stream<List<MealPlanEntity>> getAllData() {
    return select(_db.mealPlanTable).watch();
  }
  Future<void> insert(MealPlanEntity route) async {
    await into(_db.mealPlanTable).insertOnConflictUpdate(route);
  }
  Future<int> deleteAll() {
    return _db.mealPlanTable.deleteAll();
  }

}
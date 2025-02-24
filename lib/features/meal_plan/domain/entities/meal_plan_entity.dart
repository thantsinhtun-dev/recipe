import 'package:drift/drift.dart';
import 'package:recipe/shared/services/local/app_database.dart';

import '../../../recipe/domain/entities/recipe_detail_entity.dart';

class MealPlanEntity implements Insertable<MealPlanEntity> {
  final String planDate;
  final String day;
  List<RecipeDetailEntity> recipes;

  MealPlanEntity({
    required this.planDate,
    required this.day,
    required this.recipes,
  });

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return MealPlanTableCompanion.insert(
      planDate: planDate,
      day: day,
      recipes: recipes,
    ).toColumns(nullToAbsent);
  }
}

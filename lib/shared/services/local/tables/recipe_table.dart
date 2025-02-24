import 'package:drift/drift.dart';
import '../../../../features/recipe/domain/entities/recipe_detail_entity.dart';
import '../type_converters/ingredient_type_converter.dart';
import '../type_converters/instruction_type_converter.dart';
import '../type_converters/nutrition_type_converter.dart';
@UseRowClass(RecipeDetailEntity,generateInsertable: true)
class RecipeTable extends Table {

  TextColumn get id => text()();
  TextColumn get image => text()();
  TextColumn get title => text()();
  IntColumn get readyInMinutes => integer()();
  IntColumn get aggregateLikes => integer()();
  RealColumn get healthScore => real()();
  TextColumn get extendedIngredients => text().map(IngredientTypeConverter())();
  TextColumn get nutrition => text().map(NutritionTypeConverter())();
  TextColumn get summary => text()();
  TextColumn get instructions => text()();
  TextColumn get analyzedInstructions =>text().map(InstructionTypeConverter())();
  BoolColumn get isFavourite => boolean()();

  @override
  Set<Column<Object>>? get primaryKey => {id};

  @override
  String? get tableName => "recipe_table";
}

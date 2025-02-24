// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RecipeTableTable extends RecipeTable
    with TableInfo<$RecipeTableTable, RecipeDetailEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readyInMinutesMeta =
      const VerificationMeta('readyInMinutes');
  @override
  late final GeneratedColumn<int> readyInMinutes = GeneratedColumn<int>(
      'ready_in_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _aggregateLikesMeta =
      const VerificationMeta('aggregateLikes');
  @override
  late final GeneratedColumn<int> aggregateLikes = GeneratedColumn<int>(
      'aggregate_likes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _healthScoreMeta =
      const VerificationMeta('healthScore');
  @override
  late final GeneratedColumn<double> healthScore = GeneratedColumn<double>(
      'health_score', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _extendedIngredientsMeta =
      const VerificationMeta('extendedIngredients');
  @override
  late final GeneratedColumnWithTypeConverter<List<ExtendedIngredientEntity>,
      String> extendedIngredients = GeneratedColumn<String>(
          'extended_ingredients', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<ExtendedIngredientEntity>>(
          $RecipeTableTable.$converterextendedIngredients);
  static const VerificationMeta _nutritionMeta =
      const VerificationMeta('nutrition');
  @override
  late final GeneratedColumnWithTypeConverter<NutritionEntity, String>
      nutrition = GeneratedColumn<String>('nutrition', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<NutritionEntity>(
              $RecipeTableTable.$converternutrition);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instructionsMeta =
      const VerificationMeta('instructions');
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
      'instructions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _analyzedInstructionsMeta =
      const VerificationMeta('analyzedInstructions');
  @override
  late final GeneratedColumnWithTypeConverter<List<AnalyzedInstructionEntity>,
      String> analyzedInstructions = GeneratedColumn<String>(
          'analyzed_instructions', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true)
      .withConverter<List<AnalyzedInstructionEntity>>(
          $RecipeTableTable.$converteranalyzedInstructions);
  static const VerificationMeta _isFavouriteMeta =
      const VerificationMeta('isFavourite');
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'is_favourite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favourite" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        image,
        title,
        readyInMinutes,
        aggregateLikes,
        healthScore,
        extendedIngredients,
        nutrition,
        summary,
        instructions,
        analyzedInstructions,
        isFavourite
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_table';
  @override
  VerificationContext validateIntegrity(Insertable<RecipeDetailEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('ready_in_minutes')) {
      context.handle(
          _readyInMinutesMeta,
          readyInMinutes.isAcceptableOrUnknown(
              data['ready_in_minutes']!, _readyInMinutesMeta));
    } else if (isInserting) {
      context.missing(_readyInMinutesMeta);
    }
    if (data.containsKey('aggregate_likes')) {
      context.handle(
          _aggregateLikesMeta,
          aggregateLikes.isAcceptableOrUnknown(
              data['aggregate_likes']!, _aggregateLikesMeta));
    } else if (isInserting) {
      context.missing(_aggregateLikesMeta);
    }
    if (data.containsKey('health_score')) {
      context.handle(
          _healthScoreMeta,
          healthScore.isAcceptableOrUnknown(
              data['health_score']!, _healthScoreMeta));
    } else if (isInserting) {
      context.missing(_healthScoreMeta);
    }
    context.handle(
        _extendedIngredientsMeta, const VerificationResult.success());
    context.handle(_nutritionMeta, const VerificationResult.success());
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('instructions')) {
      context.handle(
          _instructionsMeta,
          instructions.isAcceptableOrUnknown(
              data['instructions']!, _instructionsMeta));
    } else if (isInserting) {
      context.missing(_instructionsMeta);
    }
    context.handle(
        _analyzedInstructionsMeta, const VerificationResult.success());
    if (data.containsKey('is_favourite')) {
      context.handle(
          _isFavouriteMeta,
          isFavourite.isAcceptableOrUnknown(
              data['is_favourite']!, _isFavouriteMeta));
    } else if (isInserting) {
      context.missing(_isFavouriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeDetailEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeDetailEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      readyInMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ready_in_minutes'])!,
      aggregateLikes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}aggregate_likes'])!,
      healthScore: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}health_score'])!,
      extendedIngredients: $RecipeTableTable.$converterextendedIngredients
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}extended_ingredients'])!),
      nutrition: $RecipeTableTable.$converternutrition.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nutrition'])!),
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary'])!,
      instructions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}instructions'])!,
      analyzedInstructions: $RecipeTableTable.$converteranalyzedInstructions
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}analyzed_instructions'])!),
      isFavourite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favourite'])!,
    );
  }

  @override
  $RecipeTableTable createAlias(String alias) {
    return $RecipeTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<ExtendedIngredientEntity>, String>
      $converterextendedIngredients = IngredientTypeConverter();
  static TypeConverter<NutritionEntity, String> $converternutrition =
      NutritionTypeConverter();
  static TypeConverter<List<AnalyzedInstructionEntity>, String>
      $converteranalyzedInstructions = InstructionTypeConverter();
}

class RecipeTableCompanion extends UpdateCompanion<RecipeDetailEntity> {
  final Value<String> id;
  final Value<String> image;
  final Value<String> title;
  final Value<int> readyInMinutes;
  final Value<int> aggregateLikes;
  final Value<double> healthScore;
  final Value<List<ExtendedIngredientEntity>> extendedIngredients;
  final Value<NutritionEntity> nutrition;
  final Value<String> summary;
  final Value<String> instructions;
  final Value<List<AnalyzedInstructionEntity>> analyzedInstructions;
  final Value<bool> isFavourite;
  final Value<int> rowid;
  const RecipeTableCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.title = const Value.absent(),
    this.readyInMinutes = const Value.absent(),
    this.aggregateLikes = const Value.absent(),
    this.healthScore = const Value.absent(),
    this.extendedIngredients = const Value.absent(),
    this.nutrition = const Value.absent(),
    this.summary = const Value.absent(),
    this.instructions = const Value.absent(),
    this.analyzedInstructions = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeTableCompanion.insert({
    required String id,
    required String image,
    required String title,
    required int readyInMinutes,
    required int aggregateLikes,
    required double healthScore,
    required List<ExtendedIngredientEntity> extendedIngredients,
    required NutritionEntity nutrition,
    required String summary,
    required String instructions,
    required List<AnalyzedInstructionEntity> analyzedInstructions,
    required bool isFavourite,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        image = Value(image),
        title = Value(title),
        readyInMinutes = Value(readyInMinutes),
        aggregateLikes = Value(aggregateLikes),
        healthScore = Value(healthScore),
        extendedIngredients = Value(extendedIngredients),
        nutrition = Value(nutrition),
        summary = Value(summary),
        instructions = Value(instructions),
        analyzedInstructions = Value(analyzedInstructions),
        isFavourite = Value(isFavourite);
  static Insertable<RecipeDetailEntity> custom({
    Expression<String>? id,
    Expression<String>? image,
    Expression<String>? title,
    Expression<int>? readyInMinutes,
    Expression<int>? aggregateLikes,
    Expression<double>? healthScore,
    Expression<String>? extendedIngredients,
    Expression<String>? nutrition,
    Expression<String>? summary,
    Expression<String>? instructions,
    Expression<String>? analyzedInstructions,
    Expression<bool>? isFavourite,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (title != null) 'title': title,
      if (readyInMinutes != null) 'ready_in_minutes': readyInMinutes,
      if (aggregateLikes != null) 'aggregate_likes': aggregateLikes,
      if (healthScore != null) 'health_score': healthScore,
      if (extendedIngredients != null)
        'extended_ingredients': extendedIngredients,
      if (nutrition != null) 'nutrition': nutrition,
      if (summary != null) 'summary': summary,
      if (instructions != null) 'instructions': instructions,
      if (analyzedInstructions != null)
        'analyzed_instructions': analyzedInstructions,
      if (isFavourite != null) 'is_favourite': isFavourite,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? image,
      Value<String>? title,
      Value<int>? readyInMinutes,
      Value<int>? aggregateLikes,
      Value<double>? healthScore,
      Value<List<ExtendedIngredientEntity>>? extendedIngredients,
      Value<NutritionEntity>? nutrition,
      Value<String>? summary,
      Value<String>? instructions,
      Value<List<AnalyzedInstructionEntity>>? analyzedInstructions,
      Value<bool>? isFavourite,
      Value<int>? rowid}) {
    return RecipeTableCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      readyInMinutes: readyInMinutes ?? this.readyInMinutes,
      aggregateLikes: aggregateLikes ?? this.aggregateLikes,
      healthScore: healthScore ?? this.healthScore,
      extendedIngredients: extendedIngredients ?? this.extendedIngredients,
      nutrition: nutrition ?? this.nutrition,
      summary: summary ?? this.summary,
      instructions: instructions ?? this.instructions,
      analyzedInstructions: analyzedInstructions ?? this.analyzedInstructions,
      isFavourite: isFavourite ?? this.isFavourite,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (readyInMinutes.present) {
      map['ready_in_minutes'] = Variable<int>(readyInMinutes.value);
    }
    if (aggregateLikes.present) {
      map['aggregate_likes'] = Variable<int>(aggregateLikes.value);
    }
    if (healthScore.present) {
      map['health_score'] = Variable<double>(healthScore.value);
    }
    if (extendedIngredients.present) {
      map['extended_ingredients'] = Variable<String>($RecipeTableTable
          .$converterextendedIngredients
          .toSql(extendedIngredients.value));
    }
    if (nutrition.present) {
      map['nutrition'] = Variable<String>(
          $RecipeTableTable.$converternutrition.toSql(nutrition.value));
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (analyzedInstructions.present) {
      map['analyzed_instructions'] = Variable<String>($RecipeTableTable
          .$converteranalyzedInstructions
          .toSql(analyzedInstructions.value));
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<bool>(isFavourite.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('title: $title, ')
          ..write('readyInMinutes: $readyInMinutes, ')
          ..write('aggregateLikes: $aggregateLikes, ')
          ..write('healthScore: $healthScore, ')
          ..write('extendedIngredients: $extendedIngredients, ')
          ..write('nutrition: $nutrition, ')
          ..write('summary: $summary, ')
          ..write('instructions: $instructions, ')
          ..write('analyzedInstructions: $analyzedInstructions, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$RecipeDetailEntityInsertable implements Insertable<RecipeDetailEntity> {
  RecipeDetailEntity _object;
  _$RecipeDetailEntityInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return RecipeTableCompanion(
      id: Value(_object.id),
      image: Value(_object.image),
      title: Value(_object.title),
      readyInMinutes: Value(_object.readyInMinutes),
      aggregateLikes: Value(_object.aggregateLikes),
      healthScore: Value(_object.healthScore),
      extendedIngredients: Value(_object.extendedIngredients),
      nutrition: Value(_object.nutrition),
      summary: Value(_object.summary),
      instructions: Value(_object.instructions),
      analyzedInstructions: Value(_object.analyzedInstructions),
      isFavourite: Value(_object.isFavourite),
    ).toColumns(false);
  }
}

extension RecipeDetailEntityToInsertable on RecipeDetailEntity {
  _$RecipeDetailEntityInsertable toInsertable() {
    return _$RecipeDetailEntityInsertable(this);
  }
}

class $MealPlanTableTable extends MealPlanTable
    with TableInfo<$MealPlanTableTable, MealPlanEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealPlanTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _planDateMeta =
      const VerificationMeta('planDate');
  @override
  late final GeneratedColumn<String> planDate = GeneratedColumn<String>(
      'plan_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
      'day', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recipesMeta =
      const VerificationMeta('recipes');
  @override
  late final GeneratedColumnWithTypeConverter<List<RecipeDetailEntity>, String>
      recipes = GeneratedColumn<String>('recipes', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<RecipeDetailEntity>>(
              $MealPlanTableTable.$converterrecipes);
  @override
  List<GeneratedColumn> get $columns => [planDate, day, recipes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_plan_table';
  @override
  VerificationContext validateIntegrity(Insertable<MealPlanEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('plan_date')) {
      context.handle(_planDateMeta,
          planDate.isAcceptableOrUnknown(data['plan_date']!, _planDateMeta));
    } else if (isInserting) {
      context.missing(_planDateMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day']!, _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    context.handle(_recipesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {planDate};
  @override
  MealPlanEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealPlanEntity(
      planDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_date'])!,
      day: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}day'])!,
      recipes: $MealPlanTableTable.$converterrecipes.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipes'])!),
    );
  }

  @override
  $MealPlanTableTable createAlias(String alias) {
    return $MealPlanTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<RecipeDetailEntity>, String> $converterrecipes =
      RecipeDetailConverter();
}

class MealPlanTableCompanion extends UpdateCompanion<MealPlanEntity> {
  final Value<String> planDate;
  final Value<String> day;
  final Value<List<RecipeDetailEntity>> recipes;
  final Value<int> rowid;
  const MealPlanTableCompanion({
    this.planDate = const Value.absent(),
    this.day = const Value.absent(),
    this.recipes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MealPlanTableCompanion.insert({
    required String planDate,
    required String day,
    required List<RecipeDetailEntity> recipes,
    this.rowid = const Value.absent(),
  })  : planDate = Value(planDate),
        day = Value(day),
        recipes = Value(recipes);
  static Insertable<MealPlanEntity> custom({
    Expression<String>? planDate,
    Expression<String>? day,
    Expression<String>? recipes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (planDate != null) 'plan_date': planDate,
      if (day != null) 'day': day,
      if (recipes != null) 'recipes': recipes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MealPlanTableCompanion copyWith(
      {Value<String>? planDate,
      Value<String>? day,
      Value<List<RecipeDetailEntity>>? recipes,
      Value<int>? rowid}) {
    return MealPlanTableCompanion(
      planDate: planDate ?? this.planDate,
      day: day ?? this.day,
      recipes: recipes ?? this.recipes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (planDate.present) {
      map['plan_date'] = Variable<String>(planDate.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (recipes.present) {
      map['recipes'] = Variable<String>(
          $MealPlanTableTable.$converterrecipes.toSql(recipes.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealPlanTableCompanion(')
          ..write('planDate: $planDate, ')
          ..write('day: $day, ')
          ..write('recipes: $recipes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$MealPlanEntityInsertable implements Insertable<MealPlanEntity> {
  MealPlanEntity _object;
  _$MealPlanEntityInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return MealPlanTableCompanion(
      planDate: Value(_object.planDate),
      day: Value(_object.day),
      recipes: Value(_object.recipes),
    ).toColumns(false);
  }
}

extension MealPlanEntityToInsertable on MealPlanEntity {
  _$MealPlanEntityInsertable toInsertable() {
    return _$MealPlanEntityInsertable(this);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RecipeTableTable recipeTable = $RecipeTableTable(this);
  late final $MealPlanTableTable mealPlanTable = $MealPlanTableTable(this);
  late final RecipeDao recipeDao = RecipeDao(this as AppDatabase);
  late final MealPlanDao mealPlanDao = MealPlanDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [recipeTable, mealPlanTable];
}

typedef $$RecipeTableTableCreateCompanionBuilder = RecipeTableCompanion
    Function({
  required String id,
  required String image,
  required String title,
  required int readyInMinutes,
  required int aggregateLikes,
  required double healthScore,
  required List<ExtendedIngredientEntity> extendedIngredients,
  required NutritionEntity nutrition,
  required String summary,
  required String instructions,
  required List<AnalyzedInstructionEntity> analyzedInstructions,
  required bool isFavourite,
  Value<int> rowid,
});
typedef $$RecipeTableTableUpdateCompanionBuilder = RecipeTableCompanion
    Function({
  Value<String> id,
  Value<String> image,
  Value<String> title,
  Value<int> readyInMinutes,
  Value<int> aggregateLikes,
  Value<double> healthScore,
  Value<List<ExtendedIngredientEntity>> extendedIngredients,
  Value<NutritionEntity> nutrition,
  Value<String> summary,
  Value<String> instructions,
  Value<List<AnalyzedInstructionEntity>> analyzedInstructions,
  Value<bool> isFavourite,
  Value<int> rowid,
});

class $$RecipeTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get readyInMinutes => $composableBuilder(
      column: $table.readyInMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get aggregateLikes => $composableBuilder(
      column: $table.aggregateLikes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get healthScore => $composableBuilder(
      column: $table.healthScore, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<ExtendedIngredientEntity>,
          List<ExtendedIngredientEntity>, String>
      get extendedIngredients => $composableBuilder(
          column: $table.extendedIngredients,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<NutritionEntity, NutritionEntity, String>
      get nutrition => $composableBuilder(
          column: $table.nutrition,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get instructions => $composableBuilder(
      column: $table.instructions, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<AnalyzedInstructionEntity>,
          List<AnalyzedInstructionEntity>, String>
      get analyzedInstructions => $composableBuilder(
          column: $table.analyzedInstructions,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnFilters(column));
}

class $$RecipeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get readyInMinutes => $composableBuilder(
      column: $table.readyInMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get aggregateLikes => $composableBuilder(
      column: $table.aggregateLikes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get healthScore => $composableBuilder(
      column: $table.healthScore, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get extendedIngredients => $composableBuilder(
      column: $table.extendedIngredients,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nutrition => $composableBuilder(
      column: $table.nutrition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get instructions => $composableBuilder(
      column: $table.instructions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get analyzedInstructions => $composableBuilder(
      column: $table.analyzedInstructions,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnOrderings(column));
}

class $$RecipeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get readyInMinutes => $composableBuilder(
      column: $table.readyInMinutes, builder: (column) => column);

  GeneratedColumn<int> get aggregateLikes => $composableBuilder(
      column: $table.aggregateLikes, builder: (column) => column);

  GeneratedColumn<double> get healthScore => $composableBuilder(
      column: $table.healthScore, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<ExtendedIngredientEntity>, String>
      get extendedIngredients => $composableBuilder(
          column: $table.extendedIngredients, builder: (column) => column);

  GeneratedColumnWithTypeConverter<NutritionEntity, String> get nutrition =>
      $composableBuilder(column: $table.nutrition, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
      column: $table.instructions, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<AnalyzedInstructionEntity>, String>
      get analyzedInstructions => $composableBuilder(
          column: $table.analyzedInstructions, builder: (column) => column);

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => column);
}

class $$RecipeTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecipeTableTable,
    RecipeDetailEntity,
    $$RecipeTableTableFilterComposer,
    $$RecipeTableTableOrderingComposer,
    $$RecipeTableTableAnnotationComposer,
    $$RecipeTableTableCreateCompanionBuilder,
    $$RecipeTableTableUpdateCompanionBuilder,
    (
      RecipeDetailEntity,
      BaseReferences<_$AppDatabase, $RecipeTableTable, RecipeDetailEntity>
    ),
    RecipeDetailEntity,
    PrefetchHooks Function()> {
  $$RecipeTableTableTableManager(_$AppDatabase db, $RecipeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> readyInMinutes = const Value.absent(),
            Value<int> aggregateLikes = const Value.absent(),
            Value<double> healthScore = const Value.absent(),
            Value<List<ExtendedIngredientEntity>> extendedIngredients =
                const Value.absent(),
            Value<NutritionEntity> nutrition = const Value.absent(),
            Value<String> summary = const Value.absent(),
            Value<String> instructions = const Value.absent(),
            Value<List<AnalyzedInstructionEntity>> analyzedInstructions =
                const Value.absent(),
            Value<bool> isFavourite = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeTableCompanion(
            id: id,
            image: image,
            title: title,
            readyInMinutes: readyInMinutes,
            aggregateLikes: aggregateLikes,
            healthScore: healthScore,
            extendedIngredients: extendedIngredients,
            nutrition: nutrition,
            summary: summary,
            instructions: instructions,
            analyzedInstructions: analyzedInstructions,
            isFavourite: isFavourite,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String image,
            required String title,
            required int readyInMinutes,
            required int aggregateLikes,
            required double healthScore,
            required List<ExtendedIngredientEntity> extendedIngredients,
            required NutritionEntity nutrition,
            required String summary,
            required String instructions,
            required List<AnalyzedInstructionEntity> analyzedInstructions,
            required bool isFavourite,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecipeTableCompanion.insert(
            id: id,
            image: image,
            title: title,
            readyInMinutes: readyInMinutes,
            aggregateLikes: aggregateLikes,
            healthScore: healthScore,
            extendedIngredients: extendedIngredients,
            nutrition: nutrition,
            summary: summary,
            instructions: instructions,
            analyzedInstructions: analyzedInstructions,
            isFavourite: isFavourite,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecipeTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecipeTableTable,
    RecipeDetailEntity,
    $$RecipeTableTableFilterComposer,
    $$RecipeTableTableOrderingComposer,
    $$RecipeTableTableAnnotationComposer,
    $$RecipeTableTableCreateCompanionBuilder,
    $$RecipeTableTableUpdateCompanionBuilder,
    (
      RecipeDetailEntity,
      BaseReferences<_$AppDatabase, $RecipeTableTable, RecipeDetailEntity>
    ),
    RecipeDetailEntity,
    PrefetchHooks Function()>;
typedef $$MealPlanTableTableCreateCompanionBuilder = MealPlanTableCompanion
    Function({
  required String planDate,
  required String day,
  required List<RecipeDetailEntity> recipes,
  Value<int> rowid,
});
typedef $$MealPlanTableTableUpdateCompanionBuilder = MealPlanTableCompanion
    Function({
  Value<String> planDate,
  Value<String> day,
  Value<List<RecipeDetailEntity>> recipes,
  Value<int> rowid,
});

class $$MealPlanTableTableFilterComposer
    extends Composer<_$AppDatabase, $MealPlanTableTable> {
  $$MealPlanTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get planDate => $composableBuilder(
      column: $table.planDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<RecipeDetailEntity>,
          List<RecipeDetailEntity>, String>
      get recipes => $composableBuilder(
          column: $table.recipes,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$MealPlanTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MealPlanTableTable> {
  $$MealPlanTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get planDate => $composableBuilder(
      column: $table.planDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recipes => $composableBuilder(
      column: $table.recipes, builder: (column) => ColumnOrderings(column));
}

class $$MealPlanTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealPlanTableTable> {
  $$MealPlanTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get planDate =>
      $composableBuilder(column: $table.planDate, builder: (column) => column);

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<RecipeDetailEntity>, String>
      get recipes => $composableBuilder(
          column: $table.recipes, builder: (column) => column);
}

class $$MealPlanTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MealPlanTableTable,
    MealPlanEntity,
    $$MealPlanTableTableFilterComposer,
    $$MealPlanTableTableOrderingComposer,
    $$MealPlanTableTableAnnotationComposer,
    $$MealPlanTableTableCreateCompanionBuilder,
    $$MealPlanTableTableUpdateCompanionBuilder,
    (
      MealPlanEntity,
      BaseReferences<_$AppDatabase, $MealPlanTableTable, MealPlanEntity>
    ),
    MealPlanEntity,
    PrefetchHooks Function()> {
  $$MealPlanTableTableTableManager(_$AppDatabase db, $MealPlanTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealPlanTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealPlanTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealPlanTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> planDate = const Value.absent(),
            Value<String> day = const Value.absent(),
            Value<List<RecipeDetailEntity>> recipes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MealPlanTableCompanion(
            planDate: planDate,
            day: day,
            recipes: recipes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String planDate,
            required String day,
            required List<RecipeDetailEntity> recipes,
            Value<int> rowid = const Value.absent(),
          }) =>
              MealPlanTableCompanion.insert(
            planDate: planDate,
            day: day,
            recipes: recipes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MealPlanTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MealPlanTableTable,
    MealPlanEntity,
    $$MealPlanTableTableFilterComposer,
    $$MealPlanTableTableOrderingComposer,
    $$MealPlanTableTableAnnotationComposer,
    $$MealPlanTableTableCreateCompanionBuilder,
    $$MealPlanTableTableUpdateCompanionBuilder,
    (
      MealPlanEntity,
      BaseReferences<_$AppDatabase, $MealPlanTableTable, MealPlanEntity>
    ),
    MealPlanEntity,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecipeTableTableTableManager get recipeTable =>
      $$RecipeTableTableTableManager(_db, _db.recipeTable);
  $$MealPlanTableTableTableManager get mealPlanTable =>
      $$MealPlanTableTableTableManager(_db, _db.mealPlanTable);
}

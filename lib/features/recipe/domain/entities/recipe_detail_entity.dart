class RecipeDetailEntity {
  final int id;
  final String image;
  final String title;
  final int readyInMinutes;
  final int aggregateLikes;
  final double healthScore;
  final List<ExtendedIngredientEntity> extendedIngredients;
  final NutritionEntity nutrition;
  final String summary;
  final String instructions;
  final List<AnalyzedInstructionEntity> analyzedInstructions;

  RecipeDetailEntity({
    required this.id,
    required this.image,
    required this.title,
    required this.readyInMinutes,
    required this.aggregateLikes,
    required this.healthScore,
    required this.extendedIngredients,
    required this.nutrition,
    required this.summary,
    required this.instructions,
    required this.analyzedInstructions,
  });
}

class NutritionEntity {
  final List<NutrientEntity> nutrients;

  NutritionEntity({
    required this.nutrients,
  });
}

class NutrientEntity {
  final String name;
  final double amount;
  final String unit;
  final double percentOfDailyNeeds;

  NutrientEntity({
    required this.name,
    required this.amount,
    required this.unit,
    required this.percentOfDailyNeeds,
  });

  String get getNutrientData => "$name ${unit.isEmpty ? "" : "\n($unit)"}";
}

class ExtendedIngredientEntity {
  final int id;
  final String image;
  final String name;
  final String nameClean;
  final double amount;
  final String unit;

  ExtendedIngredientEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.nameClean,
    required this.amount,
    required this.unit,
  });

  String get getImage =>"https://spoonacular.com/cdn/ingredients_100x100/$image";
  String get getIngredientData => "$amount $unit";


}

class AnalyzedInstructionEntity {
  final String name;
  final List<StepEntity> steps;

  AnalyzedInstructionEntity({
    required this.name,
    required this.steps,
  });
}

class StepEntity {
  final int number;
  final String step;
  final List<StepIngredientEntity> ingredients;

  StepEntity({
    required this.number,
    required this.step,
    required this.ingredients,
  });
}

class StepIngredientEntity {
  final int id;
  final String name;
  final String localizedName;
  final String image;

  StepIngredientEntity({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.image,
  });
}

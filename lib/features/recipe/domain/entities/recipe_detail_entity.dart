import 'package:drift/drift.dart';

import '../../../../shared/services/local/app_database.dart';

class RecipeDetailEntity implements Insertable<RecipeDetailEntity> {
  final String id;
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
  bool isFavourite;

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
    required this.isFavourite,
  });

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return RecipeTableCompanion.insert(
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
    ).toColumns(nullToAbsent);
  }
}

class NutritionEntity {
  final List<NutrientEntity> nutrients;

  NutritionEntity({
    required this.nutrients,
  });

  factory NutritionEntity.fromJson(Map<String, dynamic> json) => NutritionEntity(
        nutrients: json["nutrients"] == null
            ? []
            : List<NutrientEntity>.from(
                json["nutrients"]!.map((x) => NutrientEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nutrients": List<dynamic>.from(nutrients.map((x) => x.toJson())),
      };
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

  factory NutrientEntity.fromJson(Map<String, dynamic> json) => NutrientEntity(
        name: json["name"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        percentOfDailyNeeds: json["percentOfDailyNeeds"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "unit": unit,
        "percentOfDailyNeeds": percentOfDailyNeeds,
      };

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

  factory ExtendedIngredientEntity.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredientEntity(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        nameClean: json["nameClean"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "name": name,
      "nameClean": nameClean,
      "amount": amount,
      "unit": unit,
    };
  }

  String get getImage => "https://spoonacular.com/cdn/ingredients_100x100/$image";

  String get getIngredientData => "$amount $unit";
}

class AnalyzedInstructionEntity {
  final String name;
  final List<StepEntity> steps;

  AnalyzedInstructionEntity({
    required this.name,
    required this.steps,
  });

  factory AnalyzedInstructionEntity.fromJson(Map<String, dynamic> json) =>
      AnalyzedInstructionEntity(
        name: json["name"],
        steps: json["steps"] == null
            ? []
            : List<StepEntity>.from(json["steps"]!.map((x) => StepEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
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

  factory StepEntity.fromJson(Map<String, dynamic> json) => StepEntity(
        number: json["number"],
        step: json["step"],
        ingredients: json["ingredients"] == null
            ? []
            : List<StepIngredientEntity>.from(
                json["ingredients"]!.map((x) => StepIngredientEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
      };
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

  factory StepIngredientEntity.fromJson(Map<String, dynamic> json) =>
      StepIngredientEntity(
        id: json["id"],
        name: json["name"],
        localizedName: json["localizedName"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localizedName": localizedName,
        "image": image,
      };
}

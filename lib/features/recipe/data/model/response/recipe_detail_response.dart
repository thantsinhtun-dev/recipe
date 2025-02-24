import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/shared/domain/models/base_response_model.dart';

class RecipeDetailResponse extends BaseResponseModel{
  int? id;
  String? image;
  String? imageType;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  String? gaps;
  dynamic preparationMinutes;
  dynamic cookingMinutes;
  int? aggregateLikes;
  double? healthScore;
  String? creditsText;
  dynamic license;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredientModel>? extendedIngredients;
  Nutrition? nutrition;
  String? summary;
  List<dynamic>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<String>? occasions;
  String? instructions;
  List<AnalyzedInstructionModel>? analyzedInstructions;
  dynamic originalId;
  double? spoonacularScore;
  String? spoonacularSourceUrl;

  RecipeDetailResponse({
    this.id,
    this.image,
    this.imageType,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.nutrition,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularScore,
    this.spoonacularSourceUrl,
  });

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "imageType": imageType,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "vegetarian": vegetarian,
        "vegan": vegan,
        "glutenFree": glutenFree,
        "dairyFree": dairyFree,
        "veryHealthy": veryHealthy,
        "cheap": cheap,
        "veryPopular": veryPopular,
        "sustainable": sustainable,
        "lowFodmap": lowFodmap,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "gaps": gaps,
        "preparationMinutes": preparationMinutes,
        "cookingMinutes": cookingMinutes,
        "aggregateLikes": aggregateLikes,
        "healthScore": healthScore,
        "creditsText": creditsText,
        "license": license,
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "extendedIngredients": extendedIngredients == null
            ? []
            : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
        "nutrition": nutrition?.toJson(),
        "summary": summary,
        "cuisines": cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x)),
        "dishTypes":
            dishTypes == null ? [] : List<dynamic>.from(dishTypes!.map((x) => x)),
        "diets": diets == null ? [] : List<dynamic>.from(diets!.map((x) => x)),
        "occasions":
            occasions == null ? [] : List<dynamic>.from(occasions!.map((x) => x)),
        "instructions": instructions,
        "analyzedInstructions": analyzedInstructions == null
            ? []
            : List<dynamic>.from(analyzedInstructions!.map((x) => x.toJson())),
        "originalId": originalId,
        "spoonacularScore": spoonacularScore,
        "spoonacularSourceUrl": spoonacularSourceUrl,
      };

  RecipeDetailEntity toEntity() {
    return RecipeDetailEntity(
      id: id ?? 0,
      image: image ?? "",
      title: title ?? "",
      readyInMinutes: readyInMinutes ?? 0,
      aggregateLikes: aggregateLikes ?? 0,
      healthScore: healthScore ?? 0.0,
      extendedIngredients: extendedIngredients?.map((e) => e.toEntity()).toList() ?? [],
      nutrition: nutrition?.toEntity() ?? NutritionEntity(nutrients: []),
      summary: summary ?? "",
      instructions: instructions ?? "",
      analyzedInstructions: analyzedInstructions?.map((e) => e.toEntity()).toList() ?? [],
    );
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return RecipeDetailResponse(
      id: json["id"],
      image: json["image"],
      imageType: json["imageType"],
      title: json["title"],
      readyInMinutes: json["readyInMinutes"],
      servings: json["servings"],
      sourceUrl: json["sourceUrl"],
      vegetarian: json["vegetarian"],
      vegan: json["vegan"],
      glutenFree: json["glutenFree"],
      dairyFree: json["dairyFree"],
      veryHealthy: json["veryHealthy"],
      cheap: json["cheap"],
      veryPopular: json["veryPopular"],
      sustainable: json["sustainable"],
      lowFodmap: json["lowFodmap"],
      weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
      gaps: json["gaps"],
      preparationMinutes: json["preparationMinutes"],
      cookingMinutes: json["cookingMinutes"],
      aggregateLikes: json["aggregateLikes"],
      healthScore: json["healthScore"],
      creditsText: json["creditsText"],
      license: json["license"],
      sourceName: json["sourceName"],
      pricePerServing: json["pricePerServing"]?.toDouble(),
      extendedIngredients: json["extendedIngredients"] == null
          ? []
          : List<ExtendedIngredientModel>.from(json["extendedIngredients"]!
          .map((x) => ExtendedIngredientModel.fromJson(x))),
      nutrition:
      json["nutrition"] == null ? null : Nutrition.fromJson(json["nutrition"]),
      summary: json["summary"],
      cuisines: json["cuisines"] == null
          ? []
          : List<dynamic>.from(json["cuisines"]!.map((x) => x)),
      dishTypes: json["dishTypes"] == null
          ? []
          : List<String>.from(json["dishTypes"]!.map((x) => x)),
      diets:
      json["diets"] == null ? [] : List<String>.from(json["diets"]!.map((x) => x)),
      occasions: json["occasions"] == null
          ? []
          : List<String>.from(json["occasions"]!.map((x) => x)),
      instructions: json["instructions"],
      analyzedInstructions: json["analyzedInstructions"] == null
          ? []
          : List<AnalyzedInstructionModel>.from(json["analyzedInstructions"]!
          .map((x) => AnalyzedInstructionModel.fromJson(x))),
      originalId: json["originalId"],
      spoonacularScore: json["spoonacularScore"]?.toDouble(),
      spoonacularSourceUrl: json["spoonacularSourceUrl"],
    );
  }

  @override
  fromJsonList(List list) {
    throw UnimplementedError();
  }
}

class AnalyzedInstructionModel {
  String? name;
  List<StepModel>? steps;

  AnalyzedInstructionModel({
    this.name,
    this.steps,
  });

  factory AnalyzedInstructionModel.fromJson(Map<String, dynamic> json) =>
      AnalyzedInstructionModel(
        name: json["name"],
        steps: json["steps"] == null
            ? []
            : List<StepModel>.from(json["steps"]!.map((x) => StepModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x.toJson())),
      };

  AnalyzedInstructionEntity toEntity() {
    return AnalyzedInstructionEntity(
      name: name ?? "",
      steps: steps?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

class StepModel {
  int? number;
  String? step;
  List<StepIngredient>? ingredients;
  List<dynamic>? equipment;
  Length? length;

  StepModel({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) => StepModel(
        number: json["number"],
        step: json["step"],
        ingredients: json["ingredients"] == null
            ? []
            : List<StepIngredient>.from(
                json["ingredients"]!.map((x) => StepIngredient.fromJson(x))),
        equipment: json["equipment"] == null
            ? []
            : List<dynamic>.from(json["equipment"]!.map((x) => x)),
        length: json["length"] == null ? null : Length.fromJson(json["length"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "equipment":
            equipment == null ? [] : List<dynamic>.from(equipment!.map((x) => x)),
        "length": length?.toJson(),
      };

  StepEntity toEntity() {
    return StepEntity(
      number: number ?? 0,
      step: step ?? "",
      ingredients: ingredients?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

class StepIngredient {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  StepIngredient({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  factory StepIngredient.fromJson(Map<String, dynamic> json) => StepIngredient(
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

  StepIngredientEntity toEntity() {
    return StepIngredientEntity(
      id: id ?? 0,
      name: name ?? "",
      localizedName: localizedName ?? "",
      image: image ?? "",
    );
  }
}

class Length {
  int? number;
  String? unit;

  Length({
    this.number,
    this.unit,
  });

  factory Length.fromJson(Map<String, dynamic> json) => Length(
        number: json["number"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "unit": unit,
      };
}

class ExtendedIngredientModel {
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  double? amount;
  String? unit;
  List<String>? meta;
  Measures? measures;

  ExtendedIngredientModel({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  factory ExtendedIngredientModel.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredientModel(
        id: json["id"],
        aisle: json["aisle"],
        image: json["image"],
        consistency: json["consistency"],
        name: json["name"],
        nameClean: json["nameClean"],
        original: json["original"],
        originalName: json["originalName"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        meta: json["meta"] == null ? [] : List<String>.from(json["meta"]!.map((x) => x)),
        measures: json["measures"] == null ? null : Measures.fromJson(json["measures"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aisle": aisle,
        "image": image,
        "consistency": consistency,
        "name": name,
        "nameClean": nameClean,
        "original": original,
        "originalName": originalName,
        "amount": amount,
        "unit": unit,
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "measures": measures?.toJson(),
      };

  ExtendedIngredientEntity toEntity() {
    return ExtendedIngredientEntity(
      id: id ?? 0,
      image: image ?? "",
      name: name ?? "",
      nameClean: nameClean ?? "",
      amount: amount ?? 0,
      unit: unit ?? "",
    );
  }
}

class Measures {
  Metric? us;
  Metric? metric;

  Measures({
    this.us,
    this.metric,
  });

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
        us: json["us"] == null ? null : Metric.fromJson(json["us"]),
        metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
      );

  Map<String, dynamic> toJson() => {
        "us": us?.toJson(),
        "metric": metric?.toJson(),
      };
}

class Metric {
  double? amount;
  String? unitShort;
  String? unitLong;

  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        amount: json["amount"]?.toDouble(),
        unitShort: json["unitShort"],
        unitLong: json["unitLong"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unitShort": unitShort,
        "unitLong": unitLong,
      };
}

class Nutrition {
  List<NutrientModel>? nutrients;
  List<NutrientModel>? properties;
  List<NutrientModel>? flavonoids;
  List<NutritionIngredient>? ingredients;
  CaloricBreakdown? caloricBreakdown;
  WeightPerServing? weightPerServing;

  Nutrition({
    this.nutrients,
    this.properties,
    this.flavonoids,
    this.ingredients,
    this.caloricBreakdown,
    this.weightPerServing,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        nutrients: json["nutrients"] == null
            ? []
            : List<NutrientModel>.from(
                json["nutrients"]!.map((x) => NutrientModel.fromJson(x))),
        properties: json["properties"] == null
            ? []
            : List<NutrientModel>.from(
                json["properties"]!.map((x) => NutrientModel.fromJson(x))),
        flavonoids: json["flavonoids"] == null
            ? []
            : List<NutrientModel>.from(
                json["flavonoids"]!.map((x) => NutrientModel.fromJson(x))),
        ingredients: json["ingredients"] == null
            ? []
            : List<NutritionIngredient>.from(
                json["ingredients"]!.map((x) => NutritionIngredient.fromJson(x))),
        caloricBreakdown: json["caloricBreakdown"] == null
            ? null
            : CaloricBreakdown.fromJson(json["caloricBreakdown"]),
        weightPerServing: json["weightPerServing"] == null
            ? null
            : WeightPerServing.fromJson(json["weightPerServing"]),
      );

  Map<String, dynamic> toJson() => {
        "nutrients": nutrients == null
            ? []
            : List<dynamic>.from(nutrients!.map((x) => x.toJson())),
        "properties": properties == null
            ? []
            : List<dynamic>.from(properties!.map((x) => x.toJson())),
        "flavonoids": flavonoids == null
            ? []
            : List<dynamic>.from(flavonoids!.map((x) => x.toJson())),
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "caloricBreakdown": caloricBreakdown?.toJson(),
        "weightPerServing": weightPerServing?.toJson(),
      };

  NutritionEntity toEntity() {
    return NutritionEntity(
      nutrients: nutrients?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

class CaloricBreakdown {
  double? percentProtein;
  double? percentFat;
  double? percentCarbs;

  CaloricBreakdown({
    this.percentProtein,
    this.percentFat,
    this.percentCarbs,
  });

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) => CaloricBreakdown(
        percentProtein: json["percentProtein"],
        percentFat: json["percentFat"]?.toDouble(),
        percentCarbs: json["percentCarbs"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "percentProtein": percentProtein,
        "percentFat": percentFat,
        "percentCarbs": percentCarbs,
      };
}

class NutrientModel {
  String? name;
  double? amount;
  String? unit;
  double? percentOfDailyNeeds;

  NutrientModel({
    this.name,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  factory NutrientModel.fromJson(Map<String, dynamic> json) => NutrientModel(
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

  NutrientEntity toEntity() {
    return NutrientEntity(
      name: name ?? "",
      amount: amount ?? 0,
      unit: unit ?? "",
      percentOfDailyNeeds: percentOfDailyNeeds ?? 0,
    );
  }
}

class NutritionIngredient {
  int? id;
  String? name;
  double? amount;
  String? unit;
  List<NutrientModel>? nutrients;

  NutritionIngredient({
    this.id,
    this.name,
    this.amount,
    this.unit,
    this.nutrients,
  });

  factory NutritionIngredient.fromJson(Map<String, dynamic> json) => NutritionIngredient(
        id: json["id"],
        name: json["name"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        nutrients: json["nutrients"] == null
            ? []
            : List<NutrientModel>.from(
                json["nutrients"]!.map((x) => NutrientModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "unit": unit,
        "nutrients": nutrients == null
            ? []
            : List<dynamic>.from(nutrients!.map((x) => x.toJson())),
      };
}

class WeightPerServing {
  int? amount;
  String? unit;

  WeightPerServing({
    this.amount,
    this.unit,
  });

  factory WeightPerServing.fromJson(Map<String, dynamic> json) => WeightPerServing(
        amount: json["amount"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unit": unit,
      };
}

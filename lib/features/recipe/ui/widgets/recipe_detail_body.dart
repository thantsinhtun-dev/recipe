import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/shared/extenstions/ext_widget.dart';
import '../../../../core/core.dart';
import '../../domain/entities/recipe_detail_entity.dart';
import '../providers/recipe_detail_provider.dart';

class RecipeDetailBody extends ConsumerWidget {
  const RecipeDetailBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var recipeDetailState = ref.watch(recipeDetailProvider);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: kMargin16,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(kMargin16),
                child: CachedNetworkImage(
                  imageUrl: recipeDetailState.entity?.image ?? "",
                ),
              ),
              Text(
                recipeDetailState.entity?.title ?? "",
                style: context.appFonts.customFont(
                  fontSize: FontSize.s18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              NutritionWidget(
                nutrients: recipeDetailState.entity?.nutrition.nutrients ?? [],
                minutes: recipeDetailState.entity?.readyInMinutes ?? 0,
                healthScore: recipeDetailState.entity?.healthScore ?? 0.0,
              ),
            ],
          ),
        ),
        RecipeIngredients(
          ingredients: recipeDetailState.entity?.extendedIngredients ?? [],
        ),
        RecipeInstruction(
          instruction: recipeDetailState.entity?.instructions ?? "",
        ),
        RecipeInstructionSteps(
          steps: recipeDetailState.entity?.analyzedInstructions.firstOrNull?.steps ?? [],
        ),
      ],
    ).paddingSymmetric(horizontal: kMargin16);
  }
}

class NutritionWidget extends StatelessWidget {
  const NutritionWidget({
    super.key,
    required this.nutrients,
    required this.minutes,
    required this.healthScore,
  });

  final int minutes;
  final double healthScore;
  final List<NutrientEntity> nutrients;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kMargin16, vertical: kMargin16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMargin12),
          border: Border.all(
            color: context.appColors.grayColor.withValues(alpha: 0.2),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipeScoreListTile(
            nutrientEntity: nutrients.where((e) => e.name == "Calories").singleOrNull,
          ),
          RecipeScoreListTile(
            nutrientEntity: nutrients.where((e) => e.name == "Fat").singleOrNull,
          ),
          RecipeScoreListTile(
            nutrientEntity: NutrientEntity(
              name: "healthScore",
              amount: healthScore,
              unit: "",
              percentOfDailyNeeds: 0,
            ),
          ),
          RecipeScoreListTile(
            nutrientEntity: NutrientEntity(
              name: "minutes",
              amount: minutes.toDouble(),
              unit: "",
              percentOfDailyNeeds: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeInstruction extends StatelessWidget {
  const RecipeInstruction({
    super.key,
    required this.instruction,
  });

  final String instruction;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Instruction",
            style: context.appFonts.customFont(
              fontSize: FontSize.s16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            instruction,
            style: context.appFonts.customFont(
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ).paddingSymmetric(vertical: kMargin16),
    );
  }
}

class RecipeInstructionSteps extends StatelessWidget {
  final List<StepEntity> steps;

  const RecipeInstructionSteps({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final step = steps[index];
          final stepNumber = step.number;
          final stepText = step.step;
          final ingredients = step.ingredients;
          return Card(
            margin: const EdgeInsets.symmetric(vertical: kMargin16),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Step $stepNumber",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(stepText),
                  if (ingredients.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    const Text("Ingredients:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ingredients.length,
                        itemBuilder: (context, ingIndex) {
                          final ingredient = ingredients[ingIndex];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                  "https://img.spoonacular.com/ingredients_100x100/${ingredient.image}",
                                  width: 36,
                                  height: 36,
                                  fit: BoxFit.fitWidth,
                                  errorWidget: (context, url, error) {
                                    return const SizedBox();
                                  },
                                ),
                                Text(ingredient.localizedName,
                                    style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
        childCount: steps.length,
      ),
    );
  }
}

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({
    super.key,
    required this.ingredients,
  });

  final List<ExtendedIngredientEntity> ingredients;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: kMargin16),
          Row(
            children: [
              Text(
                "Ingredients",
                style: context.appFonts.customFont(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                "${ingredients.length} items",
                style: context.appFonts.customFont(
                  fontSize: FontSize.s14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: kMargin16),
          ...List.generate(
            ingredients.length,
                (index) => Row(
              children: [
                CachedNetworkImage(
                  imageUrl: ingredients[index].getImage,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Text(
                    ingredients[index].name,
                    overflow: TextOverflow.ellipsis,
                    style: context.appFonts.customFont(
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    ingredients[index].getIngredientData,
                    style: context.appFonts.customFont(
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeScoreListTile extends StatelessWidget {
  const RecipeScoreListTile({
    super.key,
    this.nutrientEntity,
  });

  final NutrientEntity? nutrientEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          nutrientEntity?.amount.toString() ?? "",
          textAlign: TextAlign.center,
          style: context.appFonts.customFont(
            fontSize: FontSize.s14,
            fontWeight: FontWeight.w600,
            color: context.appColors.primaryColor,
          ),
        ),
        Text(
          nutrientEntity?.getNutrientData ?? "",
          textAlign: TextAlign.center,
          style: context.appFonts.customFont(
            fontSize: FontSize.s12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

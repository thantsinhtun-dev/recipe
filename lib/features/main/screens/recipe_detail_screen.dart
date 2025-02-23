import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe/core/app_dimens.dart';
import 'package:recipe/core/core.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
        centerTitle: false,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_rounded,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        // padding: EdgeInsets.symmetric(
        //   horizontal: kMargin16,
        // ),
        slivers: [
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kMargin16),
              child: CachedNetworkImage(
                imageUrl: "https://img.spoonacular.com/recipes/644387-556x370.jpg",
              ),
            ),
          ),
          // const SizedBox(height: kMargin16),
          // Text("Garlicky Kale",
          //     style: context.appFonts.customFont(
          //       fontSize: FontSize.s18,
          //       fontWeight: FontWeight.w600,
          //     )),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kMargin16, vertical: kMargin16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kMargin12),
                  border: Border.all(
                    color: context.appColors.grayColor.withValues(alpha: 0.2),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeScoreListTile(
                    title: 'kcal',
                    score: "120",
                  ),
                  RecipeScoreListTile(
                    title: 'kcal',
                    score: "120",
                  ),
                  RecipeScoreListTile(
                    title: 'kcal',
                    score: "120",
                  ),
                  RecipeScoreListTile(
                    title: 'kcal',
                    score: "120",
                  ),
                ],
              ),
            ),
          ),
          RecipeIngredients(),
          RecipeInstruction(),
          RecipeInstructionSteps(
            steps: dummySteps,
          ),
        ],
      ),
    );
  }
}

final dummySteps = [
  {
    "number": 1,
    "step": "Sauté onion and garlic in olive oil for 5 minutes.",
    "ingredients": [
      {
        "id": 4053,
        "name": "olive oil",
        "localizedName": "Olive Oil",
        "image": "olive-oil.jpg"
      },
      {"id": 11215, "name": "garlic", "localizedName": "Garlic", "image": "garlic.png"},
      {"id": 11282, "name": "onion", "localizedName": "Onion", "image": "brown-onion.png"}
    ],
    "length": {"number": 5, "unit": "minutes"}
  },
  {
    "number": 2,
    "step": "Add the carrot, sauté for another 2 minutes.",
    "ingredients": [
      {
        "id": 11124,
        "name": "carrot",
        "localizedName": "Carrot",
        "image": "sliced-carrot.png"
      }
    ],
    "length": {"number": 2, "unit": "minutes"}
  },
  {
    "number": 3,
    "step": "Add tomatoes, bay leaf, and water. Stir and bring to a boil.",
    "ingredients": [
      {
        "id": 2004,
        "name": "bay leaves",
        "localizedName": "Bay Leaves",
        "image": "bay-leaves.jpg"
      },
      {"id": 11529, "name": "tomato", "localizedName": "Tomato", "image": "tomato.png"},
      {"id": 14412, "name": "water", "localizedName": "Water", "image": "water.png"}
    ],
  },
  {
    "number": 4,
    "step": "Stir in lentils, season with salt, and cook for 5 minutes.",
    "ingredients": [
      {
        "id": 10316069,
        "name": "lentils",
        "localizedName": "Lentils",
        "image": "lentils-brown.jpg"
      },
      {"id": 2047, "name": "salt", "localizedName": "Salt", "image": "salt.jpg"}
    ],
    "length": {"number": 5, "unit": "minutes"}
  },
  {
    "number": 5,
    "step": "Before serving, sprinkle with chopped parsley.",
    "ingredients": [
      {"id": 11297, "name": "parsley", "localizedName": "Parsley", "image": "parsley.jpg"}
    ],
  }
];

class RecipeInstruction extends StatelessWidget {
  const RecipeInstruction({super.key});

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
            "Saut onion and garlic in olive oil for 5 minutes.\nAdd the carrot, saut for another 2 minutes.\nAdd tomatoes, bay leaf and water, stir and bring to the boil.\nStir in lentils, season with salt and cook for 5 minutes.\nBefore serving sprinkle with chopped parsley.",
            style: context.appFonts.customFont(
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeInstructionSteps extends StatelessWidget {
  final List<Map<String, dynamic>> steps;

  const RecipeInstructionSteps({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final step = steps[index];
          final stepNumber = step["number"];
          final stepText = step["step"];
          final ingredients = step["ingredients"] as List;
          final time = step["length"]?["number"];

          return Card(
            margin: const EdgeInsets.all(10),
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
                  if (time != null) ...[
                    const SizedBox(height: 5),
                    Text("⏳ $time minutes", style: const TextStyle(color: Colors.blue)),
                  ],
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
                                      "https://img.spoonacular.com/ingredients_100x100/${ingredient["image"]}",
                                  width: 36,
                                  height: 36,
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(ingredient["localizedName"],
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
  const RecipeIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
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
                "6 items",
                style: context.appFonts.customFont(
                  fontSize: FontSize.s14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          ...List.generate(
            10,
            (index) => Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://img.spoonacular.com/ingredients_100x100/olive-oil.jpg",
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Text(
                  "Olive Oil",
                  style: context.appFonts.customFont(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Text(
                  "2 cloves",
                  style: context.appFonts.customFont(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
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
    required this.title,
    required this.score,
  });

  final String title;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          score,
          textAlign: TextAlign.center,
          style: context.appFonts.customFont(
            fontSize: FontSize.s14,
            fontWeight: FontWeight.w600,
            color: context.appColors.primaryColor,
          ),
        ),
        Text(
          title,
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

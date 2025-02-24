import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/core/app_fonts.dart';
import 'package:recipe/features/meal_plan/ui/providers/recipe_sheet_provider.dart';
import 'package:recipe/features/meal_plan/ui/widgets/meal_plan_recipe_list_tile.dart';

import '../../../recipe/domain/entities/recipe_detail_entity.dart';

class RecipeListSheet extends ConsumerStatefulWidget {
  const RecipeListSheet({
    super.key,
    required this.onTapAdd,
  });

  final Function(RecipeDetailEntity) onTapAdd;

  @override
  ConsumerState createState() => _RecipeListSheetState();
}

class _RecipeListSheetState extends ConsumerState<RecipeListSheet> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(recipeSheetProvider.notifier).loadAllRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    var recipeSheetState = ref.watch(recipeSheetProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose Recipe",
          style: context.appFonts.customFont(
            fontSize: FontSize.s16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: recipeSheetState.entities.length,
        itemBuilder: (context, index) {
          var item = recipeSheetState.entities[index];
          return MealPlanRecipeListTile(
            entity: item,
            isFromSheet: true,
            onTapAdd: (entity) {
              widget.onTapAdd(entity);
            },
            onTapRemove: (entity) {},
          );
        },
      ),
    );
  }
}

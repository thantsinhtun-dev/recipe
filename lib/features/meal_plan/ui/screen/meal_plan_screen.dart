import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/meal_plan/ui/screen/sheet_recipe_list.dart';
import 'package:recipe/features/meal_plan/ui/widgets/meal_plan_recipe_list_tile.dart';
import 'package:recipe/shared/extenstions/ext_widget.dart';

import '../../../../core/core.dart';
import '../../../recipe/ui/widgets/recipe_list_tile.dart';
import '../providers/meal_plan_provider.dart';

@RoutePage()
class MealPlanScreen extends ConsumerStatefulWidget {
  const MealPlanScreen({super.key});

  @override
  ConsumerState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends ConsumerState<MealPlanScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mealPlanProvider.notifier).initMealPlan();
    });
  }

  @override
  Widget build(BuildContext context) {
    var mealPlanState = ref.watch(mealPlanProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meal Plan",
          style: context.appFonts.customFont(
            fontSize: FontSize.s18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const MealPlanTitleWidget(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemCount: mealPlanState.mealPlan.length,
                  itemBuilder: (context, index) {
                    var item = mealPlanState.mealPlan[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              item.day,
                              style: context.appFonts.customFont(
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.s16,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  showDragHandle: false,
                                  useSafeArea: true,
                                  isScrollControlled: true,
                                  context: context,
                                  backgroundColor: Colors.red,
                                  builder: (context) {
                                    return ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(kMargin16),
                                      ),
                                      child: RecipeListSheet(
                                        onTapAdd: (entity) {
                                          Navigator.of(context).pop();
                                          ref
                                              .read(mealPlanProvider.notifier)
                                              .addToMealPlan(index, entity);
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    context.appColors.grayColor.withValues(alpha: 0.2),
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                "+ ADD",
                                style: context.appFonts.customFont(
                                    fontWeight: FontWeight.w500,
                                    fontSize: FontSize.s14,
                                    color: context.appColors.primaryColor),
                              ),
                            )
                          ],
                        ).paddingSymmetric(horizontal: kMargin16),
                        const Divider().paddingSymmetric(horizontal: kMargin16),
                        item.recipes.isEmpty
                            ? const SizedBox(height: kMargin56,)
                            : SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: mealPlanState.mealPlan[index].recipes.length,
                                  itemBuilder: (context, mealIndex) {
                                    var entity = item.recipes[mealIndex];
                                    return MealPlanRecipeListTile(
                                      entity: entity,
                                      onTapAdd: (entity) {},
                                      onTapRemove: (entity) {
                                        ref
                                            .read(mealPlanProvider.notifier)
                                            .removeFromMealPlan(index, entity);
                                      },
                                    );
                                  },
                                ),
                              )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MealPlanTitleWidget extends StatelessWidget {
  const MealPlanTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        const Text(
          'Meal Plan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        )
      ],
    );
  }
}

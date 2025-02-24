import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/routes/app_route.dart';

import '../../../../core/core.dart';

class MealPlanRecipeListTile extends StatelessWidget {
  const MealPlanRecipeListTile({
    super.key,
    required this.entity,
    this.isFromSheet = false,
    required this.onTapAdd,
    required this.onTapRemove,
  });

  final RecipeDetailEntity entity;
  final bool isFromSheet;
  final Function(RecipeDetailEntity) onTapAdd;
  final Function(RecipeDetailEntity) onTapRemove;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(RecipeDetailRoute(id: entity.id));
      },
      child: Container(
        height: 180,
        width: 250,
        margin: const EdgeInsets.symmetric(
          horizontal: kMargin16,
          vertical: kMargin10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: kMargin6, vertical: kMargin6),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              context.appColors.grayColor.withValues(alpha: 0.5),
              BlendMode.darken,
            ),
            image: CachedNetworkImageProvider(entity.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(kMargin12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    softWrap: true,
                    "",
                    maxLines: 3,
                    style: context.appFonts.customFont(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.w500,
                      color: context.appColors.whiteColor,
                    ),
                  ),
                ),
                const Spacer(),
                isFromSheet
                    ? TextButton(
                        onPressed: () {
                          onTapAdd(entity);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: context.appColors.primaryColor,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          "+ ADD",
                          style: context.appFonts.customFont(
                            fontWeight: FontWeight.w500,
                            fontSize: FontSize.s14,
                            color: context.appColors.whiteColor,
                          ),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          onTapRemove(entity);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              context.appColors.grayColor.withValues(alpha: 0.5),
                          padding: EdgeInsets.zero,
                        ),
                        icon: Icon(
                          Icons.close,
                          color: context.appColors.whiteColor,
                        ),
                      )
              ],
            ),
            const Spacer(),
            Text(
              entity.title,
              style: context.appFonts.customFont(
                fontSize: FontSize.s16,
                fontWeight: FontWeight.w600,
                color: context.appColors.whiteColor,
              ),
            ),
            const SizedBox(height: kMargin10),
            Row(
              spacing: kMargin10,
              children: [
                Icon(Icons.access_time_rounded, color: context.appColors.whiteColor),
                Text(
                  entity.readyInMinutes.toString(),
                  style: context.appFonts.customFont(
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w400,
                      color: context.appColors.whiteColor),
                ),
              ],
            ),
            Text(
              entity.extendedIngredients.map((e) => e.name).toList().join(","),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.appFonts.customFont(
                  fontSize: FontSize.s14,
                  fontWeight: FontWeight.w400,
                  color: context.appColors.whiteColor),
            )
          ],
        ),
      ),
    );
  }
}

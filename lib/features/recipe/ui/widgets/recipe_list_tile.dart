import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe/routes/app_route.dart';

import '../../../../core/core.dart';

class RecipeListTile extends StatelessWidget {
  const RecipeListTile({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.owner,
    required this.title,
    required this.likeCount,
    required this.time,
    required this.ingredients,
  });

  final String id;
  final String imageUrl;
  final String owner;
  final String title;
  final int likeCount;
  final String time;
  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(RecipeDetailRoute(id: id));
      },
      child: Container(
        height: 180,
        margin: const EdgeInsets.symmetric(
          horizontal: kMargin16,
          vertical: kMargin6,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: kMargin16,
          vertical: kMargin16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              context.appColors.grayColor.withValues(alpha: 0.5),
              BlendMode.darken,
            ),
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(kMargin12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  owner,
                  style: context.appFonts.customFont(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.w500,
                    color: context.appColors.whiteColor,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.thumb_up_off_alt_rounded,
                  color: context.appColors.primaryColor,
                ),
                const SizedBox(width: kMargin6),
                Text(
                  likeCount.toString(),
                  style: context.appFonts.customFont(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.w600,
                    color: context.appColors.whiteColor,
                  ),
                )
              ],
            ),
            const Spacer(),
            Text(
              title,
              style: context.appFonts.customFont(
                fontSize: FontSize.s16,
                fontWeight: FontWeight.w600,
                color: context.appColors.whiteColor,
              ),
            ),
            const SizedBox(height: kMargin10),
            if (time.isNotEmpty)
              Row(
                spacing: kMargin10,
                children: [
                  Icon(Icons.access_time_rounded, color: context.appColors.whiteColor),
                  Text(
                    time,
                    style: context.appFonts.customFont(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                        color: context.appColors.whiteColor),
                  ),
                ],
              ),
            if (ingredients.isNotEmpty)
              Text(
                ingredients.join(","),
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

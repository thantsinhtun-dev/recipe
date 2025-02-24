import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe/core/core.dart';
import 'package:recipe/features/recipe/ui/screens/recipe_detail_screen.dart';
import 'package:recipe/features/recipe/ui/screens/search_recipe_screen.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeAppBarWidget(
            onTapSearch: () {
              context.router.pushWidget(const SearchRecipeScreen());
            },
          ),
          const HomeBodyWidget(),
        ],
      ),
    );
  }
}

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppStrings.mealTypes.length,
              itemBuilder: (BuildContext context, int index) {
                var item = AppStrings.mealTypes[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kMargin16,
                    vertical: kMargin4,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: kMargin6),
                  decoration: BoxDecoration(
                    color: context.appColors.primaryColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(kMargin12),
                  ),
                  child: Center(
                    child: Text(
                      item,
                      style: context.appFonts.customFont(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w500,
                        color: context.appColors.primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    context.router.pushWidget(RecipeDetailScreen(id: "663559",));
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
                        image: const CachedNetworkImageProvider(
                          "https://img.spoonacular.com/recipes/657167-556x370.jpg",
                        ),
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
                              "Foodista",
                              style: context.appFonts.customFont(
                                fontSize: FontSize.s16,
                                fontWeight: FontWeight.w500,
                                color: context.appColors.whiteColor,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              AppImages.icTabFavourite,
                              width: 24,
                              color: const Color(0xffe31b23).withValues(alpha: 0.8),
                              // color: context.appColors.primaryColor.withValues(alpha: 0.8),
                            ),
                            const SizedBox(width: kMargin6),
                            Text(
                              "4",
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
                          "Garlicky Kale",
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
                            Icon(Icons.access_time_rounded,
                                color: context.appColors.whiteColor),
                            Text(
                              "45 min",
                              style: context.appFonts.customFont(
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeight.w400,
                                  color: context.appColors.whiteColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key, required this.onTapSearch});

  final Function() onTapSearch;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: kMargin12,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Mark",
                    style: context.appFonts.customFont(
                        fontSize: FontSize.s20,
                        fontWeight: FontWeight.w600,
                        color: context.appColors.primaryColor),
                  ),
                  Text(
                    "What you want to cook today?",
                    style: context.appFonts.customFont(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.w500,
                      color: context.appColors.grayColor.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CachedNetworkImage(
                imageUrl:
                    "https://images.unsplash.com/flagged/photo-1573603867003-89f5fd7a7576?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YnVzaW5lc3MlMjBtYW58ZW58MHx8MHx8fDA%3D",
                imageBuilder: (context, imageProvider) => Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
          TextFormField(
            readOnly: true,
            onTap: () {
              onTapSearch();
            },
            style: context.appFonts.customFont(
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(kMargin12),
                ),
              ),
              filled: true,
              fillColor: context.appColors.grayColor.withValues(alpha: 0.2),
              hintText: "Search by recipes (eg.carrots,tomatoes)",
              hintStyle: context.appFonts.customFont(
                  fontSize: FontSize.s14,
                  fontWeight: FontWeight.w400,
                  color: context.appColors.grayColor.withValues(alpha: 0.5)),
              prefixIcon: Image.asset(
                AppImages.icSearch,
                scale: 1.2,
                color: context.appColors.grayColor.withValues(alpha: 0.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

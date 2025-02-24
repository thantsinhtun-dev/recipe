import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/core/core.dart';
import 'package:recipe/features/recipe/ui/providers/home_provider.dart';
import 'package:recipe/features/recipe/ui/screens/recipe_detail_screen.dart';
import 'package:recipe/features/recipe/ui/screens/search_recipe_screen.dart';
import 'package:recipe/features/recipe/ui/widgets/recipe_detail_body.dart';
import 'package:recipe/shared/extenstions/ext_widget.dart';

import '../widgets/recipe_list_tile.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).initHomeRecipe();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeAppBarWidget(
            onTapSearch: () {
              context.router.pushWidget(const SearchRecipeScreen());
            },
          ).paddingSymmetric(horizontal: kMargin16),
          const HomeBodyWidget(),
        ],
      ),
    );
  }
}

class HomeBodyWidget extends ConsumerWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeState = ref.watch(homeProvider);
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: kMargin12),
              scrollDirection: Axis.horizontal,
              itemCount: homeState.mealTypes.length,
              itemBuilder: (BuildContext context, int index) {
                var item = homeState.mealTypes[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(kMargin12),
                  splashColor: context.appColors.primaryColor.withValues(alpha: 0.2),
                  highlightColor: context.appColors.primaryColor.withValues(alpha: 0.2),
                  onTap: () {
                    ref.read(homeProvider.notifier).changeMealType(item);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kMargin16,
                      vertical: kMargin4,
                    ),
                    decoration: BoxDecoration(
                      color: item == homeState.currentMealType
                          ? context.appColors.primaryColor.withValues(alpha: 0.2)
                          : context.appColors.grayColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(kMargin12),
                    ),
                    child: Center(
                      child: Text(
                        item,
                        style: context.appFonts.customFont(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w500,
                          color: item == homeState.currentMealType
                              ? context.appColors.primaryColor
                              : context.appColors.grayColor,
                        ),
                      ),
                    ),
                  ),
                ).paddingSymmetric(horizontal: kMargin6);
              },
            ),
          ).paddingSymmetric(vertical: kMargin16),
          Expanded(
            child: homeState.status == HomeProviderStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: homeState.recipes.length,
                    itemBuilder: (context, index) {
                      var item = homeState.recipes[index];
                      return RecipeListTile(
                        id: item.id,
                        imageUrl: item.image,
                        owner: "",
                        title: item.title,
                        likeCount: item.aggregateLikes,
                        time: item.readyInMinutes.toString(),
                        ingredients: item.extendedIngredients.map((e)=>e.name).toList(),
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

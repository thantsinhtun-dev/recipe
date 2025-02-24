import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/core/core.dart';
import '../providers/recipe_detail_provider.dart';
import '../widgets/recipe_detail_body.dart';

@RoutePage()
class RecipeDetailScreen extends ConsumerStatefulWidget {
  const RecipeDetailScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends ConsumerState<RecipeDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(recipeDetailProvider.notifier).getRecipeDetail(widget.id.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var recipeDetailState = ref.watch(recipeDetailProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Receipt',
          style: context.appFonts.customFont(
            fontWeight: FontWeight.w500,
            fontSize: FontSize.s20,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          if (recipeDetailState.status == RecipeDetailStatus.success)
            IconButton(
              onPressed: () {
                ref.read(recipeDetailProvider.notifier).toggleFavorite();
              },
              icon: Icon(
                recipeDetailState.entity?.isFavourite == false
                    ? Icons.favorite_border_rounded
                    : Icons.favorite_rounded,
                color: context.appColors.primaryColor,
              ),
            )
        ],
      ),
      body: switch (recipeDetailState.status) {
        RecipeDetailStatus.initial => const SizedBox(),
        RecipeDetailStatus.loading => const Center(child: CircularProgressIndicator()),
        RecipeDetailStatus.success => const RecipeDetailBody(),
        RecipeDetailStatus.error => Column(
            children: [
              Image.asset(AppImages.icItemNotFound),
              Text(
                recipeDetailState.msg,
                style: context.appFonts.customFont(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
      },
    );
  }
}

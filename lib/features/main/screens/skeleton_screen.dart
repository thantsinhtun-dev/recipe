import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../routes/app_route.dart';

@RoutePage()
class SkeletonScreen extends StatelessWidget {
  const SkeletonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false,
      routes: const [
        HomeRoute(),
        FavouriteRoute(),
        MealPlanRoute(),
      ],
      // homeIndex: 3,
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0.6,
          selectedFontSize: 12,
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
          },
          selectedItemColor: context.appColors.primaryColor,
          unselectedItemColor: context.appColors.blackColor,
          items: [
            BottomNavigationBarItem(
              label: AppStrings.lblTabHome,
              icon: Image.asset(AppImages.icTabHome, width: 24),
              activeIcon: Image.asset(AppImages.icTabHome, width: 24, color: context.appColors.primaryColor),
            ),
            BottomNavigationBarItem(
              label: AppStrings.lblTabFavourite,
              icon: Image.asset(AppImages.icTabFavourite, width: 24),
              activeIcon: Image.asset(AppImages.icTabFavourite, width: 24, color: context.appColors.primaryColor),
            ),
            BottomNavigationBarItem(
              label: AppStrings.lblTabMealPlan,
              icon: Image.asset(AppImages.icTabMealPlan, width: 24),
              activeIcon: Image.asset(AppImages.icTabMealPlan, width: 24, color: context.appColors.primaryColor),
            ),

          ],
        );
      },
    );
  }
}

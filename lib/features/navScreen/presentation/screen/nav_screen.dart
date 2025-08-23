import 'package:earn_watching_ads/core/themes/app_colors.dart';
import 'package:earn_watching_ads/features/homeScreen/presentation/screens/home_screen.dart';
import 'package:earn_watching_ads/features/navScreen/bloc/nav_bloc.dart';
import 'package:earn_watching_ads/features/profileScreen/presentation/screens/profile_setting.dart';
import 'package:earn_watching_ads/features/withdrawScreen/presentation/withdraw_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const WithdrawScreen(),
    const ProfileSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        final int currentIndex = state.selectedIndex;

        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: currentIndex,
            destinations: _navigationDestination(currentIndex),
            backgroundColor: AppColors.navBarBackgroundColor,
            indicatorColor: AppColors.appbarBackgroundColor,
            animationDuration: const Duration(milliseconds: 1000),
            onDestinationSelected: (index) {
              context.read<NavBloc>().add(
                NavigationDestinationButtonClicked(index),
              );
            },
          ),
        );
      },
    );
  }

  // * NAVIGATION DESTINATION
  List<NavigationDestination> _navigationDestination(int selectedIndex) {
    return [
      NavigationDestination(
        icon: Icon(
          Icons.home,
          color: selectedIndex == 0
              ? AppColors
                    .navBarBackgroundColor // ✅ active
              : AppColors.appPrimaryColor, // inactive
        ),
        label: "Home",
      ),
      NavigationDestination(
        icon: Icon(
          Icons.money,
          color: selectedIndex == 1
              ? AppColors
                    .navBarBackgroundColor // ✅ active
              : AppColors.appPrimaryColor, // inactive
        ),
        label: "Withdraw",
      ),
      NavigationDestination(
        icon: Icon(
          Icons.settings,
          color: selectedIndex == 2
              ? AppColors
                    .navBarBackgroundColor // ✅ active
              : AppColors.appPrimaryColor, // inactive
        ),
        label: "Profile",
      ),
    ];
  }
}

import 'package:earn_watching_ads/core/utils/app_routes.dart';
import 'package:earn_watching_ads/features/authscreen/presentation/widgets/lodaing.dart';
import 'package:earn_watching_ads/features/homeScreen/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is HomeLogOutState) {
          context.goNamed(AppRoutes.loginRouteName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: (state is HomeLoadingState)
                ? Loading()
                : ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(HomeLogOutEvent());
                    },
                    child: Text("log out"),
                  ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matspar/logic/cubit/bookmark_cubit.dart';
import 'package:matspar/logic/cubit/home_cubit.dart';
import 'package:matspar/screens/bookmarks-screen/bookmark-screen.dart';
import 'package:matspar/screens/home-widgets/home-content.dart';
import 'package:matspar/screens/search-screen/search-screen.dart';
import 'package:matspar/styles/text-styles.dart';
import 'package:matspar/utils/error-screen.dart';
import 'package:matspar/utils/loading-screen.dart';
import 'package:matspar/utils/network-error.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Matspar",
          style: DamiText.appbarTitle,
        ),
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookmarkScreen()));
              },
              icon: const Icon(Icons.bookmark_border)),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLoaded) {
            return HomeContent(products: state.products);
          } else if (state is HomeLoading) {
            return const LoadingScreen();
          } else if (state is HomeError) {
            return const ErrorScreen();
          } else {
            return const NetworkErrorScreen();
          }
        },
      ),
    );
  }
}

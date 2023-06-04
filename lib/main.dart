import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matspar/logic/cubit/bookmark_cubit.dart';
import 'package:matspar/logic/cubit/home_cubit.dart';
import 'package:matspar/logic/cubit/search_cubit.dart';
import 'package:matspar/screens/home-screen.dart';
import 'package:matspar/screens/search-screen/search-screen.dart';
import 'package:matspar/styles/app-theme.dart';
import 'package:matspar/utils/browser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => BookmarkCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        title: 'Matspar',
        theme: MatsperTheme.appThemeData,
        // home: const SearchScreen(),
        home: const HomeScreen(),
      ),
    );
  }
}

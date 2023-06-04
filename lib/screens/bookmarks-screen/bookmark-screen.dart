import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matspar/logic/cubit/bookmark_cubit.dart';
import 'package:matspar/screens/bookmarks-screen/bookmark-list.dart';
import 'package:matspar/screens/home-widgets/home-content.dart';
import 'package:matspar/screens/home-widgets/product-card.dart';
import 'package:matspar/styles/text-styles.dart';
import 'package:matspar/utils/loading-screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks', style: DamiText.appbarTitle),
      ),
      body: BlocConsumer<BookmarkCubit, BookmarkState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is BookmarkLoaded) {
            return BookmarkList(
              products: state.bookmarks,
            );
          } else if (state is BookmarkLoading) {
            return LoadingScreen();
          } else {
            return LoadingScreen();
          }
        },
      ),
    );
  }
}

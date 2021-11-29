import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist_basic/screen/categoreis_screen.dart';
import 'package:watchlist_basic/strings.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  static const List<Widget> name = [
    CategoriesScreen(),
    CategoriesScreen(),
    CategoriesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Strings.name.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.Apptitle),
          bottom: const TabBar(
            tabs: Strings.name,
          ),
        ),
        body: const TabBarView(
          children: name,
        ),
      ),
    );
  }
}

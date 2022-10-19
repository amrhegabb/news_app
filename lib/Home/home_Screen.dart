import 'package:flutter/material.dart';
import 'package:news_app/Category/categories_Fragment.dart';
import 'package:news_app/Category/category_Item.dart';
import 'package:news_app/Home/home_Drawer.dart';
import 'package:news_app/Settings/settings_Fragment.dart';
import 'package:news_app/apiManager.dart';
import 'package:news_app/news/newsWidgit.dart';
import 'package:news_app/news/news_fragment.dart';

import '../model/newsResponse.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    currentWidget = CategoriesFragment(oncategoryclick: onCategoryClick);
    print(currentWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/pattern.png",
          ),
        ),
      ),
      child: Scaffold(
        drawer: Drawer(
          child: HomeDrawer(onsideMenueItemClick),
        ),
        appBar: AppBar(
          title: const Text(
            "NewsApp",
          ),
          actions: [
            currentWidget.toString() == "NewsFragment"
                ? IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: NewsSearchDeleget());
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ))
                : Container(),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: currentWidget,
      ),
    );
  }

  late Widget currentWidget;
  void onCategoryClick(CategoryItem categoryItem) {
    setState(() {
      currentWidget = NewsFragment(
        categoryItem: categoryItem,
      );
    });
  }

  void onsideMenueItemClick(int tybe) {
    Navigator.pop(context);
    if (tybe == HomeDrawer.category) {
      setState(() {
        currentWidget = CategoriesFragment(
          oncategoryclick: onCategoryClick,
        );
      });
    } else if (tybe == HomeDrawer.settings) {
      setState(() {
        currentWidget = const SettingFragment();
      });
    }
  }
}

class NewsSearchDeleget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySource(query: query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data;
          if (data?.code == "error") {
            return Center(child: Text("${data?.message}"));
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return NewsWidgit(data!.NewsList![index]);
            },
            itemCount: data!.NewsList!.length,
            separatorBuilder: (context, index) => const Divider(
              thickness: 3,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
            child: Text(
          "Your Suggetions here",
          style: Theme.of(context).textTheme.headline6,
        )));
  }
}

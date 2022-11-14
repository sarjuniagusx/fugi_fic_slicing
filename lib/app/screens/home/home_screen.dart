import 'package:flutter/material.dart';
import 'package:fugi_fic_slicing_furniture/app/data/fake.dart';
import 'package:fugi_fic_slicing_furniture/app/screens/category/category_screen.dart';
import 'package:fugi_fic_slicing_furniture/app/screens/category/widgets/furniture_grid_item.dart';
import 'package:fugi_fic_slicing_furniture/app/screens/home/widgets/category_card.dart';
import 'package:fugi_fic_slicing_furniture/app/screens/home/widgets/category_selector.dart';
import 'package:fugi_fic_slicing_furniture/app/screens/home/widgets/header.dart';
import 'package:fugi_fic_slicing_furniture/app/screens/home/widgets/section.dart';
import 'package:fugi_fic_slicing_furniture/app/screens/product_detail/product_detail_screen.dart';
import 'package:fugi_fic_slicing_furniture/app/widgets/app_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool tags = false;

  onCategorySelected(category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(),
      ),
    );
  }

  onCategoryDetailSelected(categoryDetail) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          1,
          Fake().popularList[0]["image"],
          Fake().popularList[0]["price"],
          tags = true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                  //close drawer, if drawer is open
                } else {
                  scaffoldKey.currentState!.openDrawer();
                  //open drawer, if drawer is closed
                }
              },
            );
          }),
          centerTitle: true,
          title: const Text(
            "Home",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: AppBottomNavigation(),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                      // color: Colors.blue,
                      ),
                  child: Column(children: const [
                    CircleAvatar(
                      radius: 52,
                      backgroundImage:
                          ExactAssetImage('assets/images/ic_profile.png'),
                    )
                  ]),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                  title: const Text('Home'),
                  onTap: () {
                    //close the drawer
                    Navigator.pop(context);
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //   builder: (context) => (),
                    // ),
                    // );
                  },
                ),
                // const Divider(color: Colors.black),
                ListTile(
                  leading: const Icon(
                    Icons.sell_rounded,
                    size: 24.0,
                  ),
                  title: const Text('Best Seller'),
                  onTap: () {
                    //close the drawer
                    Navigator.pop(context);
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //   builder: (context) => (),
                    // ),
                    // );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout_outlined,
                    size: 24.0,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    // close the drawer
                    Navigator.pop(context);
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //   builder: (context) => (),
                    // ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Header(),
                const CategorySelector(),
                Section(
                  'Recommended Furnitures',
                  Fake.categories.map((c) {
                    return CategoryCard(
                      title: c.title,
                      iconPath: c.iconPath,
                      onTap: () {
                        onCategorySelected(c);
                      },
                    );
                  }).toList(),
                ),
              ]),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.80,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: Fake.furniture.asMap().entries.map((f) {
                return FurnitureGridItem(
                    item: f.value,
                    onTap: () {
                      onCategoryDetailSelected(f);
                    },
                    margin: EdgeInsets.only(
                      left: f.key.isEven ? 20 : 0,
                      right: f.key.isOdd ? 20 : 0,
                    ));
              }).toList(),
            )
          ],
        ));
  }
}

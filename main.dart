import 'package:depi/sessions_tasks/ApplyingInteractivity.dart';
import 'package:depi/sessions_tasks/Drag_and_Drop_App.dart';
import 'package:depi/sessions_tasks/GridVeiw.dart';
import 'package:depi/sessions_tasks/TaskTracker.dart';
import 'package:depi/sessions_tasks/bottom_navigation_bar/Controller.dart';
import 'package:depi/sessions_tasks/navigator.dart' show MyNavigator;
import 'package:depi/sessions_tasks/provider_task/catalog.dart';
import 'package:depi/task_2/grid_view.dart';
import 'package:depi/task_3/Grid.dart';
import 'package:depi/task_3/my_grid_enhanced.dart';
import 'package:depi/task_4/catalog.dart';
import 'package:depi/test_1/Home.dart';
import 'package:depi/test_1/advanced_profile_card.dart';
import 'package:depi/test_1/burger.dart';
import 'package:depi/test_1/landscape.dart';
import 'package:depi/test_1/login.dart';
import 'package:depi/test_1/music_player.dart';
import 'package:flutter/material.dart';
import 'package:depi/task_0/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => CardModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      // ),
      home: CatalogTask(),
    );
  }
}

class CardModel extends ChangeNotifier {
  int counter = 0;
  List MyList = [
    {
      'name': 'Wireless Headphones',
      'price': '99.99',
      'isFavorite': false,
      'isAdded': false,
    },
    {
      'name': 'Smart Watch',
      'price': '199.99',
      'isFavorite': false,
      'isAdded': false,
    },
    {
      'name': 'Portable Charger',
      'price': '39.99',
      'isFavorite': false,
      'isAdded': false,
    },
    {
      'name': 'Bluetooth Speaker',
      'price': '79.99',
      'isFavorite': false,
      'isAdded': false,
    },
    {
      'name': 'Fitness Tracher',
      'price': '59.99',
      'isFavorite': false,
      'isAdded': false,
    },
  ];
  List CardList = [];
  List FavoriteList = [];

  double totalPrice = 0;
  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    MyList[index]['isFavorite'] = !MyList[index]['isFavorite'];
    FavoriteList.clear();
    favoriteList();
    notifyListeners();
  }

  void addCardList(int index) {
    CardList.add(MyList[index]);
    totalPrice += (double.parse(MyList[index]['price']));
    notifyListeners();
  }

  void deleteCardList(int index) {
    CardList.removeAt(index);
    totalPrice += (double.parse(MyList[index]['price']));
    decrement();
    notifyListeners();
  }

  void favoriteList() {
    for (var element in MyList) {
      if (element['isFavorite']) FavoriteList.add(element);
    }
  }

  void clearCardList() {
    CardList.clear();
    counter=0;
    notifyListeners();
  }
}

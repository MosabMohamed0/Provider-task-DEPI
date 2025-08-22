import 'package:depi/main.dart';
import 'package:depi/task_4/Cart.dart';
import 'package:depi/task_4/favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogTask extends StatelessWidget {
  const CatalogTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Favorite(),));
          }, icon: const Icon(Icons.favorite)),
          Stack(
            children: [
              Consumer<CardModel>(
                builder: (context, cardModel, __) {
                  return CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      cardModel.counter.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CatalogCard()));
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) => Card(
            color: Colors.teal,
            shadowColor: Colors.black,
            elevation: 4,
            child: ListTile(
              leading: Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white,
                size: 35,
              ),
              title: Consumer<CardModel>(
                builder: (context, CardModel, __) {
                  return Text(
                    CardModel.MyList[index]['name'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              subtitle: Consumer<CardModel>(
                builder: (context, CardModel, __) {
                  return Text(
                    CardModel.MyList[index]['price'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer<CardModel>(
                    builder: (context, Cardmodel, __) {
                      return IconButton(
                        onPressed: () {
                          Provider.of<CardModel>(
                            context,
                            listen: false,
                          ).toggleFavorite(index);
                        },
                        icon: Cardmodel.MyList[index]['isFavorite']
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border, color: Colors.white),
                      );
                    },
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      Provider.of<CardModel>(
                        context,
                        listen: false,
                      ).increment();
                      Provider.of<CardModel>(
                        context,
                        listen: false,
                      ).addCardList(index);
                    },
                    icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}

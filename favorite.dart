import 'package:depi/main.dart';
import 'package:depi/task_4/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CatalogCard()),
              );
            },
            icon: Icon(Icons.shopping_cart_checkout),
          ),
        ],
      ),
      body: Consumer<CardModel>(
        builder: (context, cardModel, _) {
          return cardModel.FavoriteList.isEmpty
              ? Center(
                  child: Icon(Icons.favorite, size: 100, color: Colors.red),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) => Card(
                    color: Colors.teal,
                    shadowColor: Colors.black,
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                      title: Consumer<CardModel>(
                        builder: (context, cardModel, __) {
                          return Text(
                            cardModel.FavoriteList[index]['name'],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      subtitle: Consumer<CardModel>(
                        builder: (context, cardModel, __) {
                          return Text(
                            cardModel.FavoriteList[index]['price'],
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
                                icon:
                                    Cardmodel.FavoriteList[index]['isFavorite']
                                    ? Icon(Icons.delete, color: Colors.white)
                                    : Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
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
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: cardModel.FavoriteList.length,
                );
        },
      ),
    );
  }
}

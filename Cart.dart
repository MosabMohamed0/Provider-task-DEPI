import 'package:depi/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogCard extends StatelessWidget {
  const CatalogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart"), centerTitle: true),
      body: Consumer<CardModel>(
        builder: (context, cardModel, __) {
          return cardModel.CardList.isEmpty
              ? const Center(child: Icon(Icons.shopping_cart, size: 80))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cardModel.CardList.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(cardModel.CardList[index]['name']),
                          trailing: IconButton(
                            onPressed: () {
                              Provider.of<CardModel>(
                                context,
                                listen: false,
                              ).deleteCardList(index);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Item deleted "),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Total : \$${cardModel.totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Order placed successfully"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Provider.of<CardModel>(
                          context,
                          listen: false,
                        ).clearCardList();
                      },
                      child: const Text("Checkout"),
                    ),
                    const SizedBox(height: 30),
                  ],
                );
        },
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pizzahut_submission/model/pizza.dart';

class DetailMenu extends StatelessWidget {
  final PizzaHut pizza;

  const DetailMenu({Key? key, required this.pizza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DetailMenuMobile(pizza: pizza);
      },
    );
  }
}

// Mobile
class DetailMenuMobile extends StatelessWidget {
  final PizzaHut pizza;
  const DetailMenuMobile({Key? key, required this.pizza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Image.asset(pizza.gambar,
                  width: MediaQuery.of(context).size.width * 100),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 211, 67),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(239, 248, 246, 246),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      FavoriteButton(
                        pizza: pizza,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              pizza.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Icon(Icons.food_bank_outlined),
                    const SizedBox(height: 8.0),
                    Text(pizza.kategori)
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.money_outlined),
                    const SizedBox(height: 8.0),
                    Text('Rp. ${pizza.harga.toDouble().toString()}')
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              pizza.deskripsi,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 230, 202, 254),
              shape: BoxShape.rectangle,
            ),
            padding: const EdgeInsets.only(top: 3, bottom: 3),
            child: Column(
              children: [
                const Text(
                  "Coba juga menu lainnya..",
                  style: TextStyle(color: Colors.black87),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: PizzaHutList.map((e) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailMenuMobile(pizza: e);
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(e.gambar),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Favorite List
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 230, 202, 254),
              shape: BoxShape.rectangle,
            ),
            padding: const EdgeInsets.only(top: 3, bottom: 3),
            child: Column(
              children: [
                const Text(
                  "Menu Favorite",
                  style: TextStyle(color: Colors.black87),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: SizedBox(
                    height: 150,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: PizzaHutList.map((element) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailMenuMobile(pizza: element);
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(element.gambar),
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class FavoriteButton extends StatefulWidget {
  final PizzaHut pizza;
  const FavoriteButton({Key? key, required this.pizza}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState(pizza: pizza);
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  final PizzaHut pizza;
  _FavoriteButtonState({Key? key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(pizza.fav == true ? Icons.favorite : Icons.favorite_border,
          color: Colors.red),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
          pizza.fav = !pizza.fav;
        });
      },
    );
  }
}

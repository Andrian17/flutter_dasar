import 'package:flutter/material.dart';
import 'package:pizzahut_submission/src/all_menu_screen.dart';
import 'package:pizzahut_submission/model/pizza.dart';
import 'package:pizzahut_submission/src/makanan_screen.dart';
import 'package:pizzahut_submission/src/minuman_screen.dart';

import 'src/detail_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Hut'),
        backgroundColor: const Color.fromARGB(222, 255, 65, 27),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return const HomeScreenMobile();
          } else if (constraints.maxWidth <= 1200) {
            return HomeScreenPage(
              gridCount: 2,
            );
          } else {
            return HomeScreenPage(
              gridCount: 2,
            );
          }
        },
      ),
    );
  }
}

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const AllMenu();
                        },
                      ));
                    },
                    child: const Text(
                      "All Menu",
                      style: TextStyle(fontSize: 22),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Makanan();
                        },
                      ));
                    },
                    child:
                        const Text("Makanan", style: TextStyle(fontSize: 22))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const MinumanScreen();
                        },
                      ));
                    },
                    child:
                        const Text("Minuman", style: TextStyle(fontSize: 22))),
              ),
            ],
          ),
          Card(
            child: Column(
              children: [
                const Text(
                  "Hot",
                  style: TextStyle(fontSize: 22),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: (() {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                final PizzaHut pizza = PizzaHutList[3];
                                return DetailMenu(pizza: pizza);
                              },
                            ));
                          }),
                          child: Image.asset(
                            PizzaHutList[3].gambar,
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              PizzaHutList[3].nama,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Rp. ${PizzaHutList[3].harga.toDouble()}',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                const Text(
                  "Hot",
                  style: TextStyle(fontSize: 22),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              final PizzaHut pizza =
                                  PizzaHutList[PizzaHutList.length - 1];
                              return DetailMenu(pizza: pizza);
                            },
                          ));
                        }),
                        child: Image.asset(
                            PizzaHutList[PizzaHutList.length - 1].gambar,
                            height: 240),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              PizzaHutList[PizzaHutList.length - 1].nama,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Rp. ${PizzaHutList[PizzaHutList.length - 1].harga.toDouble()}',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenPage extends StatelessWidget {
  final PizzaHut pizza = PizzaHutList[3];
  final int gridCount;
  HomeScreenPage({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const AllMenu();
                        },
                      ));
                    },
                    child: const Text(
                      "All Menu",
                      style: TextStyle(fontSize: 22),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Makanan();
                        },
                      ));
                    },
                    child:
                        const Text("Makanan", style: TextStyle(fontSize: 22))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const MinumanScreen();
                        },
                      ));
                    },
                    child:
                        const Text("Minuman", style: TextStyle(fontSize: 22))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

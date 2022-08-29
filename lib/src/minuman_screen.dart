import 'package:flutter/material.dart';

import 'detail_menu.dart';
import '../model/pizza.dart';

class MinumanScreen extends StatelessWidget {
  const MinumanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minuman'),
        backgroundColor: const Color.fromARGB(244, 255, 128, 49),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return const MinumanList();
          } else if (constraints.maxWidth <= 1200) {
            return const MinumanGrid(gridCount: 2);
          } else {
            return const MinumanGrid(gridCount: 4);
          }
        },
      ),
    );
  }
}

class MinumanList extends StatelessWidget {
  const MinumanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children:
              PizzaHutList.where((element) => element.kategori == 'minuman')
                  .map((menu) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailMenu(pizza: menu);
                  },
                ));
              },
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(menu.gambar),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menu.nama,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(menu.kategori)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }
}

class MinumanGrid extends StatelessWidget {
  final int gridCount;
  const MinumanGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: PizzaHutList.where((element) => element.kategori == "minuman")
            .map((pizza) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailMenu(pizza: pizza);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      pizza.gambar,
                      // fit: BoxFit.cover,
                      // height: MediaQuery.of(context).size.width * 100,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      pizza.nama,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      pizza.kategori,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

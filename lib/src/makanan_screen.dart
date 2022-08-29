import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut_submission/src/detail_menu.dart';
import 'package:pizzahut_submission/model/pizza.dart';

class Makanan extends StatelessWidget {
  const Makanan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makanan'),
        backgroundColor: const Color.fromARGB(244, 255, 128, 49),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return const MakananList();
          } else if (constraints.maxWidth <= 1200) {
            return const MakananGrid(gridCount: 4);
          } else {
            return const MakananGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

class MakananList extends StatelessWidget {
  const MakananList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children:
              PizzaHutList.where((element) => element.kategori != 'minuman')
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

class MakananGrid extends StatelessWidget {
  final int gridCount;
  const MakananGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: PizzaHutList.where((element) => element.kategori != "minuman")
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
                      fit: BoxFit.cover,
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

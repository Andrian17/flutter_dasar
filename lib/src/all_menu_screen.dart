import 'package:flutter/material.dart';
import 'package:pizzahut_submission/src/detail_menu.dart';
import 'package:pizzahut_submission/model/pizza.dart';

class AllMenu extends StatelessWidget {
  const AllMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Menu'),
          backgroundColor: const Color.fromARGB(244, 255, 128, 49),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return const AllMenuList();
            } else if (constraints.maxWidth <= 1200) {
              return const AllMenuGrid(gridCount: 4);
            } else {
              return const AllMenuGrid(gridCount: 6);
            }
          },
        ));
  }
}

// Untuk Mobile
class AllMenuList extends StatelessWidget {
  const AllMenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final PizzaHut pizza = PizzaHutList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailMenu(pizza: pizza);
                },
              ));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(pizza.gambar),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pizza.nama,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(pizza.kategori)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: PizzaHutList.length,
      ),
    );
  }
}

// Untuk Web
class AllMenuGrid extends StatelessWidget {
  final int gridCount;
  const AllMenuGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: PizzaHutList.map((pizza) {
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut_submission/model/pizza.dart';

import 'detail_menu.dart';
import 'package:intl/intl.dart';

class DetailMenuPage extends StatefulWidget {
  final PizzaHut pizza;

  const DetailMenuPage({Key? key, required this.pizza}) : super(key: key);

  @override
  _DetailMenuPage createState() => _DetailMenuPage(pizza: pizza);
}

class _DetailMenuPage extends State<DetailMenuPage> {
  final _scrollController = ScrollController();
  final PizzaHut pizza;
  final formatRupiah = NumberFormat.simpleCurrency(
    locale: 'id_ID',
    decimalDigits: 2,
  );
  _DetailMenuPage({Key? key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: kIsWeb ? null : AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
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
                          Text(
                            pizza.nama,
                            style: const TextStyle(
                              fontFamily: 'Staatliches',
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 64,
                ),
                child: Center(
                  child: SizedBox(
                    width: screenWidth <= 1200 ? 800 : 1200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 32),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      widget.pizza.gambar,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                      "Coba Juga Menu lainnya dari kami.."),
                                  Scrollbar(
                                    controller: _scrollController,
                                    // scrollbarOrientation: ,
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 150,
                                            padding: const EdgeInsets.only(
                                                bottom: 16),
                                            child: ListView(
                                              controller: _scrollController,
                                              scrollDirection: Axis.horizontal,
                                              children:
                                                  PizzaHutList.map((pizza) {
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                      builder: (context) {
                                                        return DetailMenu(
                                                          pizza: pizza,
                                                        );
                                                      },
                                                    ));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.asset(
                                                          pizza.gambar),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            )),
                                      ],
                                    ),
                                  ),
                                  const Text("Menu Favorite"),
                                  Scrollbar(
                                    controller: _scrollController,
                                    // scrollbarOrientation: ,
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 150,
                                            padding: const EdgeInsets.only(
                                                bottom: 16),
                                            child: ListView(
                                              controller: _scrollController,
                                              scrollDirection: Axis.horizontal,
                                              children: PizzaHutList.where(
                                                      (element) =>
                                                          element.fav == true)
                                                  .map((pizza) {
                                                return InkWell(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                      builder: (context) {
                                                        return DetailMenu(
                                                          pizza: pizza,
                                                        );
                                                      },
                                                    ));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.asset(
                                                          pizza.gambar),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Text(
                                        widget.pizza.nama,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 30.0,
                                          fontFamily: 'Staatliches',
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          const Icon(Icons.food_bank_rounded),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            widget.pizza.kategori,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              const Icon(Icons.money_outlined),
                                              const SizedBox(width: 8.0),
                                              Text(formatRupiah
                                                  .format(widget.pizza.harga)),
                                            ],
                                          ),
                                          FavoriteButton(pizza: pizza),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: Text(
                                          widget.pizza.deskripsi,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'Oxygen',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

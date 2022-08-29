import 'package:flutter/material.dart';
import 'package:pizzahut_submission/model/pizza.dart';
import 'package:pizzahut_submission/src/detail_menu_page.dart';

import 'detail_menu_mobile.dart';

class DetailMenu extends StatelessWidget {
  final PizzaHut pizza;

  const DetailMenu({Key? key, required this.pizza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DetailMenuPage(pizza: pizza);
        } else {
          return DetailMenuMobile(pizza: pizza);
        }
      },
    );
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

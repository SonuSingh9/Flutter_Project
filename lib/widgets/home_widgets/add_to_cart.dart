import 'package:first_app/core/store.dart';
import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    
    return VxBuilder(
      mutations: {AddMutation, RemoveMutation},
      builder: (context, _, __) {
        bool isInCart = cart.items.contains(catalog);

        return ElevatedButton(
          onPressed: () {
            if (!isInCart) {
              AddMutation(catalog);
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(context.theme.colorScheme.primary),
            shape: WidgetStateProperty.all(StadiumBorder()),
          ),
          child: isInCart
              ? Icon(Icons.done, color: Colors.greenAccent)
              : Icon(CupertinoIcons.cart_badge_plus, color: Colors.deepPurpleAccent),
        );
      },
    );
  }
}
   
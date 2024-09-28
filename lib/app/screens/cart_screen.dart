import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('ADD ITEMS'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: Image.network(cartItems.values.toList()[i].imageUrl),
          title: Text(cartItems.values.toList()[i].title),
          subtitle: Text('Price: ${cartItems.values.toList()[i].price}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              cart.removeItem(cartItems.keys.toList()[i]);
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            // Implement the "Buy" action
          },
          child: Text('BUY'),
        ),
      ),
    );
  }
}

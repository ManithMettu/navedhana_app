import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/vegetable.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class VegetableList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('vegetables').snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final vegetables = snapshot.data!.docs.map((doc) {
          return Vegetable(
            id: doc.id,
            name: doc['name'],
            imageUrl: doc['imageUrl'],
            actualPrice: doc['actualPrice'],
            sellPrice: doc['sellPrice'],
          );
        }).toList();

        return ListView.builder(
          itemCount: vegetables.length,
          itemBuilder: (ctx, i) => Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(vegetables[i].imageUrl),
              title: Text(vegetables[i].name),
              subtitle: Text(
                  'Price: ${vegetables[i].actualPrice} | Sale Price: ${vegetables[i].sellPrice}'),
              trailing: ElevatedButton(
                onPressed: () {
                  cart.addItem(
                    vegetables[i].id,
                    vegetables[i].name,
                    vegetables[i].sellPrice,
                    vegetables[i].imageUrl,
                  );
                },
                child: Text('Add to Cart'),
              ),
            ),
          ),
        );
      },
    );
  }
}

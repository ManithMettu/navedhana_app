
/*
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addBanner(String imageUrl) async {
    await _firestore.collection('banners').add({
      'imageUrl': imageUrl,
    });
  }

  Future<void> addVegetable(String title, String imageUrl, double price, double salePrice) async {
    await _firestore.collection('vegetables').add({
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'salePrice': salePrice,
    });
  }

  Stream<QuerySnapshot> getBanners() {
    return _firestore.collection('banners').snapshots();
  }

  Stream<QuerySnapshot> getVegetables() {
    return _firestore.collection('vegetables').snapshots();
  }
}

*/

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload image to Firebase Storage
  Future<String> uploadImage(String filePath, String fileName) async {
    try {
      final ref = _storage.ref().child('images/$fileName');
      final uploadTask = await ref.putFile(File(filePath));
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Image upload failed: $e');
    }
  }

  // Save vegetable metadata to Firestore
  Future<void> saveVegetable({
    required String name,
    required String imageUrl,
    required double actualPrice,
    required double sellPrice,
  }) async {
    try {
      await _firestore.collection('vegetables').add({
        'name': name,
        'imageUrl': imageUrl,
        'actualPrice': actualPrice,
        'sellPrice': sellPrice,
      });
    } catch (e) {
      throw Exception('Saving vegetable data failed: $e');
    }
  }

  // Save banner metadata to Firestore
  Future<void> saveBanner({
    required String imageUrl,
  }) async {
    try {
      await _firestore.collection('banners').add({
        'imageUrl': imageUrl,
      });
    } catch (e) {
      throw Exception('Saving banner data failed: $e');
    }
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ApiData {
  List radioStations = [];
  final CollectionReference collectionRef =
  FirebaseFirestore.instance.collection("radio_stations");
   Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          radioStations.add(result.data());
        }
      });
      return radioStations;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }
}
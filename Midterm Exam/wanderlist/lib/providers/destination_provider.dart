

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderlist/model/destination.dart';

class DestinationNotifier extends Notifier<List<Destination>> {

  @override
  List<Destination> build(){
    loadDestinations();
    return [];
  }

  Future<void> loadDestinations() async {
    try {
      
      final String response = await rootBundle.loadString('assets/data/bucketlist.json');
      final List<dynamic> data = json.decode(response);

      state = data.map((json) => Destination.fromJson(json)).toList();
      print("loadedList");
    } catch (e) {
      print('Error loading bucketList.json: $e');
      state = []; 
    }
  }

  Destination getDestinationById(String id) {
    return state.firstWhere((destination) => destination.id == id, orElse: () => throw Exception('invoice not found'));
  }

}

final destinationProvider = NotifierProvider<DestinationNotifier, List<Destination>>(() => DestinationNotifier());
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/saved_location.dart';

final _auth = FirebaseAuth.instance;
final _db = FirebaseFirestore.instance;

final savedLocationProvider = NotifierProvider<SavedLocationProvider, List<SavedLocation>>(SavedLocationProvider.new);
final unVisitedLocationProvider = Provider<List<SavedLocation>>((ref) {
  final savedLocations = ref.watch(savedLocationProvider);
  return savedLocations.where((location) => location.isVisited != true).toList();
});

class SavedLocationProvider extends Notifier<List<SavedLocation>> {
  StreamSubscription<QuerySnapshot>? _snapshotListener;

  @override
  List<SavedLocation> build() {
    ref.onDispose(() {
      _snapshotListener?.cancel();
    });

    if(_auth.currentUser != null) {
      startObservingSavedLocations();
    }
    return [];
  }

  void startObservingSavedLocations() {
    final userId =_auth.currentUser?.uid;
    if(userId == null) return;

    _snapshotListener?.cancel();

    _snapshotListener = _db
      .collection('saved_locations')
      .where('userId', isEqualTo: userId)
      .snapshots()
      .listen((snapshot) {
        try {
          final locations = snapshot.docs.map((doc) {
            final data = doc.data();

            return SavedLocation(
              contentId: (data['contentId'] as num?)?.toInt() ?? 0,
              contentTypeId: (data['contentTypeId'] as num?)?.toInt() ?? 0,
              title: data['title'] as String,
              address: data['address'] as String,
              image: data['image'] as String,
              latitude: (data['latitude'] as num?)?.toDouble() ?? 0.0,
              longitude: (data['longitude'] as num?)?.toDouble() ?? 0.0,
              isVisited: data['isVisited'] as bool,
              savedAt: data['savedAt'] as Timestamp?,
            );
          }).toList();

          state = locations;
        } catch(e) {
          print('Error parsing data: $e');
        }
      },
      onError: (error) {
        print('error listening to saved locations $error');
      }
    );
  }
}



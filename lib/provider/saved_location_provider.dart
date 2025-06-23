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
          final locations = snapshot.docs
              .map((doc) => SavedLocation.fromFireStore(doc.data())).toList();

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

  void updateVisitStatus(int contentId, Function(bool success, String? msg) onComplete) async {
    final userId = _auth.currentUser?.uid;
    if(userId == null) {
      onComplete(false, '로그인이 필요해요');
      return;
    }

    try {
      await _db.collection('saved_locations')
          .doc('${userId}_$contentId')
          .update({
            'isVisited': true,
            'visitedAt': FieldValue.serverTimestamp()
          });

      state = state.map((location) {
        if(location.contentId == contentId) {
          return location.copyWith(isVisited: true);
        }else {
          return location;
        }
      }).toList();

      onComplete(true, '스탬프를 찍었어요!');
    }catch(e) {
      onComplete(false, '스탬프 찍기에 실패했어요');
    }
  }
}



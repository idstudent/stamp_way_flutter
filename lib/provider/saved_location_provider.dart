import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp_way_flutter/model/save_result.dart';
import 'package:stamp_way_flutter/model/saved_location.dart';
import 'package:stamp_way_flutter/model/tour_mapper.dart';

final _auth = FirebaseAuth.instance;
final _db = FirebaseFirestore.instance;

final savedLocationProvider = NotifierProvider<SavedLocationProvider, List<SavedLocation>>(SavedLocationProvider.new);
final unVisitedLocationProvider = Provider<List<SavedLocation>>((ref) {
  final savedLocations = ref.watch(savedLocationProvider);
  return savedLocations.where((location) => location.isVisited == false).toList();
});

final visitedLocationProvider = Provider<Map<String, dynamic>>((ref) {
  final savedLocations = ref.watch(savedLocationProvider);

  final tourPlaceList = savedLocations.where((location) => location.contentTypeId == 12)
      .where((location) => location.isVisited).toList();
  final cultureList = savedLocations.where((location) => location.contentTypeId == 14)
      .where((location) => location.isVisited).toList();
  final eventsList = savedLocations.where((location) => location.contentTypeId == 15)
      .where((location) => location.isVisited).toList();
  final activityList = savedLocations.where((location) => location.contentTypeId == 28)
      .where((location) => location.isVisited).toList();
  final foodList = savedLocations.where((location) => location.contentTypeId == 39)
      .where((location) => location.isVisited).toList();

  return {
    'allList': savedLocations,
    'tourPlaceList': tourPlaceList,
    'cultureList': cultureList,
    'eventList': eventsList,
    'activityList': activityList,
    'foodList': foodList,
  };
});

final certificationCountProvider = Provider<int>((ref) {
  final visitedLocation = ref.watch(visitedLocationProvider);

  final tourList = (visitedLocation['tourPlaceList'] as List<SavedLocation>? ?? []);
  final cultureList = (visitedLocation['cultureList'] as List<SavedLocation>? ?? []);
  final eventList = (visitedLocation['eventList'] as List<SavedLocation>? ?? []);
  final activityList = (visitedLocation['activityList'] as List<SavedLocation>? ?? []);
  final foodList = (visitedLocation['foodList'] as List<SavedLocation>? ?? []);

  final tourBadges = calculateBadgeCount(tourList.length);
  final cultureBadges = calculateBadgeCount(cultureList.length);
  final eventBadges = calculateBadgeCount(eventList.length);
  final activityBadges = calculateBadgeCount(activityList.length);
  final foodBadges = calculateBadgeCount(foodList.length);

  return tourBadges + cultureBadges + eventBadges + activityBadges + foodBadges;
});

int calculateBadgeCount(int visitedCount) {
  if (visitedCount >= 50) return 3;
  if (visitedCount >= 30) return 2;
  if (visitedCount >= 10) return 1;
  return 0;
}

class SavedLocationProvider extends Notifier<List<SavedLocation>> {
  StreamSubscription<QuerySnapshot>? _snapshotListener;

  @override
  List<SavedLocation> build() {
    ref.onDispose(() {
      _snapshotListener?.cancel();
    });

    _auth.authStateChanges().listen((user) {
      if (user == null) {
        // 로그아웃되면 상태 초기화
        state = [];
        _snapshotListener?.cancel();
      } else {
        // 로그인되면 데이터 로드
        startObservingSavedLocations();
      }
    });

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

  void saveTourLocation(TourMapper tour, Function(SaveResult) onComplete) async {
    final userId = _auth.currentUser?.uid;
    if(userId == null) {
      onComplete(LoginRequired('로그인이 필요해요'));
      return;
    }

    try {
      final doc = await _db.collection('saved_locations')
          .where('userId', isEqualTo: userId)
          .where('isVisited', isEqualTo: false)
          .get();

      if(doc.docs.length >= 30) {
        onComplete(MaxLimitReached('최대 30개까지 저장 가능해요'));
        return;
      }

      await _db.collection('saved_locations')
        .doc('${userId}_${tour.contentid}')
        .set({
          'userId': userId,
          'contentId': tour.contentid,
          'contentTypeId': tour.contenttypeid,
          'title': tour.title,
          'address': tour.addr1,
          'image': tour.firstimage,
          'latitude': tour.mapy,
          'longitude': tour.mapx,
          'isVisited': false,
          'savedAt': FieldValue.serverTimestamp(),
        });

      state = [...state, SavedLocation(
        contentId: tour.contentid,
        contentTypeId: tour.contenttypeid,
        title: tour.title,
        address: tour.addr1,
        image: tour.firstimage,
        latitude: tour.mapy,
        longitude: tour.mapx,
        isVisited: false,
      )];

      onComplete(Success('장소가 저장되었어요'));
    }catch(e) {
      onComplete(Failure('저장에 실패했어요'));
    }
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

  void checkIfLocationSaved(int contentId, Function(bool) onComplete) async {
    final userId = _auth.currentUser?.uid;
    if(userId == null) {
      onComplete(false);
      return;
    }

    try {
      final docSnapshot = await _db.collection('saved_locations')
          .doc('${userId}_$contentId')
          .get();

      onComplete(docSnapshot.exists);
    }catch(e) {
      onComplete(false);
    }
  }
}



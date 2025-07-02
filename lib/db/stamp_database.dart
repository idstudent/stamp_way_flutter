import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../model/tour_mapper_entity.dart';
import 'stamp_dao.dart';

part 'stamp_database.g.dart';

@Database(version: 1, entities: [TourMapperEntity])
abstract class StampDatabase extends FloorDatabase {
  StampDao get stampDao;

  static Future<StampDatabase> getInstance() async {
    return await $FloorStampDatabase
        .databaseBuilder('stamp_db.db')
        .build();
  }
}
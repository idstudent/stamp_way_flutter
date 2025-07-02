import 'package:floor/floor.dart';
import '../model/tour_mapper_entity.dart';

@dao
abstract class StampDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertItem(TourMapperEntity item);

  @delete
  Future<void> deleteItem(TourMapperEntity item);

  @Query('SELECT * FROM stamp ORDER BY timestamp DESC')
  Stream<List<TourMapperEntity>> selectItem();

  @Query('SELECT * FROM stamp ORDER BY timestamp ASC LIMIT 1')
  Future<TourMapperEntity?> getOldestItem();
}
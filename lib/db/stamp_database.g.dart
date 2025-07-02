// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stamp_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $StampDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $StampDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $StampDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<StampDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorStampDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $StampDatabaseBuilderContract databaseBuilder(String name) =>
      _$StampDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $StampDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$StampDatabaseBuilder(null);
}

class _$StampDatabaseBuilder implements $StampDatabaseBuilderContract {
  _$StampDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $StampDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $StampDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<StampDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$StampDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$StampDatabase extends StampDatabase {
  _$StampDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StampDao? _stampDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `stamp` (`contentid` INTEGER NOT NULL, `numOfRows` INTEGER NOT NULL, `pageNo` INTEGER NOT NULL, `totalCount` INTEGER NOT NULL, `addr1` TEXT NOT NULL, `addr2` TEXT NOT NULL, `areacode` TEXT NOT NULL, `booktour` TEXT NOT NULL, `cat1` TEXT NOT NULL, `cat2` TEXT NOT NULL, `cat3` TEXT NOT NULL, `timestamp` INTEGER NOT NULL, `contenttypeid` INTEGER NOT NULL, `createdtime` TEXT NOT NULL, `dist` TEXT NOT NULL, `firstimage` TEXT NOT NULL, `firstimage2` TEXT NOT NULL, `cpyrhtDivCd` TEXT NOT NULL, `mapx` REAL NOT NULL, `mapy` REAL NOT NULL, `mlevel` TEXT NOT NULL, `modifiedtime` TEXT NOT NULL, `sigungucode` TEXT NOT NULL, `tel` TEXT NOT NULL, `title` TEXT NOT NULL, PRIMARY KEY (`contentid`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StampDao get stampDao {
    return _stampDaoInstance ??= _$StampDao(database, changeListener);
  }
}

class _$StampDao extends StampDao {
  _$StampDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _tourMapperEntityInsertionAdapter = InsertionAdapter(
            database,
            'stamp',
            (TourMapperEntity item) => <String, Object?>{
                  'contentid': item.contentid,
                  'numOfRows': item.numOfRows,
                  'pageNo': item.pageNo,
                  'totalCount': item.totalCount,
                  'addr1': item.addr1,
                  'addr2': item.addr2,
                  'areacode': item.areacode,
                  'booktour': item.booktour,
                  'cat1': item.cat1,
                  'cat2': item.cat2,
                  'cat3': item.cat3,
                  'timestamp': item.timestamp,
                  'contenttypeid': item.contenttypeid,
                  'createdtime': item.createdtime,
                  'dist': item.dist,
                  'firstimage': item.firstimage,
                  'firstimage2': item.firstimage2,
                  'cpyrhtDivCd': item.cpyrhtDivCd,
                  'mapx': item.mapx,
                  'mapy': item.mapy,
                  'mlevel': item.mlevel,
                  'modifiedtime': item.modifiedtime,
                  'sigungucode': item.sigungucode,
                  'tel': item.tel,
                  'title': item.title
                },
            changeListener),
        _tourMapperEntityDeletionAdapter = DeletionAdapter(
            database,
            'stamp',
            ['contentid'],
            (TourMapperEntity item) => <String, Object?>{
                  'contentid': item.contentid,
                  'numOfRows': item.numOfRows,
                  'pageNo': item.pageNo,
                  'totalCount': item.totalCount,
                  'addr1': item.addr1,
                  'addr2': item.addr2,
                  'areacode': item.areacode,
                  'booktour': item.booktour,
                  'cat1': item.cat1,
                  'cat2': item.cat2,
                  'cat3': item.cat3,
                  'timestamp': item.timestamp,
                  'contenttypeid': item.contenttypeid,
                  'createdtime': item.createdtime,
                  'dist': item.dist,
                  'firstimage': item.firstimage,
                  'firstimage2': item.firstimage2,
                  'cpyrhtDivCd': item.cpyrhtDivCd,
                  'mapx': item.mapx,
                  'mapy': item.mapy,
                  'mlevel': item.mlevel,
                  'modifiedtime': item.modifiedtime,
                  'sigungucode': item.sigungucode,
                  'tel': item.tel,
                  'title': item.title
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TourMapperEntity> _tourMapperEntityInsertionAdapter;

  final DeletionAdapter<TourMapperEntity> _tourMapperEntityDeletionAdapter;

  @override
  Stream<List<TourMapperEntity>> selectItem() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM stamp ORDER BY timestamp DESC',
        mapper: (Map<String, Object?> row) => TourMapperEntity(
            contentid: row['contentid'] as int,
            numOfRows: row['numOfRows'] as int,
            pageNo: row['pageNo'] as int,
            totalCount: row['totalCount'] as int,
            addr1: row['addr1'] as String,
            addr2: row['addr2'] as String,
            areacode: row['areacode'] as String,
            booktour: row['booktour'] as String,
            cat1: row['cat1'] as String,
            cat2: row['cat2'] as String,
            cat3: row['cat3'] as String,
            timestamp: row['timestamp'] as int,
            contenttypeid: row['contenttypeid'] as int,
            createdtime: row['createdtime'] as String,
            dist: row['dist'] as String,
            firstimage: row['firstimage'] as String,
            firstimage2: row['firstimage2'] as String,
            cpyrhtDivCd: row['cpyrhtDivCd'] as String,
            mapx: row['mapx'] as double,
            mapy: row['mapy'] as double,
            mlevel: row['mlevel'] as String,
            modifiedtime: row['modifiedtime'] as String,
            sigungucode: row['sigungucode'] as String,
            tel: row['tel'] as String,
            title: row['title'] as String),
        queryableName: 'stamp',
        isView: false);
  }

  @override
  Future<TourMapperEntity?> getOldestItem() async {
    return _queryAdapter.query(
        'SELECT * FROM stamp ORDER BY timestamp ASC LIMIT 1',
        mapper: (Map<String, Object?> row) => TourMapperEntity(
            contentid: row['contentid'] as int,
            numOfRows: row['numOfRows'] as int,
            pageNo: row['pageNo'] as int,
            totalCount: row['totalCount'] as int,
            addr1: row['addr1'] as String,
            addr2: row['addr2'] as String,
            areacode: row['areacode'] as String,
            booktour: row['booktour'] as String,
            cat1: row['cat1'] as String,
            cat2: row['cat2'] as String,
            cat3: row['cat3'] as String,
            timestamp: row['timestamp'] as int,
            contenttypeid: row['contenttypeid'] as int,
            createdtime: row['createdtime'] as String,
            dist: row['dist'] as String,
            firstimage: row['firstimage'] as String,
            firstimage2: row['firstimage2'] as String,
            cpyrhtDivCd: row['cpyrhtDivCd'] as String,
            mapx: row['mapx'] as double,
            mapy: row['mapy'] as double,
            mlevel: row['mlevel'] as String,
            modifiedtime: row['modifiedtime'] as String,
            sigungucode: row['sigungucode'] as String,
            tel: row['tel'] as String,
            title: row['title'] as String));
  }

  @override
  Future<void> insertItem(TourMapperEntity item) async {
    await _tourMapperEntityInsertionAdapter.insert(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteItem(TourMapperEntity item) async {
    await _tourMapperEntityDeletionAdapter.delete(item);
  }
}

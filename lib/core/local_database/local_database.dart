mixin LocalDatabase {
  static Future<void> init() async {
    // try {
    //   if (Isar.instanceNames.isNotEmpty) return;

    //   isar = await openDb();
    // } catch (e, _) {
    //   log(e.toString());
    // }
  }

  static Future<bool> openDb() async {
    // return isar;
    return true;
  }

  static Future<void> clearDatabase() async {}

  static Future<bool> dispose() async {
    // return isar?.close();
    return true;
  }
}

abstract class BaseLocalDatabase<T> {
  Stream<List<T>> listenDb() {
    throw UnimplementedError('listenDb $T');
  }

  Future<List<T>> getAll() {
    throw UnimplementedError('getAll $T');
  }

  Future<List<T>> gets({required int limit, required int offset}) {
    throw UnimplementedError('gets $T');
  }

  Future<T?> get(String id) {
    throw UnimplementedError('get $T');
  }

  Future<T?> getByKey(int id) {
    throw UnimplementedError('getByKey $T');
  }

  Future<List<T>> filter() {
    throw UnimplementedError('filter $T');
  }

  Future<int> insert(T model) {
    throw UnimplementedError('insert $T');
  }

  Future<bool> insertAll(List<T> models) {
    throw UnimplementedError('insert $T');
  }

  Future<int> update(T model) {
    throw UnimplementedError('update $T');
  }

  Future<bool> delete(int id) {
    throw UnimplementedError('delete $T');
  }
}

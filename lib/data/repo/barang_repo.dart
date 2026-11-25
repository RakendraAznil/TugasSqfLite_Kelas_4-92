import 'package:weeksebelas/data/dao/barang_dao.dart';
import 'package:weeksebelas/model/barang.dart';

abstract class BarangRepo {
  Future<int> insert(Barang barang);
  Future<List<Barang>> getAllBarang();
}

class BarangRepoImpl implements BarangRepo {
  final BarangDao dao;

  BarangRepoImpl(this.dao);

  @override
  Future<List<Barang>> getAllBarang() {
    return dao.getAllBarang();
  }

  @override
  Future<int> insert(Barang barang) {
    return dao.insert(barang);
  }
}

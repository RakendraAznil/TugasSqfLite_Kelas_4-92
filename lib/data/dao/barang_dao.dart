import 'package:weeksebelas/data/database/db_helper.dart';
import 'package:weeksebelas/model/barang.dart';

class BarangDao {
  final DbHelper _dbHelper;

  BarangDao(this._dbHelper);

  static const _nameTable = DbHelper.tableName;

  Future<int> insert(Barang barang) async {
    final db = await _dbHelper.database;
    return await db.insert(_nameTable, barang.toMap());
  }

  Future<List<Barang>> getAllBarang() async {
    final db = await _dbHelper.database;
    final getData = await db.query(_nameTable, orderBy: 'id DESC');
    return getData.map(Barang.fromMap).toList();
  }
}

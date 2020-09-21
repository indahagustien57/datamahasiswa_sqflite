import 'package:sqflite/sqflite.dart';
import 'package:datamahasiswa_sqflite/model/model_mahasiswa.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  final String tableMahasiswa = 'noteTable';
  final String columId = 'id';
  final String columnNamaLengkap = 'namalengkap';
  final String columnEmail = 'email';
  final String columnNimMahasiswa = 'nimmahasiswa';
  final String columnJurusan = 'jurusan';
  final String columnFakultas = 'fakultas';
  final String columnSemester = 'semester';
  final String columnJumlahSks = 'jumlahsks';
  static Database _db;
  DatabaseHelper.internal();
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mahasiswa.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int NewVersion) async {
    await db.execute(
        'CREATE TABLE $tableMahasiswa($columId INTEGER PRIMARY KEY, $columnNamaLengkap TEXT, $columnEmail TEXT, $columnNimMahasiswa TEXT, $columnJurusan TEXT, $columnFakultas TEXT, $columnSemester TEXT, $columnJumlahSks TEXT)');
  }

//Save Pegawai
  Future<int> savePegawai(ModelMahasiswa mahasiswa) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableMahasiswa, mahasiswa.toMap());
    return result;
  }

//Get All Pegawai
  Future<List> getAllMahasiswa() async {
    var dbClient = await db;
    var result = await dbClient.query(tableMahasiswa, columns: [
      columId,
      columnNamaLengkap,
      columnEmail,
      columnNimMahasiswa,
      columnJurusan,
      columnFakultas,
      columnSemester,
      columnJumlahSks
    ]);
    return result.toList();
  }

//Update Pegawai
  Future<int> updatePegawai(ModelMahasiswa mahasiswa) async {
    var dbClient = await db;
    return await dbClient.update(tableMahasiswa, mahasiswa.toMap(),
        where: "$columId = ?", whereArgs: [mahasiswa.id]);
  }

//Delete Pegawai
  Future<int> deleteMahasiswa(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableMahasiswa, where: "$columId = ?", whereArgs: [id]);
  }
}

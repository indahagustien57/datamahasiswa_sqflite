class ModelMahasiswa {
  int _id;
  String _namaLengkap;
  String _email;
  String _nimMahasiswa;
  String _jurusan;
  String _fakultas;
  String _semester;
  String _jumlahSks;
  ModelMahasiswa(this._namaLengkap, this._email, this._nimMahasiswa,
      this._jurusan, this._fakultas, this._semester, this._jumlahSks);

  ModelMahasiswa.map(dynamic obj) {
    this._id = obj['id'];
    this._namaLengkap = obj['namalengkap'];
    this._email = obj['email'];
    this._nimMahasiswa = obj['nimmahasiswa'];
    this._jurusan = obj['jurusan'];
    this._fakultas = obj['fakultas'];
    this._semester = obj['semester'];
    this._jumlahSks = obj['jumlahsks'];
  }
  int get id => _id;
  String get namalengkap => _namaLengkap;
  String get email => _email;
  String get nimMahasiswa => _nimMahasiswa;
  String get jurusan => _jurusan;
  String get fakultas => _fakultas;
  String get semester => _semester;
  String get jumlahsks => _jumlahSks;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['namalengkap'] = _namaLengkap;
    map['email'] = _email;
    map['nimmahasiswa'] = _nimMahasiswa;
    map['jurusan'] = _jurusan;
    map['fakultas'] = _fakultas;
    map['semester'] = _semester;
    map['jumlahsks'] = _jumlahSks;

    return map;
  }

  ModelMahasiswa.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._namaLengkap = map['namalengkap'];
    this._email = map['email'];
    this._nimMahasiswa = map['nimmahasiswa'];
    this._jurusan = map['jurusan'];
    this._fakultas = map['fakultas'];
    this._semester = map['semester'];
    this._jumlahSks = map['jumlahsks'];
  }
}

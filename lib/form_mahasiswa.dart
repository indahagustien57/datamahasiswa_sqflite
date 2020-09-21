import 'package:flutter/material.dart';
import 'package:datamahasiswa_sqflite/db_helper.dart';
import 'package:datamahasiswa_sqflite/model/model_mahasiswa.dart';

class FormMahasiswa extends StatefulWidget {
  final ModelMahasiswa modelMahasiswa;
  FormMahasiswa(this.modelMahasiswa);
  @override
  _FormMahasiswaState createState() => _FormMahasiswaState();
}

class _FormMahasiswaState extends State<FormMahasiswa> {
  DatabaseHelper db = new DatabaseHelper();
  TextEditingController _namaLengkapControler;
  TextEditingController _emailControler;
  TextEditingController _nimMahasiswaControler;
  TextEditingController _jurusanControler;
  TextEditingController _fakultasControler;
  TextEditingController _semesterControler;
  TextEditingController _jumlahSksControler;
  @override
  void initState() {
    super.initState();
    _namaLengkapControler =
        new TextEditingController(text: widget.modelMahasiswa.namalengkap);
    _emailControler =
        new TextEditingController(text: widget.modelMahasiswa.email);
    _nimMahasiswaControler =
        new TextEditingController(text: widget.modelMahasiswa.nimMahasiswa);
    _jurusanControler =
        new TextEditingController(text: widget.modelMahasiswa.jurusan);
    _fakultasControler =
        new TextEditingController(text: widget.modelMahasiswa.fakultas);
    _semesterControler =
        new TextEditingController(text: widget.modelMahasiswa.semester);
    _jumlahSksControler =
        new TextEditingController(text: widget.modelMahasiswa.jumlahsks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Mahasiswa'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: _namaLengkapControler,
            decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _emailControler,
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _nimMahasiswaControler,
            decoration: InputDecoration(
                labelText: 'Nim Mahasiswa',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _jurusanControler,
            decoration: InputDecoration(
                labelText: 'Jurusan',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _fakultasControler,
            decoration: InputDecoration(
                labelText: 'Fakultas',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _semesterControler,
            decoration: InputDecoration(
                labelText: 'Semester',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _jumlahSksControler,
            decoration: InputDecoration(
                labelText: 'Jumlah Sks',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 5,
          ),
          RaisedButton(
              color: Colors.blue,
              child: (widget.modelMahasiswa.id != null)
                  ? Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                if (widget.modelMahasiswa.id != null) {
                  db
                      .updatePegawai(ModelMahasiswa.fromMap({
                    'id': widget.modelMahasiswa.id,
                    'namalengkap': _namaLengkapControler.text,
                    'email': _emailControler.text,
                    'nimmahasiswa': _nimMahasiswaControler.text,
                    'jurusan': _jurusanControler.text,
                    'fakultas': _fakultasControler.text,
                    'semester': _semesterControler.text,
                    'jumlahsks': _jumlahSksControler.text
                  }))
                      .then((_) {
                    Navigator.pop(context, 'update');
                  });
                } else {
                  db
                      .savePegawai(ModelMahasiswa(
                    _namaLengkapControler.text,
                    _emailControler.text,
                    _nimMahasiswaControler.text,
                    _jurusanControler.text,
                    _fakultasControler.text,
                    _semesterControler.text,
                    _jumlahSksControler.text,
                  ))
                      .then((_) {
                    Navigator.pop(context, 'save');
                  });
                }
              })
        ],
      ),
    );
  }
}

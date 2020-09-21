import 'package:flutter/material.dart';
import 'package:datamahasiswa_sqflite/detail_page.dart';
import 'package:datamahasiswa_sqflite/db_helper.dart';
import 'package:datamahasiswa_sqflite/form_mahasiswa.dart';
import 'package:datamahasiswa_sqflite/model/model_mahasiswa.dart';

class ListMahasiswa extends StatefulWidget {
  @override
  _ListMahasiswaState createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  List<ModelMahasiswa> items = new List();
  DatabaseHelper db = new DatabaseHelper();
  @override
  void initState() {
    super.initState();
    db.getAllMahasiswa().then((mahasiswais) {
      setState(() {
        mahasiswais.forEach((mahasiswa) {
          items.add(ModelMahasiswa.fromMap(mahasiswa));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Data Mahasiswa'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.only(left: 16),
              title: Text(
                '${items[index].namalengkap}',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrangeAccent),
              ),
              subtitle: Text(
                '${items[index].nimMahasiswa}',
              ),
              onTap: () {
                _navigateToMahasiswa(context, items[index]);
              },
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  AlertDialog hapus = AlertDialog(
                    title: Text('Information'),
                    content: Container(
                      height: 100.0,
                      child: Column(
                        children: <Widget>[
                          Text(
                              'Apakah anda yakin ingin hapus data ${items[index].namalengkap}')
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('yes'),
                        onPressed: () {
                          _deleteMahasiswa(context, items[index], index);
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text('no'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                  showDialog(context: context, child: hapus);
                },
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageDetail(
                                namalengkap: items[index].namalengkap,
                                email: items[index].email,
                                nimmahasiswa: items[index].nimMahasiswa,
                                jurusan: items[index].jurusan,
                                fakultas: items[index].fakultas,
                                semester: items[index].semester,
                                jumlahsks: items[index].jumlahsks,
                              )));
                },
                icon: Icon(Icons.visibility),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            _createNewMahasiswa(context);
          }),
    );
  }

  _deleteMahasiswa(
      BuildContext context, ModelMahasiswa mahasiswa, int position) {
    db.deleteMahasiswa(mahasiswa.id).then((mahasiswais) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToMahasiswa(
      BuildContext context, ModelMahasiswa mahasiswa) async {
    String result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormMahasiswa(mahasiswa)));
    if (result == 'update') {
      db.getAllMahasiswa().then((mahasiswais) {
        setState(() {
          items.clear();
          mahasiswais.forEach((mahasiswa) {
            items.add(ModelMahasiswa.fromMap(mahasiswa));
          });
        });
      });
    }
  }

  void _createNewMahasiswa(BuildContext context) async {
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FormMahasiswa(ModelMahasiswa('', '', '', '', '', '', ''))));
    if (result == 'save') {
      db.getAllMahasiswa().then((mahasiswa) {
        setState(() {
          items.clear();
          mahasiswa.forEach((mahasiswa) {
            items.add(ModelMahasiswa.fromMap(mahasiswa));
          });
        });
      });
    }
  }
}

import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  String namalengkap,
      email,
      nimmahasiswa,
      jurusan,
      fakultas,
      semester,
      jumlahsks;
  PageDetail(
      {this.namalengkap,
      this.email,
      this.nimmahasiswa,
      this.jurusan,
      this.fakultas,
      this.semester,
      this.jumlahsks});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Mahasiswa'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Nama Lengkap : $namalengkap'),
            Text('Email : $email'),
            Text('Nim Mahasiswa : $nimmahasiswa'),
            Text('Jurusan : $jurusan'),
            Text('Fakultas : $fakultas'),
            Text('Semester : $semester'),
            Text('Jumlah Sks : $jumlahsks'),
          ],
        ),
      ),
    );
  }
}

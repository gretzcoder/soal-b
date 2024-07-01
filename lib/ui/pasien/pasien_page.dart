import 'package:flutter/material.dart';
import 'package:klinik_app/model/Pasien.dart';
import 'package:klinik_app/ui/pasien/pasien_detail.dart';
import 'package:klinik_app/ui/sidebar.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text(
          "Data Pasien",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("M. Iqbal Alifudin"),
                leading: Icon(Icons.person),
              ),
            ),
            onTap: () {
              Pasien Iqbal = Pasien(
                  namaPasien: "M. Iqbal Alifudin",
                  nomorRuang: "Flamboyan 1",
                  tglLahir: "04-05-2000",
                  noTelp: "085893656332",
                  alamat: "Jl Kemanggisan Jakarta Barat");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasienDetail(
                      pasien: Iqbal,
                    ),
                  ));
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Agus"),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Imam"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Sobirin"),
            ),
          )
        ],
      ),
    );
  }
}

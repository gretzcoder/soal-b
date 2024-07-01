import 'package:flutter/material.dart';
import 'package:klinik_app/model/Poli.dart';
import 'package:klinik_app/services/poli_service.dart';
import 'package:klinik_app/ui/poli/poli_detail.dart';
import 'package:klinik_app/ui/poli/poli_page.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form Tambah Poli",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [_fieldNamaPoli(), _tombolSimpan()],
              ),
            )),
      ),
    );
  }

  _fieldNamaPoli() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
          await PoliService().simpan(poli).then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poli),
                ));
          });
        },
        child: const Text("Simpan"));
  }
}

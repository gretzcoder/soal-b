import 'package:flutter/material.dart';
import 'package:klinik_app/model/Poli.dart';
import 'package:klinik_app/services/poli_service.dart';
import 'package:klinik_app/ui/poli/poli_detail.dart';
import 'package:klinik_app/ui/poli/poli_page.dart';

class PoliUpdate extends StatefulWidget {
  final Poli poli;

  const PoliUpdate({super.key, required this.poli});

  @override
  State<PoliUpdate> createState() => _PoliUpdateState();
}

class _PoliUpdateState extends State<PoliUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  void initState() {
    super.setState(() {
      _namaPoliCtrl.text = widget.poli.namaPoli;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form Ubah Poli",
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
          Poli poliBaru = Poli(namaPoli: _namaPoliCtrl.text);
          await PoliService()
              .ubah(poliBaru, widget.poli.id.toString())
              .then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliPage(),
                ));
          });
        },
        child: const Text("Simpan"));
  }
}

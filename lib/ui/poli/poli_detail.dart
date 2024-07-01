import 'package:flutter/material.dart';
import 'package:klinik_app/model/Poli.dart';
import 'package:klinik_app/services/poli_service.dart';
import 'package:klinik_app/ui/poli/poli_page.dart';
import 'package:klinik_app/ui/poli/poli_update.dart';

class PoliDetail extends StatefulWidget {
  Poli poli = new Poli(namaPoli: "Poli Disini");

  PoliDetail({super.key, required this.poli});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Poli Detail",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Nama Poli : Nama Poli Disini",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_tombolUbah(), _tombolHapus()],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PoliUpdate(poli: widget.poli),
              ));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
        child: const Text("UBAH"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: Text("Yakin ingin menghapus?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Batal"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await PoliService()
                      .hapus(widget.poli.id.toString())
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PoliPage(),
                        ));
                  });
                },
                child: Text("Yakin"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          );
          showDialog(
            context: context,
            builder: (context) => alertDialog,
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("HAPUS"));
  }
}

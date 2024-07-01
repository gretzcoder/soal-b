import 'package:flutter/material.dart';
import 'package:klinik_app/model/Poli.dart';
import 'package:klinik_app/ui/poli/poli_detail.dart';

class PoliItem extends StatelessWidget {
  Poli data;

  PoliItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(data.namaPoli),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PoliDetail(
                poli: data,
              ),
            ));
      },
    );
  }
}

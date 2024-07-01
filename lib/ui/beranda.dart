import 'package:flutter/material.dart';
import 'package:klinik_app/ui/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Beranda"),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text("Beranda"),
      ),
    );
  }
}

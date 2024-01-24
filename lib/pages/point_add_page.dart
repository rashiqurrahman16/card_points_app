import 'package:flutter/material.dart';

class PiontAddPage extends StatefulWidget {
  const PiontAddPage({super.key});

  @override
  State<PiontAddPage> createState() => _PiontAddPageState();
}

class _PiontAddPageState extends State<PiontAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hazari'),
        toolbarHeight: 200,

        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

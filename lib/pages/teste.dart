import 'package:flutter/material.dart';

class TestePage extends StatefulWidget {
  final String nome;

  TestePage({this.nome});

  @override
  _TestePageState createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nome),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

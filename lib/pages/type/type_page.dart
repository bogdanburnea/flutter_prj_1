import 'package:flutter/material.dart';

// pure ui widget, so no ValueListenableBuilder wrapper

class TypePage extends StatefulWidget {
  const TypePage({super.key});

  @override
  _TypePageState createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  @override
  Widget build(BuildContext context) {
    print('[TypePage] build');
    return const Scaffold(
      body: Text('Type page'),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MofaApp());
}

class MofaApp extends StatelessWidget {
  const MofaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mofa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MofaHomePage(title: 'Mofa'),
    );
  }
}

class MofaHomePage extends StatefulWidget {
  const MofaHomePage({super.key, required this.title});

  final String title;

  @override
  State<MofaHomePage> createState() => _MofaHomePageState();
}

class _MofaHomePageState extends State<MofaHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello Mofa',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}

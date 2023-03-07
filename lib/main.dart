import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mofa/theme/theme.dart';

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
        primaryColor: AppTheme.primary,
        appBarTheme: AppBarTheme(
          color: AppTheme.primary
        )
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppTheme.primary,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 234,
            margin: const EdgeInsets.fromLTRB(16, 26, 16, 26),
            // color: AppTheme.primary,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18))
            ),
            child: Container(
              color: AppTheme.primary,
              padding: EdgeInsets.all(26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Aptos(APT)", style: TextStyle(fontSize: 24, color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: ColoredBox(color: Colors.white),
                      ),
                      Text("0.0", style: TextStyle(fontSize: 40, color: Colors.white))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

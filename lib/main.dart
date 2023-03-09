import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mofa/chain/account.dart';
import 'package:mofa/chain/keychain.dart';
import 'package:mofa/pages/home.dart';
import 'package:mofa/pages/receive.dart';
import 'package:mofa/theme/theme.dart';

void main() {
  runApp(const MofaApp());
}

final _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const MofaMainPage(title: "Mofa");
      },
      routes: [
        GoRoute(
          path: "home",
          builder: (context, state) {
            return const MofaHomePage(title: "Mofa");
          },
          routes: [
            GoRoute(
              path: "receive",
              builder: (context, index) {
                return const Receive(chainType: ChainType.sui);
              }
            )
          ]
        ),
      ]
    ),
  ]
);

class MofaApp extends StatelessWidget {
  const MofaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: AppTheme.white,
        appBarTheme: AppBarTheme(
          color: AppTheme.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppTheme.white
          ),
          iconTheme: IconThemeData(color: Colors.black)
        )
      ),
      routerConfig: _router,
    );
  }
}

class MofaMainPage extends StatefulWidget {
  const MofaMainPage({super.key, required this.title});

  final String title;

  @override
  State<MofaMainPage> createState() => _MofaMainPageState();
}

class _MofaMainPageState extends State<MofaMainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primary,
        systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppTheme.primary
        ),
      ),
      backgroundColor: AppTheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/images/mofa_logo.png"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Column(
              children: [
                ElevatedButton(onPressed: (){
                  final mnemonics = Account.generateMnemonics();
                  final aptosAccount = Account(ChainType.aptos, mnemonics: mnemonics);
                  final suiAccount = Account(ChainType.sui, mnemonics: mnemonics);
                  Keychain.shared.setMnemonic(mnemonics);
                  context.go("/home");
                },
                 child: Text("Create Wallet"),
                 style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: AppTheme.white,
                  foregroundColor: AppTheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))
                 ),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: (){},
                 child: Text("Import Wallet"),
                 style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: AppTheme.primary,
                  foregroundColor: AppTheme.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    side: BorderSide(color: AppTheme.white)
                  )
                 ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
 
}

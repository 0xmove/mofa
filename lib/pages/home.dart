import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mofa/theme/theme.dart';
import 'package:mofa/widgets/wallet_card.dart';

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
        leading: IconButton(icon: Icon(Icons.wallet, color: AppTheme.primary,), onPressed: (){}),
        actions: [
          IconButton(icon: Icon(Icons.qr_code_scanner, color: AppTheme.primary,), onPressed: (){}),
        ],
        backgroundColor: AppTheme.white,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WalletCard(title: "MyWallet", balance: "0.0", bgColor: AppTheme.aptos),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: 
                    Transform.rotate(
                      angle: pi,
                      child: GestureDetector(
                        onTap: () => context.push("/home/receive"),
                        child: Container(
                          height: 50,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(20),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Icon(Icons.arrow_outward, size: 35, color: Colors.green)
                        ),
                      ),
                    )
                  ),
                  SizedBox(width: 10),
                  Expanded(child: 
                    Container(
                      height: 50,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(20),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Icon(Icons.arrow_outward, size: 35, color: Colors.red),
                    )
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              margin: EdgeInsets.only(left: 16),
              child: Text("Token", style: TextStyle(fontSize: 24))
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
            return tokenCell(index);
          }, childCount: 2))
        ],
      ),
    );
  }

  Widget tokenCell(int index) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: AppTheme.primary),
      title: Text("Token $index"),
      trailing: Text("0.0"),
      onTap: () {
        debugPrint("click list tile $index");
      },
    );
  }
  
}
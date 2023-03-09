import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mofa/theme/theme.dart';
import 'package:mofa/widgets/wallet_card.dart';

class WalletCardListPage extends StatefulWidget {
  const WalletCardListPage({super.key, required this.title});

  final String title;

  @override
  State<WalletCardListPage> createState() => _WalletCardListPageState();
}

class _WalletCardListPageState extends State<WalletCardListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.wallet, color: AppTheme.primary,), onPressed: (){}),
        actions: [
          IconButton(icon: Icon(Icons.qr_code_scanner, color: AppTheme.primary,), onPressed: (){}),
        ],
        backgroundColor: AppTheme.white,
        // systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarColor: AppTheme.white,
          // statusBarBrightness: Brightness.light,
          // statusBarIconBrightness: Brightness.dark,
        // ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const WalletCard(title: "Aptos(APT)", balance: "0.0", bgColor: AppTheme.aptos);
          } else if (index == 1) {
            return const WalletCard(title: "Sui(SUI)", balance: "0.0", bgColor: AppTheme.sui);
          }
        })
      );
  }
  
}
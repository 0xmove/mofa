
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mofa/chain/account.dart';
import 'package:mofa/chain/keychain.dart';
import 'package:mofa/theme/theme.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class Receive extends StatefulWidget {
  const Receive({super.key, required this.chainType});

  final ChainType chainType;

  @override
  State<StatefulWidget> createState() => _ReceiveState();

}

class _ReceiveState extends State<Receive> {

  var address = "";
  _ReceiveState() {
    Keychain.shared.getMnemonic().then((mnemonics) {
      final account = Account(widget.chainType, mnemonics: mnemonics);
      setState(() {
        address = account.address;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: AppTheme.white,
        child: Center(
          child: PrettyQr(
            size: 300,
            data: address,
            errorCorrectLevel: QrErrorCorrectLevel.M,
            roundEdges: true,
          )
        )
      ),
    );
  }



}
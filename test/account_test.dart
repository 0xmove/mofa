
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mofa/chain/account.dart';

void main() {
  test('account test', () {
    Account suiAccount = Account(ChainType.sui);
    debugPrint(suiAccount.privateKey);
    debugPrint(suiAccount.publicKey);
    debugPrint(suiAccount.address);

    Account aptosAccount = Account(ChainType.aptos);
    debugPrint(aptosAccount.privateKey);
    debugPrint(aptosAccount.publicKey);
    debugPrint(aptosAccount.address);

    debugPrint(Account.generateMnemonics());
  });  
}


import 'package:aptos/aptos_account.dart';
import 'package:sui/cryptography/publickey.dart';
import 'package:sui/sui_account.dart';
import 'package:sui/utils/hex.dart';

enum ChainType {
  sui, aptos
}

class Account {

  late AptosAccount _aptosAccount;
  late SuiAccount _suiAccount;
  final ChainType chainType;
  String? mnemonics;

  Account(this.chainType, {this.mnemonics}) {
    switch (chainType) {
      case ChainType.sui:
        if (mnemonics != null) {
          _suiAccount = SuiAccount.fromMnemonics(mnemonics!, SignatureScheme.ED25519);
        } else {
          _suiAccount = SuiAccount.ed25519Account();
        }
        break;
      case ChainType.aptos:
        if (mnemonics != null) {
          _aptosAccount = AptosAccount.generateAccount(mnemonics!);
        } else {
          _aptosAccount = AptosAccount();
        }
        break;
      default:
        throw UnsupportedError("Undefined ChainType $chainType");
    }
  }

  String get privateKey {
      switch (chainType) {
      case ChainType.sui:
        return "0x${Hex.encode(_suiAccount.getSecretKey())}";
      case ChainType.aptos:
        return _aptosAccount.toPrivateKeyObject().privateKeyHex!;
      default:
        throw UnsupportedError("Undefined ChainType $chainType");
    }
  }

  String get publicKey {
      switch (chainType) {
      case ChainType.sui:
        return "0x${Hex.encode(_suiAccount.getPublicKey())}";
      case ChainType.aptos:
        return _aptosAccount.toPrivateKeyObject().publicKeyHex!;
      default:
        throw UnsupportedError("Undefined ChainType $chainType");
    }
  }

  String get address {
      switch (chainType) {
      case ChainType.sui:
        return _suiAccount.getAddress();
      case ChainType.aptos:
        return _aptosAccount.address;
      default:
        throw UnsupportedError("Undefined ChainType $chainType");
    }
  }

  static String generateMnemonics() {
    return AptosAccount.generateMnemonic();
  }

}
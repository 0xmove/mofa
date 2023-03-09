import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Keychain {
  static final shared = Keychain._();

  factory Keychain() => shared;

  Keychain._();

  final storage = const FlutterSecureStorage();

  Future<bool> write(String key, String value) async {
    try {
      await storage.write(key: key, value: value);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<String> read(String key) async {
    try {
      return await storage.read(key: key) ?? "";
    } catch (e) {
      debugPrint(e.toString());
      return "";
    }
  }

  final String _mnemonicKey = "mnemonic_key";

  final String _privateKey = "private_key";

  final String _publicKey = "public_key";

  final String _passwordKey = "password_key";

  Future<bool> setMnemonic(String value) => write(_mnemonicKey, value);

  Future<String> getMnemonic() => read(_mnemonicKey);

  Future<bool> setPrivateKey(String value) => write(_privateKey, value);

  Future<String> getPrivateKey() => read(_privateKey);

  Future<bool> setPublicKey(String value) => write(_publicKey, value);

  Future<String> getPublicKey() => read(_publicKey);

  Future<bool> setPasswordKey(String value) => write(_passwordKey, value);

  Future<String> getPasswordKey() => read(_passwordKey);

  void clearAll() {
    storage.deleteAll();
  }
}

import 'package:clackbox/common/constants/appwrite_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDataSource {
  late FlutterSecureStorage _secureStorage;

  AuthLocalDataSource(FlutterSecureStorage secureStorage) {
    _secureStorage = secureStorage;
  }

  Future<Unit> saveSessionId(String sessionId) async {
    await _secureStorage.write(
        key: AppWriteConstants.sessionIdKey, value: sessionId);
    return unit;
  }

  Future<String?> getSessionId() async {
    return _secureStorage.read(key: AppWriteConstants.sessionIdKey);
  }

  Future<Unit> deleteSession() async {
    _secureStorage.delete(key: AppWriteConstants.sessionIdKey);
    return unit;
  }
}

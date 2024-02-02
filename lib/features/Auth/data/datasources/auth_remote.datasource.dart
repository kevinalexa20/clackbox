import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:appwrite/models.dart';
import 'package:clackbox/common/constants/appwrite_constants.dart';
import 'package:clackbox/common/services/appwrite_client.dart';
import 'package:clackbox/features/Auth/data/models/login_model.dart';
import 'package:clackbox/features/Auth/data/models/register_model.dart';
import 'package:clackbox/features/Auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDatasource {
  late Account _account = Account(AppWriteClient().client);
  late Databases _databases = Databases(AppWriteClient().client);

  final Client _client;
  User? _user;
  // late Databases _databases;

  AuthRemoteDatasource(Account account, Databases databases, this._client) {
    _account = account;
    _databases = databases;
  }

  // Future _getUser() async {
  //   _user = await _account.get();
  // }

  //Create Account

  Future<Unit> createAccount(RegisterModel registerModel) async {
    await _account.create(
        userId: ID.unique(),
        email: registerModel.email,
        password: registerModel.password);

    return unit;
  }

  //saving account to document appwrite
  Future<Unit> saveAccount(String userId, RegisterModel registerModel) async {
    await _databases.createDocument(
      databaseId: AppWriteConstants.databaseID,
      collectionId: AppWriteConstants.usersDetailsCollectionId,
      documentId: userId,
      // permissions: [
      //   'read:${AppWriteConstants.anonimousRole}',
      //   'write:${AppWriteConstants.anonimousRole}',
      // ],
      data: {
        'userId': userId,
        'name': registerModel.name,
        'email': registerModel.email,
        // 'createdAt': DateTime.now().toIso8601String(),
        // 'updatedAt': DateTime.now().toIso8601String(),
      },
      // data: userModel.toMap(),
    );
    return unit;
  }

  // Future<model.User?> createAccount(RegisterModel registerModel) async {
  //   final account = await _account.create(
  //     userId: ID.unique(),
  //     email: registerModel.email,
  //     password: registerModel.password,
  //     name: registerModel.name,
  //   );
  //   return account;
  // }

  // return SESSION from appwrite
  //Login
  Future<model.Session> login(LoginModel loginModel) async {
    final session = await _account.createEmailSession(
        email: loginModel.email, password: loginModel.password);

    return session;
  }

  Future<UserModel> getUser(String userId) async {
    final documents = await _databases.getDocument(
      databaseId: AppWriteConstants.databaseID,
      collectionId: AppWriteConstants.usersDetailsCollectionId,
      documentId: userId,
    );
    return UserModel.fromJson(documents.data);
  }

  Future<model.Session> getSessionId(String sessionId) async {
    final model.Session session =
        await _account.getSession(sessionId: sessionId);

    return session;
  }

  Future<Unit> deleteSession(String sessionId) async {
    await _account.deleteSession(sessionId: sessionId);

    return unit;
  }

  // Future<UserModel> getUser(String userId) async {
  //   // final user = await _account.get();

  //   // return UserModel(
  //   //   userId: user.$id,
  //   //   email: user.email,
  //   //   name: user.name,
  //   // );

  //   final documents = await _databases.getDocument(
  //     databaseId: AppWriteConstants.databaseID,
  //     collectionId: AppWriteConstants.usersDetailsCollectionId,
  //     documentId: userId,
  //   );
  //   return UserModel.fromJson(documents.data);
  // }

  // Future<User> getUser() async {
  //   final user = await _account.get();

  //   return user;
  // }
}

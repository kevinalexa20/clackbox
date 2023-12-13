import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:clackbox/common/constants/appwrite_constants.dart';
import 'package:clackbox/features/Auth/data/models/login_model.dart';
import 'package:clackbox/features/Auth/data/models/register_model.dart';
import 'package:clackbox/features/Auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDatasource {
  late Account _account;
  late Databases _databases;

  AuthRemoteDatasource(Account account, Databases databases) {
    _account = account;
  }

  Future<Unit> createAccount(RegisterModel registerModel) async {
    await _account.create(
      email: registerModel.email,
      password: registerModel.password,
      userId: ID.unique(),
    );
    return unit;
  }

  Future<Unit> saveAccount(String userId, RegisterModel registerModel) async {
    await _databases.createDocument(
      databaseId: AppWriteConstants.usersDbId,
      collectionId: AppWriteConstants.usersDetailsId,
      documentId: userId,
      data: {
        'userId': userId,
        'name': registerModel.name,
        'email': registerModel.email,
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      },
    );
    return unit;
  }

  // return SESSION from appwrite
  Future<Session> login(LoginModel loginModel) async {
    final session = await _account.createEmailSession(
        email: loginModel.email, password: loginModel.password);

    return session;
  }

  Future<UserModel> getUser(String userId) async {
    // final user = await _account.get();

    // return UserModel(
    //   userId: user.$id,
    //   email: user.email,
    //   name: user.name,
    // );

    final documents = await _databases.getDocument(
      databaseId: AppWriteConstants.usersDbId,
      collectionId: AppWriteConstants.usersDetailsId,
      documentId: userId,
    );
    return UserModel.fromJson(documents.data);
  }

  // Future<User> getUser() async {
  //   final user = await _account.get();

  //   return user;
  // }

  Future<Session> getSessionId(String sessionId) async {
    final Session session = await _account.getSession(sessionId: sessionId);

    return session;
  }

  Future<Unit> deleteSession(String sessionId) async {
    await _account.deleteSession(sessionId: sessionId);

    return unit;
  }
}

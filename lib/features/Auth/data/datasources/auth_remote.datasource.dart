import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/models.dart' as model;
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

  //Create Account
  Future<Unit> createAccount(RegisterModel registerModel) async {
    await _account.create(
        userId: ID.unique(),
        email: registerModel.email,
        password: registerModel.password);

    return unit;
  }

  //register with Google
  Future<Unit> registerWithGoogle() async {
    await _account.createOAuth2Session(
      provider: 'google',
      // success: 'http://localhost:3000/success',
      // failure: 'http://localhost:3000/failure',
    );

    return unit;
  }

  //saving account to document appwrite
  Future<Unit> saveAccount(String userId, RegisterModel registerModel) async {
    await _databases.createDocument(
      databaseId: AppWriteConstants.databaseID,
      collectionId: AppWriteConstants.usersDetailsCollectionId,
      documentId: userId,

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

  // return SESSION from appwrite
  //Login
  Future<Session> login(LoginModel loginModel) async {
    final session = await _account.createEmailSession(
        email: loginModel.email, password: loginModel.password);

    return session;
  }

  //Login with Google
  Future<Session> loginWithGoogle() async {
    final session = await _account.createOAuth2Session(
      provider: 'google',
      // success: 'http://localhost:3000/success',
      // failure: 'http://localhost:3000/failure',
    );

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

  Future<Session> getSessionId(String sessionId) async {
    final Session session =
        await _account.getSession(sessionId: sessionId);

    return session;
  }

  //Delete Session
  Future<Unit> deleteSession(String sessionId) async {
    await _account.deleteSession(sessionId: sessionId);

    return unit;
  }
}
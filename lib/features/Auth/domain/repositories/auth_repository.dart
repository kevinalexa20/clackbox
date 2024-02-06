import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:appwrite/models.dart';
import 'package:clackbox/features/Auth/data/datasources/auth_local.datasource.dart';
import 'package:clackbox/features/Auth/data/datasources/auth_remote.datasource.dart';
import 'package:clackbox/features/Auth/data/models/login_model.dart';
import 'package:clackbox/features/Auth/data/models/register_model.dart';
import 'package:clackbox/features/Auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  // late AppWriteClient _appWriteClient;
  late AuthRemoteDatasource _remoteDatasource;
  late AuthLocalDataSource _localDataSource;

  AuthRepository(
    AuthRemoteDatasource remoteDatasource,
    AuthLocalDataSource localDataSource,
  ) {
    _remoteDatasource = remoteDatasource;
    _localDataSource = localDataSource;
  }

  Future<Either<String, UserModel>> login(LoginModel loginModel) async {
    try {
      //login dengan model
      final Session session = await _remoteDatasource.login(loginModel);

      //save session id
      _localDataSource.saveSessionId(session.$id);

      // get user
      final UserModel userModel =
          await _remoteDatasource.getUser(session.userId);

      //return user
      return Right(userModel);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> register(
      RegisterModel registerModel) async {
    try {
      //First Create account for Login
      await _remoteDatasource.createAccount(registerModel);

      //Todo: Get session from appwrite
      //Login to get userId
      final Session session = await _remoteDatasource.login(LoginModel(
          email: registerModel.email, password: registerModel.password));

      // should pass user id
      //Save session id
      _localDataSource.saveSessionId(session.$id);

      //Todo: Pass the user ID from session
      //Save User Data to database
      await _remoteDatasource.saveAccount(session.userId, registerModel);

      // get User Data
      final UserModel authUserModel =
          await _remoteDatasource.getUser(session.userId);

      //return AuthUserModel
      return Right(authUserModel);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Future<Either<String, UserModel?>> autoLogin() async {
  //   try {
  //     //Get session id from Local datasource
  //     final String? sessionId = await _localDataSource.getSessionId();

  //     //if null return Right(null)
  //     if (sessionId == null) return const Right(null);

  //     //else getSession
  //     final Session session = await _remoteDatasource.getSessionId(sessionId);

  //     // should pass user id
  //     //get User Data
  //     final UserModel authUserModel =
  //         await _remoteDatasource.getUser(session.userId);

  //     //return Auth User Model
  //     return Right(authUserModel);
  //   } catch (e) {
  //     return Left(e.toString());
  //   }
  // }

  Future<Either<String, Unit>> logout() async {
    try {
      final String? sessionId = await _localDataSource.getSessionId();

      if (sessionId != null) {
        await _remoteDatasource.deleteSession(sessionId);
        await _localDataSource.deleteSession();
      }

      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

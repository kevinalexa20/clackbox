import 'package:appwrite/appwrite.dart';
import 'package:clackbox/common/constants/constants.dart';
import 'package:clackbox/features/Auth/data/datasources/auth_local.datasource.dart';
import 'package:clackbox/features/Auth/data/datasources/auth_remote.datasource.dart';
import 'package:clackbox/features/Auth/domain/repositories/auth_repository.dart';
import 'package:clackbox/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DIContainer {
  //client
  Client get _client => Client()
      .setEndpoint(AppWriteConstants.endPoint)
      .setProject(AppWriteConstants.projectID)
      .setSelfSigned(status: true);

  Account get _account => Account(_client);

  Databases get _databases => Databases(_client);

  FlutterSecureStorage get _secureStorage => const FlutterSecureStorage();

  //Datasource local
  AuthLocalDataSource get _localDatasource =>
      AuthLocalDataSource(_secureStorage);
  //Remote Datasoure
  AuthRemoteDatasource get _remoteDatasource =>
      AuthRemoteDatasource(_account, _databases);

  //repository
  AuthRepository get _authRepository =>
      AuthRepository(_remoteDatasource, _localDatasource);

  //bloc
  AuthBloc get authBloc => AuthBloc(_authRepository);
}

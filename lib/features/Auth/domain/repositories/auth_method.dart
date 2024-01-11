import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:clackbox/common/services/appwrite_client.dart';

class AuthMethods{
  AppWriteClient appWriteClient = AppWriteClient();
  
  
  Future<models.User> signup(Map map) async {
    final response = appWriteClient.account!.create(
        userId: map['userId'],
        email: map['email'],
        password: map['password'],
        name: map['name']);
    return response;
  }

  // Future result = AppWriteClient().account!.create(
  //   email: 'email',
  //   password: 'password',
  //   name: 'name',
  //   userId: 'userId',
  // );
}
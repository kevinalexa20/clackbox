import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:clackbox/common/constants/constants.dart';

class AppWriteClient {
  Client client = Client();

  Account? account;

  AppWriteClient() {
    client
        .setEndpoint(AppWriteConstants.endPoint)
        .setProject(AppWriteConstants.projectID)
        .setSelfSigned(status: true); //for local testing
    account = Account(client);
  }

  Future<models.User> signup(Map map) async {
    final response = account!.create(
        userId: map['userId'],
        email: map['email'],
        password: map['password'],
        name: map['name']);
    return response;
  }
}

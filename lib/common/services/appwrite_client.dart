import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:clackbox/common/constants/constants.dart';

class AppWriteClient {
  final client = Client()
      .setEndpoint(AppWriteConstants.endPoint)
      .setProject(AppWriteConstants.projectID);

  final account = Account(Client());

  final database = Databases(Client());

  // Client client = Client();
  // Databases database = Databases(Client());
  // final account = Account(client);
  // // Account? account;

  // AppWriteClient() {
  //   client
  //       .setEndpoint(AppWriteConstants.endPoint)
  //       .setProject(AppWriteConstants.projectID);
  //   // .addHeader('Origin', 'http://localhost:8080')
  //   // .setKey(AppWriteConstants.apiKey);
  //   // .setSelfSigned(status: true); //for local testing
  //   // account = Account(client);
  //   database = Databases(client);
  // }

  // Future<models.User> signup(Map map) async {
  //   final response = account!.create(
  //       userId: map['userId'],
  //       email: map['email'],
  //       password: map['password'],
  //       name: map['name']);
  //   return response;
  // }
}

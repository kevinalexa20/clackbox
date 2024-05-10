import 'package:appwrite/appwrite.dart';
import 'package:clackbox/constants/constants.dart';

class AppWriteClient {
  final client = Client()
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectID);

  final account = Account(Client());

  final database = Databases(Client());

  Storage storage = Storage(Client());
}

import 'package:appwrite/appwrite.dart';
import 'package:clackbox/common/constants/constants.dart';

class AppWriteClient {
  final client = Client()
      .setEndpoint(AppWriteConstants.endPoint)
      .setProject(AppWriteConstants.projectID);

  final account = Account(Client());

  final database = Databases(Client());

  Storage storage = Storage(Client());
}

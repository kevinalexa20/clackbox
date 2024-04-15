import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:clackbox/common/constants/appwrite_constants.dart';
import 'package:clackbox/common/services/appwrite_client.dart';

Future<Document> getUserDetails(String userId) async {
  // Buatlah client Appwrite.
  var client = AppWriteClient();
  // var appwriteId = AppWriteConstants();

  // Query collection UsersDetails dengan userId.
  var response = await client.database.listDocuments(
    collectionId: AppWriteConstants.usersDetailsCollectionId,
    databaseId: AppWriteConstants.databaseID,
    queries: [
      'userId=$userId',
    ],
    // filters: [
    //   // Filter.equal('userId', userId),
    // ],
  );

  // Pastikan data pengguna ditemukan.
  if (response.documents.isEmpty) {
    throw Exception('User not found');
  }

  // Kembalikan Document yang berisi data pengguna.
  return response.documents.first;
}

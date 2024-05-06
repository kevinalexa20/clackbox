import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:clackbox/common/services/appwrite_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:clackbox/features/users_profile/data/datasources/user_detail_service.dart';

class MockClient extends Mock implements AppWriteClient {}

void main() {
  group('getUserDetails', () {
    test('should return a Document', () async {
      // Arrange
      final client = MockClient();
      final userId = 'userId';
      // final document = Document();
      when(client.database.listDocuments(
        collectionId: 'usersDetails',
        databaseId: 'databaseID',
        queries: [Query.equal('userId=$userId', 'userId')],
      ));
      // Act
      // final result = await getUserDetails(userId);

      // Assert
      // expect(result, isA<Document>());
    });
  });
}

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:clackbox/constants/constants.dart';
import 'package:clackbox/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../models/models.dart';

final userAPIProvider = Provider((ref) {
  return UserAPI(
    db: ref.watch(appwriteDatabaseProvider),
    realtime: ref.watch(appwriteRealtimeProvider),
  );
});

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
  Future<model.Document> getUserData(String userId);
  Future<List<model.Document>> searchUserByName(String name);
  FutureEitherVoid updateUserData(UserModel userModel);
  Stream<RealtimeMessage> getLatestUserProfileData();
  FutureEitherVoid followUser(UserModel user);
  FutureEitherVoid addToFollowing(UserModel user);
}

class UserAPI implements IUserAPI {
  final Databases _db;
  final Realtime _realtime;
  UserAPI({
    required Databases db,
    required Realtime realtime,
  })  : _realtime = realtime,
        _db = db;

  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseID,
        collectionId: AppwriteConstants.usersDetailsCollectionId,
        documentId: userModel.userId,
        data: userModel.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  Future<model.Document> getUserData(String userId) {
    return _db.getDocument(
      databaseId: AppwriteConstants.databaseID,
      collectionId: AppwriteConstants.usersDetailsCollectionId,
      documentId: userId,
    );
  }

  @override
  Future<List<model.Document>> searchUserByName(String name) async {
    final documents = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseID,
      collectionId: AppwriteConstants.usersDetailsCollectionId,
      queries: [
        Query.search('name', name),
      ],
    );

    return documents.documents;
  }

  @override
  FutureEitherVoid updateUserData(UserModel userModel) async {
    try {
      await _db.updateDocument(
        databaseId: AppwriteConstants.databaseID,
        collectionId: AppwriteConstants.usersDetailsCollectionId,
        documentId: userModel.userId,
        data: userModel.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  Stream<RealtimeMessage> getLatestUserProfileData() {
    return _realtime.subscribe([
      'databases.${AppwriteConstants.databaseID}.collections.${AppwriteConstants.usersDetailsCollectionId}.documents'
    ]).stream;
  }

  @override
  FutureEitherVoid followUser(UserModel user) async {
    try {
      await _db.updateDocument(
        databaseId: AppwriteConstants.databaseID,
        collectionId: AppwriteConstants.usersDetailsCollectionId,
        documentId: user.userId,
        data: {
          'followers': user.followers,
        },
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  FutureEitherVoid addToFollowing(UserModel user) async {
    try {
      await _db.updateDocument(
        databaseId: AppwriteConstants.databaseID,
        collectionId: AppwriteConstants.usersDetailsCollectionId,
        documentId: user.userId,
        data: {
          'following': user.following,
        },
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}

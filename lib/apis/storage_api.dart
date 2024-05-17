import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:clackbox/constants/constants.dart';
import 'package:clackbox/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageAPIProvider = Provider((ref) {
  return StorageAPI(
    storage: ref.watch(appwriteStorageProvider),
  );
});

class StorageAPI {
  final Storage _storage;
  StorageAPI({required Storage storage}) : _storage = storage;

  Future<List<String>> uploadImage(List<File> files) async {
    List<String> imageLinks = [];
    for (final file in files) {
      // Upload image to Appwrite storage
      final uploadedImage = await _storage.createFile(
        bucketId: AppwriteConstants.imagesBucket,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: file.path),
      );
      imageLinks.add(
        AppwriteConstants.imageUrl(uploadedImage.$id),
      );
    }
    return imageLinks;
  }
}

import 'package:appwrite/appwrite.dart';
import 'package:fpdart/fpdart.dart';

//Interface for Auth API
abstract class IAuthApi {
  //menggunakan package fpdart, return nilai Either jika <gagal, sukses>
  Future<Either<String, Account>> signUp({
    required String email,
    required String password,
    required String name,
  });
}

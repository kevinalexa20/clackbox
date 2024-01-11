import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:clackbox/common/enum/state_status_enum.dart';
import 'package:clackbox/common/services/appwrite_client.dart';
import 'package:clackbox/features/Auth/data/models/login_model.dart';
import 'package:clackbox/features/Auth/data/models/register_model.dart';
import 'package:clackbox/features/Auth/data/models/user_model.dart';
import 'package:clackbox/features/Auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthRepository authRepository) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthAutoLoginEvent>((event, emit) async {
      final Either<String, UserModel?> result =
          await authRepository.autoLogin();

      result.fold((error) {
        emit(state.copyWith(
            stateStatus: StateStatus.error, errorMessage: error));
      }, (userModel) {
        emit(state.copyWith(
            stateStatus: StateStatus.loaded, userModel: userModel));
      });
    });
    on<AuthLoginEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final Either<String, UserModel> result =
          await authRepository.login(event.loginModel);

      result.fold((error) {
        emit(state.copyWith(
            stateStatus: StateStatus.error, errorMessage: error));

        emit(state.copyWith(stateStatus: StateStatus.loaded));
      }, (userModel) {
        emit(state.copyWith(
          stateStatus: StateStatus.loaded,
          userModel: userModel,
        ));
      });
    });
    on<AuthRegisterEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      //either <String = pesan error jika event(registrasi gagal), UserModel = data model user ditampilkan>
      final Either<String, UserModel> result =
          await authRepository.register(event.registerModel);

      //fold dari package dartz ini untuk menangani error dan success, jika error maka akan dijalankan fungsi (error), jika success maka akan dijalankan fungsi (userModel)
      result.fold((error) {
        emit(state.copyWith(
            stateStatus: StateStatus.error, errorMessage: error));

        emit(state.copyWith(stateStatus: StateStatus.loaded));
      }, (userModel) {
        emit(state.copyWith(
          stateStatus: StateStatus.loaded,
          userModel: userModel,
        ));
      });
      //print utk debugging
      print(result);
    });

    on<AuthLogoutEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      final Either<String, Unit> result = await authRepository.logout();

      result.fold((error) {
        emit(state.copyWith(
            stateStatus: StateStatus.error, errorMessage: error));
        emit(state.copyWith(stateStatus: StateStatus.loaded));
      }, (success) {
        emit(AuthState.initial());
      });
    });
  }
}

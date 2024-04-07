import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'byok_state.dart';

class ByokCubit extends Cubit<ByokState> {
  ByokCubit() : super(ByokInitial());
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc() : super(HomescreenInitial()) {
    on<HomescreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

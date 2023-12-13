part of 'homescreen_bloc.dart';

abstract class HomescreenState extends Equatable {
  const HomescreenState();  

  @override
  List<Object> get props => [];
}
class HomescreenInitial extends HomescreenState {}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'name_age_bloc.dart';

@immutable
abstract class NameAgeState extends Equatable {}

class NameAgeLoading extends NameAgeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NameAgeLoaded extends NameAgeState {
  final String name;
  final String age;
  final int count;
  NameAgeLoaded({
    required this.name,
    required this.age,
    required this.count,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [name, age, count];
}

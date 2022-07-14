// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gusse_name/services/getNameAgeService.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'name_age_event.dart';
part 'name_age_state.dart';

class NameAgeBloc extends Bloc<NameAgeEvent, NameAgeState> {
  final GetNameAgeService _getNameAgeService;
  NameAgeBloc(this._getNameAgeService) : super(NameAgeLoading()) {
    on<GetNameAgeEvent>((event, emit) async {
      NameAgeLoading();
      final getNameAge = await _getNameAgeService.getNameAge();
      emit(
        NameAgeLoaded(
          name: getNameAge.name,
          age: getNameAge.age.toString(),
          count: getNameAge.count,
        ),
      );
    });
  }
}

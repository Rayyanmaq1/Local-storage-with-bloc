import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_navigation_event.dart';
part 'custom_navigation_state.dart';

class CustomNavigationBloc
    extends Bloc<CustomNavigationEvent, CustomNavigationState> {
  CustomNavigationBloc(Object object)
      : super(const CustomNavigationState(tabIndex: 1)) {
    on<CustomNavigationEvent>((event, emit) {
      if (event is TabChange) {
        print(event);
        emit(CustomNavigationState(tabIndex: event.tabIndex));
      }
    });
  }
}

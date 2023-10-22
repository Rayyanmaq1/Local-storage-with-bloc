part of 'custom_navigation_bloc.dart';

abstract class CustomNavigationEvent {}

class TabChange extends CustomNavigationEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}

part of 'custom_navigation_bloc.dart';

abstract class LandingPageState {
  final int tabIndex;

  const LandingPageState({required this.tabIndex});
}

class CustomNavigationState extends LandingPageState {
  const CustomNavigationState({required super.tabIndex});
}

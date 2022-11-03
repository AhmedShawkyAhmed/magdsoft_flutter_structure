part of 'bottom_bar_navigator_cubit.dart';

class BottomBarNabigatorState extends Equatable {
  final List<Widget> screens = [
    SignOutView(),
    FavoriteView(),
    HomeView(),
    NotificationView(),
    SettingsView(),
  ];

  final int index;

  BottomBarNabigatorState({this.index = 2});

  @override
  List<Object> get props => [index];

  BottomBarNabigatorState copyWith(int? pageIndex) {
    return BottomBarNabigatorState(index: pageIndex ?? index);
  }
}

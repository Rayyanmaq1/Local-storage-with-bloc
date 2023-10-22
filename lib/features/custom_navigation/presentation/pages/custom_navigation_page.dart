import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/config/theme/app_colors.dart';
import 'package:movie_db/core/utils/text_style.dart';
import 'package:movie_db/features/custom_navigation/presentation/bloc/custom_navigation_bloc.dart';
import 'package:movie_db/features/upcoming_movies/presentation/pages/upcoming_movies_page.dart';
import 'package:movie_db/generated/assets.dart';
import 'package:movie_db/injection_container.dart';
import 'package:svg_flutter/svg_flutter.dart';

final icons = [
  Assets.dashBoardIcon,
  Assets.watchIcon,
  Assets.mediaLibraryIcon,
  Assets.moreIcon
];
final lable = [
  'Dash board',
  'Watch',
  'Media Library',
  'More',
];
const List<Widget> bottomNavScreen = <Widget>[
  Text('Coming soon Dash board'),
  UpcomingMoviePage(),
  Text('Coming soon Media Library'),
  Text('Coming soon More'),
];

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomNavigationBloc, CustomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
          bottomNavigationBar: Container(
            height: 80,
            decoration: const BoxDecoration(
              color: kRedisBrownColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 40),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => _barItems(
                      icon: icons[index],
                      title: lable[index],
                      selected: state.tabIndex == index,
                      onTapped: () {
                        BlocProvider.of<CustomNavigationBloc>(context)
                            .add(TabChange(tabIndex: index));
                      },
                    ),
                    itemCount: 4,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _barItems({
    required String title,
    required String icon,
    required bool selected,
    required Function onTapped,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTapped(),
      child: Container(
        // width: 60,
        // color: Colors.red,
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              color: selected ? kLightWhightColor : kGreyColor,
              height: 18,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: AppTextStyles.normal.copyWith(
                fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
                color: selected ? kLightWhightColor : kGreyColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

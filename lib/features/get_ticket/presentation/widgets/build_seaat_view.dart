import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_db/config/theme/app_colors.dart';
import 'package:movie_db/core/utils/seat_view.dart';
import 'package:movie_db/core/utils/text_style.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BuildSeatsView extends StatelessWidget {
  BuildSeatsView({
    super.key,
    required this.size,
    required this.selectedSeats,
  });

  final Size size;
  final Function selectedSeats;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.5,
      color: kLightWhightColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Zoom(
            backgroundColor: kLightWhightColor,
            initTotalZoomOut: true,
            child: StatefulBuilder(builder: (context, setState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < seatsView.length; i++) ...{
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (i + 1).toString(),
                          style: AppTextStyles.normal.copyWith(fontSize: 8),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        for (int j = 0; j < seatsView[i].length; j++) ...{
                          CupertinoButton(
                            color: kLightWhightColor,
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            borderRadius: BorderRadius.zero,
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              height: 9.5,
                              width: 9.5,
                              child: SvgPicture.asset(
                                'assets/icons/svg/seat_icon.svg',
                                color: seatsView[i][j] == 0
                                    ? kGoldenColor
                                    : seatsView[i][j] == 1
                                        ? kLightGreyColor
                                        : seatsView[i][j] == 2
                                            ? kPurpleColor
                                            : seatsView[i][j] == 3
                                                ? kLightBlueColor
                                                : Colors.transparent,
                              ),
                            ),
                            onPressed: () {
                              if (seatsView[i][j] != -1) {
                                if (seatsView[i][j] != 0 &&
                                    seatsView[i][j] != 1) {
                                  selectedSeats({
                                    'row': i,
                                    'col': j,
                                    'value': seatsView[i][j] + 1
                                  });
                                  setState(() {
                                    seatsView[i][j] = 0;
                                  });
                                }
                              }
                            },
                          ),
                        }
                      ],
                    )
                  }
                ],
              );
            }),
          ),
          Positioned(
              top: 40,
              width: size.width,
              child: SvgPicture.asset(
                'assets/icons/svg/screen_tile.svg',
                width: size.width,
              )),
          Positioned(
            top: 60,
            child: Text(
              'Screen',
              style: AppTextStyles.normal.copyWith(
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}

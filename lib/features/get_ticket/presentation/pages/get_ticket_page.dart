// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/config/theme/app_colors.dart';
import 'package:movie_db/core/utils/text_style.dart';
import 'package:movie_db/features/get_ticket/presentation/pages/book_ticket_page.dart';
import 'package:movie_db/features/get_ticket/presentation/widgets/build_seaat_view.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_entity.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg_flutter.dart';

class GetTicketPage extends StatelessWidget {
  GetTicketPage({super.key, required this.movieEntity});
  final MovieDetailEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kLightWhightColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: size.height * 0.15, child: _customAppBar(context)),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Date',
                  style: AppTextStyles.medium.copyWith(
                    color: kblackColor,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                height: size.height * 0.06,
                child: _buildDateView(),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                height: size.height * 0.3,
                child: _buildSeatView(),
              ),
            ],
          ),
          Column(
            children: [
              CupertinoButton(
                onPressed: () {
                  _bookSeatsPressed(context, movieEntity);
                },
                minSize: 0,
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    color: kLightBlueColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: size.width * 0.9,
                  height: size.height * 0.07,
                  child: Center(
                    child: Text(
                      'Select Seats',
                      style:
                          AppTextStyles.semiBold.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _customAppBar(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CupertinoButton(
                  minSize: 0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: kGreyColor,
                  ),
                ),
                Text(
                  movieEntity.title!,
                  style: AppTextStyles.medium.copyWith(
                    color: kblackColor,
                    fontSize: 16,
                  ),
                ),
                const Icon(
                  Icons.arrow_back_ios,
                  color: kWhiteColor,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'In theaters ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(movieEntity.releaseDate.toString()))}',
            style: AppTextStyles.medium.copyWith(
              color: kLightBlueColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  final List datest = [
    '4 May',
    '5 May',
    '6 May',
    '7 May',
    '8 May',
    '9 May',
    '10 May'
  ];
  final List seatView = [
    {
      'time': '12:30',
      'top_title': 'Cinetech + hall 1',
      'price': '50\$',
      'bounce': '2500 bonus',
    },
    {
      'time': '13:30',
      'top_title': 'Cinetech + hall 1',
      'price': '75\$',
      'bounce': '2500 bonus',
    },
    {
      'time': '14:30',
      'top_title': 'Cinetech + hall 1',
      'price': '100\$',
      'bounce': '2500 bonus',
    },
    {
      'time': '15:30',
      'top_title': 'Cinetech + hall 1',
      'price': '120\$',
      'bounce': '2500 bonus',
    },
  ];
  int selected = 0, slectedSeatView = 0;

  _buildDateView() {
    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < 5; i++) ...{
              CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      boxShadow: i == selected
                          ? [
                              BoxShadow(
                                  color: kLightBlueColor.withOpacity(0.2),
                                  offset: const Offset(1, 1),
                                  spreadRadius: 5,
                                  blurRadius: 1),
                            ]
                          : [],
                      color: selected == i ? kLightBlueColor : kLightGreyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(
                      left: i == 0 ? 24 : 12,
                      right: (i == datest.length) ? 24 : 0,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                    child: Center(
                        child: Text(
                      datest[i],
                      style: AppTextStyles.semiBold.copyWith(
                        fontSize: 12,
                        color: selected == i ? kWhiteColor : kblackColor,
                      ),
                    )),
                  ),
                  onPressed: () {
                    setState(() {
                      selected = i;
                    });
                  }),
            },
          ],
        ),
      );
    });
  }

  _buildSeatView() {
    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < seatView.length; i++) ...{
              Container(
                margin: EdgeInsets.only(
                  left: i == 0 ? 24 : 12,
                  right: (i == datest.length) ? 24 : 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          seatView[i]['time'],
                          style: AppTextStyles.semiBold.copyWith(
                            color: kblackColor,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          seatView[i]['top_title'],
                          style: AppTextStyles.normal.copyWith(
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          boxShadow: i == slectedSeatView
                              ? [
                                  BoxShadow(
                                      color: kGreyColor.withOpacity(0.1),
                                      offset: const Offset(1, 1),
                                      spreadRadius: 5,
                                      blurRadius: 1),
                                ]
                              : [],
                          border: Border.all(
                            color: slectedSeatView == i
                                ? kLightBlueColor
                                : kLightGreyColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 18),
                        child: Image.asset('assets/icons/images/seat_view.png'),
                      ),
                      onPressed: () {
                        setState(() {
                          slectedSeatView = i;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'From '),
                          TextSpan(
                            text: seatView[i]['price'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: ' or '),
                          TextSpan(
                            text: seatView[i]['bounce'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            },
          ],
        ),
      );
    });
  }

  void _bookSeatsPressed(BuildContext context, MovieDetailEntity movieEntity) {
    Navigator.pushNamed(context, '/bookSeats', arguments: movieEntity);
  }
}

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/config/theme/app_colors.dart';
import 'package:movie_db/core/utils/seat_view.dart';
import 'package:movie_db/core/utils/text_style.dart';
import 'package:movie_db/features/get_ticket/presentation/widgets/build_seaat_view.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_entity.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:zoom_widget/zoom_widget.dart';

class BookTicket extends StatefulWidget {
  BookTicket({super.key, required this.movieEntity});
  final MovieDetailEntity movieEntity;

  @override
  State<BookTicket> createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  List selectedSeat = [];

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
              BuildSeatsView(
                size: size,
                selectedSeats: (value) {
                  setState(() {
                    selectedSeat.add(value);
                  });
                },
              ),
            ],
          ),
          _buildBottomInfo(size, context, selectedSeat),
        ],
      ),
    );
  }

  Container _buildBottomInfo(
      Size size, BuildContext context, List selectedSeat) {
    int totalPrice = 0;
    for (var e in selectedSeat) {
      if (e['value'] == 3) {
        totalPrice += 150;
      } else if (e['value'] == 4) {
        totalPrice += 50;
      }
    }

    return Container(
      color: kWhiteColor,
      height: size.height * 0.35,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SeatInfoWidget(
                    title: 'Selected',
                    color: kGoldenColor,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const SeatInfoWidget(
                    title: 'VIP (150\$)',
                    color: kPurpleColor,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SeatInfoWidget(
                    title: 'Not available',
                    color: kLightGreyColor,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const SeatInfoWidget(
                    title: 'Regular (50\$)',
                    color: kLightBlueColor,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SizedBox(
            height: size.height * 0.04,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: selectedSeat.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: kLightGreyColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(left: index != 0 ? 8 : 0),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
                    child: Center(
                      child: Text(
                        '${selectedSeat[index]['row']}/${selectedSeat[index]['col']}',
                        style: AppTextStyles.medium,
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kLightGreyColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: size.width * 0.3,
                height: size.height * 0.07,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style: AppTextStyles.normal.copyWith(
                        color: kGreyColor,
                      ),
                    ),
                    Text(
                      '\$ $totalPrice',
                      style: AppTextStyles.semiBold.copyWith(
                        color: kblackColor,
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                onPressed: () {},
                minSize: 0,
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    color: kLightBlueColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: size.width * 0.6,
                  height: size.height * 0.07,
                  child: Center(
                    child: Text(
                      'Proceed to pay',
                      style:
                          AppTextStyles.semiBold.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
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
                  widget.movieEntity.title!,
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
            'In theaters ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(widget.movieEntity.releaseDate.toString()))}',
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

  void _bookSeatsPressed(BuildContext context, MovieDetailEntity movieEntity) {
    Navigator.pushNamed(context, '/bookSeats', arguments: movieEntity);
  }
}

class SeatInfoWidget extends StatelessWidget {
  const SeatInfoWidget({
    super.key,
    required this.color,
    required this.title,
  });
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/svg/seat_icon.svg',
            color: color,
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            title,
            style: AppTextStyles.normal.copyWith(
              color: kGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}

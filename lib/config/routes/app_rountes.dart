import 'package:flutter/material.dart';
import 'package:movie_db/features/custom_navigation/presentation/pages/custom_navigation_page.dart';
import 'package:movie_db/features/get_ticket/presentation/pages/book_ticket_page.dart';
import 'package:movie_db/features/get_ticket/presentation/pages/get_ticket_page.dart';
import 'package:movie_db/features/movie_detail/domain/entity/movie_detail_entity.dart';
import 'package:movie_db/features/movie_detail/presentaion/pages/movie_detail_page.dart';
import 'package:movie_db/features/movie_detail/presentaion/pages/trailer_page.dart';
import 'package:movie_db/features/upcoming_movies/presentation/pages/upcoming_movies_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const CustomNavigation());
      case '/upcoming_movies':
        return _materialRoute(const UpcomingMoviePage());

      case '/movieDetail':
        return _materialRoute(MovieDetailPage(id: settings.arguments as int));

      case '/watchTrailer':
        return _materialRoute(
            TrailerPage(videoUrl: settings.arguments as List<String>));
      case '/getTicketPage':
        return _materialRoute(GetTicketPage(
            movieEntity: settings.arguments as MovieDetailEntity));
      case '/bookSeats':
        return _materialRoute(
            BookTicket(movieEntity: settings.arguments as MovieDetailEntity));

      default:
        return _materialRoute(const UpcomingMoviePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

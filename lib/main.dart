import 'package:flutter/material.dart';
import 'package:movie_db/config/routes/app_rountes.dart';
import 'package:movie_db/config/theme/app_theme.dart';
import 'package:movie_db/features/custom_navigation/presentation/bloc/custom_navigation_bloc.dart';
import 'package:movie_db/features/custom_navigation/presentation/pages/custom_navigation_page.dart';
import 'package:movie_db/features/movie_detail/presentaion/bloc/bloc/movie_detail_bloc.dart';
import 'package:movie_db/features/movie_detail/presentaion/bloc/bloc/movie_detail_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/features/upcoming_movies/presentation/bloc/local/local_upcoming_movies_bloc.dart';
import 'package:movie_db/features/upcoming_movies/presentation/bloc/remote/remote_upcoming_movies_bloc.dart';
import 'package:movie_db/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const CustomNavigation(),
      ),
    );
  }

  List<BlocProvider> _getProviders() => [
        BlocProvider<CustomNavigationBloc>(
          create: (_) => CustomNavigationBloc(_),
        ),
        BlocProvider<LocalUpcomingMoviesBloc>(
          create: (BuildContext context) =>
              sl()..add(const GetLocalUpcomingMovies()),
        ),
        BlocProvider<RemoteUpcomingMoviesBloc>(
          create: (BuildContext context) =>
              sl()..add(const GetUpcomingMovies()),
        ),
        BlocProvider<RemoteMovieDetailBloc>(
          create: (BuildContext context) => sl()
            ..add(
              const RemoteGetMovieDetailEvent(movieID: 0),
            ),
        ),
      ];
}

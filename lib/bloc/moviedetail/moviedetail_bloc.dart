import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tentwentyflutterasgn/data/repositories/repository.dart';
import 'package:tentwentyflutterasgn/data/response/MovieDetailResponse.dart';
import 'package:tentwentyflutterasgn/data/response/MovieVideosResponse.dart';

part 'moviedetail_event.dart';

part 'moviedetail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final Repository repository;

  MovieDetailBloc({required this.repository}) : super(DashboardLoading()) {
    on<Initialize>((event, emit) async {
      emit(Initial());
    });

    on<LoadMovieDetailEvent>((event, emit) async {
      MovieDetailResponse? response = MovieDetailResponse();

      if (await InternetConnectionChecker().hasConnection) {
        response = await repository.GetMovieDetail(event.movieId);
        if (response != null) {
          emit(MoviesDetailLoadedState(response));
        }
      }
      //emit(Initial());
    });

    on<LoadMovieVideosEvent>((event, emit) async {
      MovieVideosResponse? response = MovieVideosResponse();

      if (await InternetConnectionChecker().hasConnection) {
        response = await repository.GetMovieVideos(event.movieId);
        if (response != null) {
          String? k = response.results!
              .firstWhere((element) => element.type == "Trailer")
              .key;
          emit(MoviesVideosLoadedState(response));
        }
      }
    });
  }
}

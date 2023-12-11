import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tentwentyflutterasgn/data/model/UpcomingMovieResult.dart';
import 'package:tentwentyflutterasgn/data/repositories/repository.dart';
import 'package:tentwentyflutterasgn/data/response/UpComingMoviesResponse.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Repository repository;

  DashboardBloc({required this.repository}) : super(DashboardLoading()) {
    on<Initialize>((event, emit) async {
      emit(Initial());
    });

    on<LoadUpcommingMoviesEvent>((event, emit) async {
      UpComingMoviesResponse? response = UpComingMoviesResponse();
      if (await InternetConnectionChecker().hasConnection) {
        response = await repository.GetUpcommingMovies();
        if (response != null && response.results != null) {
          emit(MoviesListLoadedState(response.results));
        }
      }
      //emit(Initial());
    });

    on<SearchMoviesEvent>((event, emit) async {
      UpComingMoviesResponse? response = UpComingMoviesResponse();
      if (await InternetConnectionChecker().hasConnection) {
        response = await repository.SearchMovies(event.query);
        if (response != null && response.results != null) {
          emit(MoviesSearchedState(response.results));
        }
      }
      //emit(Initial());
    });

    on<SearchButtonClickEvent>((event, emit) async {
      emit(SearchbuttonClickedState());
    });
  }
}

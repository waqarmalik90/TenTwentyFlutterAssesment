import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tentwentyflutterasgn/data/response/MovieDetailResponse.dart';
import 'package:tentwentyflutterasgn/data/response/MovieVideosResponse.dart';
import 'package:tentwentyflutterasgn/data/response/UpComingMoviesResponse.dart';
import 'package:tentwentyflutterasgn/widgets/common_widgets.dart';

class Repository {
  static String apiKey = "6b96205f5124b089a2686f562356d1de";
  static String imageUrl = "https://image.tmdb.org/t/p/original";
  String upcomming_movies_url =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${apiKey}";
  String movie_detail_url = "https://api.themoviedb.org/3/movie/";
  String movie_search_url = "https://api.themoviedb.org/3/search/movie?query=";

  final headers = {'Content-Type': 'application/json'};

  Future<UpComingMoviesResponse?> GetUpcommingMovies() async {
    try {
      final response =
          await http.get(Uri.parse(upcomming_movies_url), headers: headers);

      if (response.statusCode == 200) {
        UpComingMoviesResponse upComingMoviesResponse =
            UpComingMoviesResponse.fromJson(json.decode(response.body));
        return upComingMoviesResponse;
      } else {
        throw Exception('Invalid request');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
      //print(e);
    }
  }

  Future<MovieDetailResponse?> GetMovieDetail(int movieId) async {
    try {
      final response = await http.get(
          Uri.parse("$movie_detail_url$movieId?api_key=${apiKey}"),
          headers: headers);

      if (response.statusCode == 200) {
        MovieDetailResponse movieDetailResponse =
            MovieDetailResponse.fromJson(json.decode(response.body));
        return movieDetailResponse;
      } else {
        throw Exception('Invalid request');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
      //print(e);
    }
  }

  Future<MovieVideosResponse?> GetMovieVideos(int movieId) async {
    try {
      final response = await http.get(
          Uri.parse("$movie_detail_url$movieId/videos?api_key=${apiKey}"),
          headers: headers);

      if (response.statusCode == 200) {
        MovieVideosResponse movieVideosResponse =
            MovieVideosResponse.fromJson(json.decode(response.body));
        return movieVideosResponse;
      } else {
        throw Exception('Invalid request');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
      //print(e);
    }
  }

  Future<UpComingMoviesResponse?> SearchMovies(String query) async {
    try {
      final response = await http.get(
          Uri.parse("$movie_search_url$query&api_key=$apiKey"),
          headers: headers);

      if (response.statusCode == 200) {
        UpComingMoviesResponse upComingMoviesResponse =
            UpComingMoviesResponse.fromJson(json.decode(response.body));
        return upComingMoviesResponse;
      } else {
        throw Exception('Invalid request');
      }
    } catch (e) {
      CommonWidget().showToast(e.toString(), 1);
      return null;
      //print(e);
    }
  }
}

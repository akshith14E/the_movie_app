import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/exceptions/SearchException.dart';
import 'package:flutter_task/models/movie_model.dart';
import 'package:http/http.dart';

final movieListProviderProvider =
    StateNotifierProvider<MovieListController, AsyncValue<List<Movie>>>((ref) {
  return MovieListController();
});

class MovieListController extends StateNotifier<AsyncValue<List<Movie>>> {
  final url = 'https://www.omdbapi.com/?&apikey=ad0aa456';
  MovieListController() : super(AsyncData([]));

  getData() async {
    state = AsyncLoading();
    final _url = Uri.parse(url + '&s=john&page=1');
    final Response response = await get(_url);
    if (response.statusCode == 200) {
      List<Movie> movieList = [];
      final body = jsonDecode(response.body);
      final resultList = body['Search'] as List;
      for (var e in resultList) {
        final Movie movie = Movie.fromJson(e);
        print(movie.Title);
        movieList.add(movie);
      }
      state = AsyncData([...movieList]);
    }
  }

  getMovieInfo(String id) async {
    final _url = Uri.parse(url + '&i=$id&plot=full');
    final Response res = await get(_url);
    if (res.statusCode == 200) {
      Movie movie = Movie.fromJson(jsonDecode(res.body));
      print(movie);
      return movie;
    }
    return;
  }
}

final movieFeedProvider =
    StateNotifierProvider<MovieFeedList, AsyncValue<List<Movie>>>((ref) {
  return MovieFeedList();
});

class MovieFeedList extends MovieListController {
  @override
  getData() {}
  int page = 1;
  int totalResults = 0;
  var _url;
  bool isQuering = false;
  bool showSnackBar = true;

  searchUsingName({required String title, String? year}) async {
    state = AsyncLoading();
    page = 1;
    _url = url + '&s=$title&y=$year';
    final Response res = await get(Uri.parse(_url + '&page=$page'));

    final result = jsonDecode(res.body);
    if (res.statusCode == 200) {
      if (result['Response'] == 'True') {
        totalResults = int.parse(result['totalResults']);
        List<Movie> movieList = [];
        final resultList = result['Search'] as List;
        for (var e in resultList) {
          final Movie movie = Movie.fromJson(e);
          print(movie.Title);
          movieList.add(movie);
        }
        state = AsyncData([...movieList]);
      } else {
        state = AsyncData([]);
        throw SearchException(result['Error']);
      }
    }
  }

  getMoreResults() async {
    print(totalResults);
    isQuering = true;
    page++;

    if (page <= totalResults / 10) {
      showSnackBar = true;
      print(_url);
      final Response res = await get(Uri.parse(_url + '&page=$page'));

      final result = jsonDecode(res.body);
      if (res.statusCode == 200) {
        if (result['Response'] == 'True') {
          List<Movie> movieList = [];
          final resultList = result['Search'] as List;
          for (var e in resultList) {
            final Movie movie = Movie.fromJson(e);
            print(movie.Title);
            movieList.add(movie);
          }
          state = AsyncData([...state.data!.value, ...movieList]);
        }
      } else {
        throw SearchException(result['Error']);
      }
      isQuering = false;
    } else {
      isQuering = false;
      showSnackBar = false;
      throw SearchException('No more Results');
    }
  }
}

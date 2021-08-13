import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/movie_list_controller.dart';
import 'package:flutter_task/models/movie_model.dart';
import 'package:flutter_task/routes/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

class MovieTile extends StatelessWidget {
  final List<Movie> movies;
  final ScrollController? scrollController;
  const MovieTile({Key? key, required this.movies, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          controller: scrollController,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return movieTile(context, movies[index], index);
          }),
    );
  }
}

Container movieTile(BuildContext context, Movie movie, int index) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
    height: MediaQuery.of(context).size.height / 3,
    decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3 * 1.2,
          width: MediaQuery.of(context).size.width / 2.4,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(
                imageErrorBuilder: (a1, a2, a3) {
                  return Container(
                    child: Center(
                      child: Text('error loading image'),
                    ),
                  );
                },
                fit: BoxFit.fill,
                placeholder: AssetImage('assets/images/movie.jfif'),
                image: NetworkImage(movie.Poster)),
          ),
        ),
        Expanded(
          //child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title: ${movie.Title}',
                  style: GoogleFonts.dancingScript(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.yellow),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Type: ${movie.Type}',
                  style: GoogleFonts.dancingScript(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Year: ${movie.Year}',
                  style: GoogleFonts.dancingScript(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow)),
                      onPressed: () async {
                        final getmovie = await context
                            .read(movieListProviderProvider.notifier)
                            .getMovieInfo(movie.imdbID);
                        context.router.push(
                            MovieInfoRoute(movie: getmovie, index: index));
                      },
                      child: Center(
                        child: Text(
                          'More Info',
                          style: GoogleFonts.dancingScript(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        //)
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_task/models/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieInfo extends StatelessWidget {
  final Movie movie;
  final int index;
  const MovieInfo({Key? key, required this.movie, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.5)),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: FadeInImage(
                            imageErrorBuilder: (a1, a2, a3) {
                              return Container();
                            },
                            fit: BoxFit.fitWidth,
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
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(movie.imdbRating!)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    movie.Plot!,
                    style: GoogleFonts.roboto(fontSize: 20, wordSpacing: 2),
                  ))
            ],
          ),
        ));
  }
}

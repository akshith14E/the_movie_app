import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/controllers/movie_list_controller.dart';
import 'package:flutter_task/exceptions/SearchException.dart';
import 'package:flutter_task/widgets/custom_text_field.dart';
import 'package:flutter_task/widgets/movie_list_builder.dart';
import 'package:flutter_task/widgets/submit_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';

class MovieFeed extends StatefulWidget {
  MovieFeed({Key? key}) : super(key: key);

  @override
  _MovieFeedState createState() => _MovieFeedState();
}

class _MovieFeedState extends State<MovieFeed> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String movieName = '';
  String year = '';
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focus1 = FocusNode();
  final FocusNode _focus2 = FocusNode();

  @override
  void initState() {
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent / 1.2 &&
          !_scrollController.position.outOfRange &&
          !context.read(movieFeedProvider.notifier).isQuering) {
        try {
          await context.read(movieFeedProvider.notifier).getMoreResults();
        } catch (e) {
          if (e is SearchException) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.message ?? '')));
          }
        }
      }
    });
    super.initState();
  }

  void updateState(int c, String value) {
    switch (c) {
      case 1:
        setState(() {
          movieName = value;
        });
        return;
      case 2:
        setState(() {
          year = value;
        });
        return;
      default:
        return;
    }
  }

  String? validateYear(value) {
    if (value == '') {
      return null;
    }
    final int v = int.parse(value);
    print('called');
    if (v > 2021 || v < 1950) {
      return 'enter valid year';
    }
  }

  String? validateMovieName(value) {
    if (value == '') return 'enter name';
  }

  onSubmit() async {
    _focus1.unfocus();
    _focus2.unfocus();
    context.router.pop();
    if (formKey.currentState!.validate()) {
      print('hello');
      final searchNameList = movieName.split(' ');
      var searchName = '';
      if (searchNameList.length == 1) {
        searchName = searchNameList[0];
      } else {
        for (var n in searchNameList) {
          if (searchName == '') {
            searchName = n;
          } else {
            searchName = searchName + '+$n';
          }
        }
      }
      try {
        await context
            .read(movieFeedProvider.notifier)
            .searchUsingName(title: searchName, year: year);
      } catch (e) {
        if (e is SearchException) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.message ?? '')));
        }
      }
    } else {
      print('not hello');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MovieFeed',
          style: GoogleFonts.dancingScript(
              fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer(builder: (context, watch, child) {
        return watch(movieFeedProvider).when(
            data: (data) {
              if (data.length == 0) {
                return Center(
                  child: Text('Searching using search icon  below'),
                );
              } else {
                return MovieTile(
                    movies: data, scrollController: _scrollController);
              }
            },
            loading: () => CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                ),
            error: (e, _) {
              return Container();
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  custumTextField(
                                      context,
                                      Icons.movie,
                                      'moviename',
                                      false,
                                      validateMovieName,
                                      updateState,
                                      1,
                                      _focus1),
                                  custumTextField(
                                      context,
                                      Icons.alarm,
                                      'year',
                                      false,
                                      validateYear,
                                      updateState,
                                      2,
                                      _focus2,
                                      keyboard:
                                          TextInputType.numberWithOptions()),
                                  Text('*year is not mandotory'),
                                  submitButton(context, onSubmit, 'submit')
                                ],
                              ))
                        ],
                      ),
                    ),
                  ));
        },
        child: Icon(Icons.search),
      ),
    );
  }
}

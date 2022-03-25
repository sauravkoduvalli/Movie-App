/// This screen view the movies list according to the genres of movies
/// Each movie genres is a listview which move horizontally

import 'package:flutter/material.dart';
import 'package:movie_app_ihits/models/movie_model.dart';
import 'package:movie_app_ihits/screens/second_scree.dart';
import 'package:movie_app_ihits/service/data_service.dart';
import 'package:movie_app_ihits/utils/constants.dart';
import 'package:movie_app_ihits/utils/ui_helper.dart';
import 'package:movie_app_ihits/widgets/card_widget.dart';
import 'package:page_transition/page_transition.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<MoviewModelClass> movieList = [];
  List<String> genreList = [];

  List<MoviewModelClass> genresData(genre) {
    List<MoviewModelClass> list = [];
    try {
      for (var i = 0; i < movieList.length; i++) {
        if (movieList[i].genres.contains(genre)) {
          list.add(movieList[i]);
        }
      }
      return list;
    } catch (e) {
      return list;
    }
  }

  Future<List<String>> moviesData() async {
    try {
      movieList = await getMovieData();
      List<String> genre = getGerner(movieList);
      // genreList = genre..sort();
      genreList = genre.toSet().toList();
      return genreList;
    } on Exception catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    // DataService data = DataService();
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Demo App',
          // style: headerTextStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<String>>(
          future: moviesData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView.builder(
                  // reverse: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 3),
                          child: Text(genreList[index], style: bodyText1),
                        ),
                        // UIHelper.verticalSpaceSmall(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: genresData(snapshot.data![index]).length,
                            itemBuilder: (BuildContext context, int i) {
                              return UIWidgets.cardView(
                                  movieDetails:
                                      genresData(snapshot.data?[index])[i],
                                  context: context,
                                  ontap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: MovieDetailsScreen(
                                          movieData: genresData(
                                              snapshot.data?[index])[i],
                                        ),
                                        type: PageTransitionType.fade,
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                        UIHelper.verticalSpaceExtraSmall(),
                      ],
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went Wrong!'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

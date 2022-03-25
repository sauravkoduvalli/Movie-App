import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:movie_app_ihits/models/movie_model.dart';
import 'package:movie_app_ihits/utils/constants.dart';
import 'package:movie_app_ihits/utils/ui_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MoviewModelClass movieData;

  const MovieDetailsScreen({
    Key? key,
    required this.movieData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              ClipRRect(
                child: Image(
                  image: NetworkImage(movieData.image.original),
                  fit: BoxFit.fill,
                  height: screenHeight * 0.5,
                  width: screenWidth,
                ),
              ),
              UIHelper.verticalSpaceSmall(),
              // movie details
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // moview name
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        movieData.name.toString(),
                        style: bodyText1,
                      ),
                    ),
                    // movie summery
                    Html(data: movieData.summary, style: {
                      "body": Style(
                        color: Colors.white,
                        fontSize: FontSize.medium,
                        textAlign: TextAlign.justify,
                      ),
                    }),
                    UIHelper.verticalSpaceSmall(),
                    // rating
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Rating: ${movieData.rating.average.toString()}',
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    // genre
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Genre: ${movieData.genres.toString()}',
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    // officail site
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            'Language: ${movieData.language.toString()}',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),

                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            'Visit official site: ',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url = movieData.officialSite.toString();
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              movieData.officialSite.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

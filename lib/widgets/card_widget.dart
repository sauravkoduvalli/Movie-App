import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class UIWidgets {
  static Widget cardView({
    required MoviewModelClass movieDetails,
    required BuildContext context,
    required Function ontap,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SizedBox(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image(
              image: NetworkImage(movieDetails.image.medium),
              fit: BoxFit.cover,
              // height: 200,
              height: screenHeight * 0.18,
              width: screenWidth * 0.4,
            ),
          ),
        ),
      ),
    );
  }
}

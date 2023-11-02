import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget customLoading() => LoadingAnimationWidget.flickr(
      leftDotColor: const Color(0xfffd0079),
      rightDotColor: Colors.black,
      size: 25,
    );

Widget errorIcon() => const Icon(
      Icons.image_not_supported_rounded,
      color: Colors.grey,
    );

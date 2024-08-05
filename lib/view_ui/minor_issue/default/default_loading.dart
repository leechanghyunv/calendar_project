
import 'default_dialog.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget DefaultLoading() => DefaultDialog(
  msg: '로딩중 ......',
  children: [
    Spacer(),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Spacer(),
  ],
);
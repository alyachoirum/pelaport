import 'package:flutter/material.dart';

class Slide {
  final String? imageUrl;
  final String? title;
  final String? gambar;
  final String? description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.gambar,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: '',
    title: 'SEGMENTS',
    gambar: 'assets/images/slide1.png',
    description:
        'Dapat melapor dimanapun anda berada dan merupakan sebuah aplikasi pelaporan real time khusus area kerja PT.Petrokimia Gresik',
  ),
  Slide(
    imageUrl: '',
    title: 'SEGMENTS',
    gambar: 'assets/images/slide2.png',
    description:
        'Semua elemen dapat melihat merupakan sebuah aplikasi pelaporan real time khusus area kerja PT.Petrokimia Gresik',
  ),
  Slide(
    imageUrl: '',
    title: 'SEGMENTS',
    gambar: 'assets/images/slide3.png',
    description:
        'Mudah digunakan dan efisien merupakan sebuah aplikasi pelaporan real time khusus area kerja PT.Petrokimia Gresik',
  ),
];

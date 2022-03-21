import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pelaport/additionpage/detail/presensi.dart';
import 'package:pelaport/additionpage/detail/presensiKeluar.dart';
import 'package:pelaport/apicontroller.dart';
import 'package:pelaport/constant.dart';
import 'package:pelaport/function/route.dart';
import 'package:pelaport/my_function.dart';

class ListPresensi extends StatefulWidget {
  const ListPresensi({Key? key}) : super(key: key);

  @override
  _ListPresensiState createState() => _ListPresensiState();
}

class _ListPresensiState extends State<ListPresensi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondarycolor,
        appBar: AppBar(
          leading: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: primarycolor,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: secondarycolor,
          elevation: 0,
          title: Text(
            "List Presensi",
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView());
  }
}

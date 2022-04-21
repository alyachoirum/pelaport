import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pelaport/additionpage/absen.dart';
import 'package:pelaport/additionpage/pengajuan.dart';
import 'package:pelaport/constant.dart';
import 'package:pelaport/function/route.dart';
import 'package:pelaport/views/homes/homes.dart';
import 'package:pelaport/additionpage/kehadiran.dart';
import 'package:pelaport/views/home/widget/tab.dart';
import 'package:pelaport/views/laporan/tambah.dart';
import 'package:pelaport/views/notifikasi/notifikasi.dart';
import 'package:pelaport/views/list_data/list_data.dart';
import 'package:pelaport/views/profile/profile.dart';
import 'package:pelaport/views/schedule/schedule.dart';

import '../../my_function.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

final tabs = ['Home', 'Jadwal', 'Data', 'Profile'];

class _MainScreenState extends State<MainScreen> {
  bool exit2 = false;
  int selectedPosition = 0;
  List<Widget> listWidget = [
    Homes(),
    Schedule(
      title: 'Jadwal Kerja',
    ),
    // Cari(),
    ListData(),
    Profile(),
  ];
  late BuildContext context;
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          if (exit2 == false) {
            setState(() {
              exit2 = true;
              Future.delayed(Duration(seconds: 2))
                  .then((value) => exit2 = false);
            });
            Fluttertoast.showToast(msg: "Tap 2 times to exit");
            return Future.value(false);
          } else {
            Fluttertoast.showToast(msg: "Exit");
            return Future.value(true);
          }
        },
        child: Builder(
          builder: (BuildContext context) {
            this.context = context;
            return listWidget[selectedPosition];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primarycolor,
        onPressed: _showBottomSheet,
        child: Icon(opened == false ? Icons.add : Icons.close),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomTab(),
    );
  }

  _showBottomSheet() {
    setState(
      () {
        if (opened == false) {
          opened = true;
          Scaffold.of(context).showBottomSheet<void>((BuildContext context) {
            return GestureDetector(
              onHorizontalDragStart: (_) {},
              onVerticalDragUpdate: (_) {},
              onVerticalDragStart: (_) {},
              onHorizontalDragCancel: () {},
              onVerticalDragCancel: () {},
              onVerticalDragEnd: (_) {},
              onVerticalDragDown: (_) {},
              behavior: HitTestBehavior.opaque,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: lebarlayar / 7, vertical: tinggilayar / 20),
                  height: tinggilayar / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Color(0xFFEFEFEF),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet();
                              pindahPageCupertino(context, Kehadiran());
                            },
                            child: Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: tinggilayar / 20,
                                        width: lebarlayar / 5,
                                        child: Image.asset("assets/hadir.png")),
                                    Text(
                                      "Kehadiran",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              tinggilayar / lebarlayar * 5),
                                    ),
                                  ],
                                ),
                              ),
                              height: tinggilayar / 9,
                              width: lebarlayar / 3.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet();
                              pindahPageCupertino(context, Absen());
                            },
                            child: Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: tinggilayar / 20,
                                        width: lebarlayar / 5,
                                        child: Image.asset("assets/absen.png")),
                                    Text(
                                      "Absen",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              tinggilayar / lebarlayar * 5),
                                    ),
                                  ],
                                ),
                              ),
                              height: tinggilayar / 9,
                              width: lebarlayar / 3.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet();
                              pindahPageCupertino(context, Pengajuan());
                            },
                            child: Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: tinggilayar / 20,
                                      width: lebarlayar / 5,
                                      child: Image.asset(
                                        "assets/pengajuan.png",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Text(
                                      "Pengajuan",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              tinggilayar / lebarlayar * 5),
                                    ),
                                  ],
                                ),
                              ),
                              height: tinggilayar / 9,
                              width: lebarlayar / 3.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              _showBottomSheet();
                              pindahPageCupertino(context, TambahLaporan());
                              // MyFunction().belumTersedia();
                            },
                            child: Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: tinggilayar / 20,
                                      width: lebarlayar / 5,
                                      child: Image.asset(
                                        "assets/laporan.png",
                                      ),
                                    ),
                                    Text(
                                      "Pelaporan",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              tinggilayar / lebarlayar * 5),
                                    ),
                                  ],
                                ),
                              ),
                              height: tinggilayar / 9,
                              width: lebarlayar / 3.5,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  )),
                ),
              ),
            );
          }, backgroundColor: Colors.black.withOpacity(0.2));
        } else {
          opened = false;
          Navigator.pop(context);
        }
      },
    );
  }

  _buildBottomTab() {
    return Container(
      width: lebarlayar,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 3,
            color: Color(0xffC8C6C6),
          ),
        ],
      ),
      child: BottomAppBar(
        elevation: 10,
        color: Color(0xffEFEFEF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TabItem(
              text: tabs[0],
              icon: Icons.home,
              isSelected: selectedPosition == 0,
              onTap: () {
                setState(() {
                  selectedPosition = 0;
                });
              },
            ),
            TabItem(
              text: tabs[1],
              icon: CupertinoIcons.calendar_today,
              isSelected: selectedPosition == 1,
              onTap: () {
                setState(() {
                  selectedPosition = 1;
                });
              },
            ),
            SizedBox(
              width: lebarlayar / 10,
            ),
            TabItem(
              text: tabs[2],
              icon: CupertinoIcons.doc_text,
              isSelected: selectedPosition == 2,
              onTap: () {
                setState(() {
                  selectedPosition = 2;
                });
              },
            ),
            TabItem(
              text: tabs[3],
              icon: CupertinoIcons.person_fill,
              isSelected: selectedPosition == 3,
              onTap: () {
                setState(() {
                  selectedPosition = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pelaport/additionpage/detail/presensi.dart';
import 'package:pelaport/additionpage/detail/presensiKeluar.dart';
import 'package:pelaport/additionpage/kehadiran.dart';
import 'package:pelaport/additionpage/list_data_detail/list_presensi_detail.dart';
import 'package:pelaport/apicontroller.dart';
import 'package:pelaport/constant.dart';
import 'package:pelaport/function/route.dart';
import 'package:pelaport/my_function.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListPresensi extends StatefulWidget {
  const ListPresensi({Key? key}) : super(key: key);

  @override
  _ListPresensiState createState() => _ListPresensiState();
}

class _ListPresensiState extends State<ListPresensi> {
  String _nik = '';
  Map<int,String> bulan = {
    1:'Januari',
    2:'Februari',
    3:'Maret',
    4:'April',
    5:'Mei',
    6:'Juni',
    7:'Juli',
    8:'Agustus',
    9:'September',
    10:'Oktober',
    11:'November',
    12:'Desember'
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }
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
        body: SingleChildScrollView(
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              for(int i=1;i <= bulan.length;i++) 
                LitleCardFunction(
                  fungsi: (){
                    pindahPageCupertino(context, ListPresensiDetail(bulan:i.toString(),nik:_nik.toString(),judul: "Presensi Bulan "+bulan[i].toString(),));
                  }, 
                  judul: bulan[i].toString()
                ),
              
            ],
            ),
        ));
  }
  init() async {
    String nik = await MyFunction().getNik();
    print('$nik');
    setState(() {
      _nik = nik;
    });
  }
}

class LitleCardFunction extends StatelessWidget {
  final String judul;
  final VoidCallback fungsi;
  final bool disable;
  const LitleCardFunction(
      {Key? key,
      required this.fungsi,
      required this.judul,
      this.disable = false,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: marginhorizontal),
        height: tinggilayar/12,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              spreadRadius: 3,
              blurRadius: 10,
              color: Color(0xffEFEFEF),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                judul,
                style: TextStyle(
                    color: disable ? Colors.grey : primarycolor,
                    fontSize: tinggilayar / lebarlayar * 9,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      onTap: fungsi,
    );
  }
}

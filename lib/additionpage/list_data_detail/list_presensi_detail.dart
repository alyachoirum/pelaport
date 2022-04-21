import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pelaport/additionpage/detail/presensi.dart';
import 'package:pelaport/additionpage/detail/presensiKeluar.dart';
import 'package:pelaport/apicontroller.dart';
import 'package:pelaport/constant.dart';
import 'package:pelaport/function/route.dart';
import 'package:pelaport/my_function.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListPresensiDetail extends StatefulWidget {
  final String bulan;
  final String nik;
  final String judul;
  const ListPresensiDetail({Key? key, required this.bulan,required this.nik,required this.judul}) : super(key: key);

  @override
  _ListPresensiDetailState createState() => _ListPresensiDetailState();
}

class _ListPresensiDetailState extends State<ListPresensiDetail> {
  String _nik = '';
  String _bulan = '1';
  String _judul = '';
  int position = 1 ;
  @override
  void initState() {
    // TODO: implement initState
    // init();
    _bulan = widget.bulan;
    _nik = widget.nik;
    _judul = widget.judul;
    super.initState();
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
        body:IndexedStack(
            index: position,
            children: <Widget>[
      
            WebView(
                  initialUrl: 'http://$baseUrl/webview/detail_presensi/$_bulan?nik=$_nik',
                  javascriptMode: JavascriptMode.unrestricted,
                  onProgress: (int progress) {
                    print("MyLog WebView is loading (progress : $progress%)");
                  },
                  onPageStarted: (String url) {
                    setState(() {
                          position = 1;
                        });
                    print('Page started loading: $url');
                  },
                  onPageFinished: (String url) {
                    // setState(() {
                    //   mapLoading = false;
                    // });
                    setState(() {
                          position = 0;
                        });
                    print('MyLog age finished loading: $url');
                  },
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  new Factory<OneSequenceGestureRecognizer>(() => new EagerGestureRecognizer(),),].toSet(),
                ),
      
            Container(
              child: Center(
                child: CircularProgressIndicator()),
              ),
              
            ])
        );
  }
  init() async {
    String nik = await MyFunction().getNik();
    print('$nik');
    setState(() {
      _nik = nik;
      _bulan = widget.bulan;
    });
  }
}



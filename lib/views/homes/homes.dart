import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pelaport/constant.dart';
import 'package:pelaport/function/route.dart';
import 'package:pelaport/views/home/detail_laporan/detail_laporan.dart';
import 'package:pelaport/views/home/detail_pengumuman/detail_pengumuman.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:pelaport/views/schedule/utils.dart';

class Homes extends StatefulWidget {
  Homes({Key? key}) : super(key: key);
  

  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  void initState() {
    super.initState();
    setkEvents();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondarycolor,
        elevation: 0,
        title: Container(
          margin: EdgeInsets.only(right: lebarlayar / 50),
          width: double.infinity,
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: tinggilayar / lebarlayar * 9),
                children: [
                  TextSpan(text: 'Hi ', style: TextStyle(color: Colors.orange)),
                  TextSpan(
                      text: dataUser['karyawan']['nama_lengkap'],
                      style: TextStyle(
                          color: primarycolor, fontWeight: FontWeight.bold))
                ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: tinggilayar / 50),
              height: tinggilayar / 3.8,
              width: lebarlayar,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (BuildContext) =>
                                  DetailPengumuman(index: i)));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Container(
                              child: Hero(
                                tag: "gambar" + i.toString(),
                                child: Image.network(
                                  "https://asset.kompas.com/crops/xH4ZacmnhLzdDQ3QqQ2pUFCEbUc=/0x0:0x0/750x500/data/photo/2021/08/15/6118e55147fb1.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: double.infinity,
                              height: tinggilayar / 6,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                top: lebarlayar / 50,
                                left: lebarlayar / 30,
                                right: lebarlayar / 30),
                            child: Text(
                              "Kunjungan Kerja Menteri BUMN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: tinggilayar / lebarlayar * 6.5),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: lebarlayar / 30,
                                top: lebarlayar / 50,
                                right: lebarlayar / 30),
                            child: Text(
                              "JAKARTA, KOMPAS.com - Menteri Badan Usaha Milik Negara (BUMN) Erick Thohir mengatakan, PT Petrokimia Gresik telah mengaktifkan kembali pabrik produksi oksigen Air Separation Plant (ASP). Hal ini dilakukan melihat tingginya kebutuhan oksigen untuk penanganan para pasien Covid-19 di Indonesia. ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: tinggilayar / lebarlayar * 5.5),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(right: lebarlayar / 20),
                      width: lebarlayar / 1.35,
                      height: tinggilayar / 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              spreadRadius: 1,
                              color: Colors.grey.shade300)
                        ],
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                    left: lebarlayar / 20, bottom: tinggilayar / 50),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: lebarlayar / 20),
              width: lebarlayar,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lokasi RealTime",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: tinggilayar / lebarlayar * 9),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: tinggilayar / 50,
            ),
            Container(
              height: 300,
              child: WebView(
                initialUrl: 'http://$baseUrl/maps/android/absen',
                javascriptMode: JavascriptMode.unrestricted,
                onProgress: (int progress) {
                  print("MyLog WebView is loading (progress : $progress%)");
                },
                onPageStarted: (String url) {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                  print('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  // setState(() {
                  //   mapLoading = false;
                  // });
                  print('MyLog age finished loading: $url');
                },
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                new Factory<OneSequenceGestureRecognizer>(() => new EagerGestureRecognizer(),),].toSet(),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class CardWithImage extends StatelessWidget {
  final String? title;
  final String? deskripsi;
  final String? publisher;
  final String? image;
  final String? index;
  final VoidCallback? onTap;

  const CardWithImage(
      {Key? key,
      this.index,
      this.onTap,
      this.title,
      this.deskripsi,
      this.publisher,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 3,
                color: Colors.grey.shade300),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: tinggilayar / 5,
              width: lebarlayar / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: "gmbr" + index!,
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: lebarlayar / 50,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(lebarlayar / 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          color: primarycolor,
                          fontSize: tinggilayar / lebarlayar * 7,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      deskripsi!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(fontSize: tinggilayar / lebarlayar * 5),
                    ),
                    Text(
                      "Publisher by: " + publisher!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: tinggilayar / lebarlayar * 4,
                          color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        margin: EdgeInsets.only(
            bottom: tinggilayar / 50,
            left: lebarlayar / 20,
            right: lebarlayar / 20),
        height: tinggilayar / 5,
        width: lebarlayar,
      ),
    );
  }
}

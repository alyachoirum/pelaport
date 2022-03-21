import 'package:flutter/material.dart';
import 'package:pelaport/constant.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  final List<Map> notifikasi = List.generate(
      10,
      (index) => {
            "id": index,
            "notif": "Notifikasi Laporan Approv ${index}",
            "gambar":
                "https://dl.hiapphere.com/data/icon/201605/HiAppHere_com_com.kendamasoft.notificationmanager.png"
          });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Notifikasi"),
      ),
      body: Container(
        height: tinggilayar / 1.25,
        child: ListView.builder(
            itemCount: notifikasi.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.symmetric(
                    vertical: lebarlayar / 40, horizontal: marginhorizontal),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notifikasi[index]["notif"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: tinggilayar / lebarlayar * 6,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "8 hour ago",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: tinggilayar / lebarlayar * 6),
                    ),
                  ],
                ),
                leading: Image.network(notifikasi[index]["gambar"]),
              );
            }),
      ),
    );
  }
}

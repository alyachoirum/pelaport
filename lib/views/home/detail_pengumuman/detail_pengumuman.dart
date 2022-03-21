import 'package:flutter/material.dart';
import 'package:pelaport/constant.dart';

class DetailPengumuman extends StatefulWidget {
  final int index;
  const DetailPengumuman({Key? key, required this.index}) : super(key: key);

  @override
  _DetailPengumumanState createState() => _DetailPengumumanState();
}

class _DetailPengumumanState extends State<DetailPengumuman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: primarycolor,
        ),
        elevation: 0,
        backgroundColor: secondarycolor,
        title: Text(
          "Pengumuman",
          style: TextStyle(color: primarycolor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: tinggilayar / 15,
                padding: EdgeInsets.symmetric(horizontal: marginhorizontal),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 30,
                        foregroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHUvOd8Q-VihyupbJCdgjIR2FxnjGtAgMu3g&usqp=CAU"),
                      ),
                    ),
                    SizedBox(
                      width: lebarlayar / 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Publisher",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: tinggilayar / lebarlayar * 8),
                        ),
                        Text(
                          "2 m ago",
                          style:
                              TextStyle(fontSize: tinggilayar / lebarlayar * 5),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.87,
                minChildSize: 0.87,
                maxChildSize: 1,
                builder: (BuildContext context, listController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: ListView(
                      padding: EdgeInsets.symmetric(),
                      controller: listController,
                      children: [
                        Container(
                          width: lebarlayar,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40)),
                            child: Hero(
                              tag: "gambar" + widget.index.toString(),
                              child: Image.network(
                                "https://asset.kompas.com/crops/xH4ZacmnhLzdDQ3QqQ2pUFCEbUc=/0x0:0x0/750x500/data/photo/2021/08/15/6118e55147fb1.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: marginhorizontal,
                              vertical: marginhorizontal),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Judul Pengumumuan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: tinggilayar / lebarlayar * 10),
                              ),
                              SizedBox(
                                height: tinggilayar / 30,
                              ),
                              Text(
                                "JAKARTA — Menteri Badan Usaha Milik Negara (BUMN) Erick Thohir mengapresiasi respons cepat yang dilakukan Petrokimia Gresik di tengah kebutuhan oksigen medis yang tinggi di Jawa Timur. Pengaktifan kembali Pabrik Air Separation Plant (ASP) merupakan aksi nyata orientasi pelayanan yang dilakukan perusahaan pelat merah kepada masyarakat yang membutuhkan. Hal tersebut dinyatakan Erick saat meresmikan operasionalisasi ASP yang terletak di kawasan industri Petrokimia Gresik, Jawa Timur, Ahad (15/8). Dalam kunjungan yang didampingi Direktur Utama Petrokimia Gresik Dwi Satriyo Annurogo, Erick melihat fasilitas yang terakhir beroperasi pada 2010 tersebut berfungsi kembali demi memenuhi kebutuhan oksigen medis di Jawa Timur yang setiap harinya mencapai 407 ton. “Saya mengapresiasi dan salut atas respons cepat yang dilakukan Petrokimia Gresik dalam menerjemahkan fungsi service oriented kepada masyarakat di tengah pandemi ini. Apalagi, mereka menghidupkan kembali fasilitas yang sudah 10 tahun lebih berhenti sehingga kini memiliki nilai manfaat yang besar dan tanpa investasi untuk memenuhi kebutuhan oksigen medis di Jatim yang masih tinggi, kata Erick, Ahad (15/8). Fasilitas ASP di Petrokimia Gresik ini pertama kali dibangun pada 1992 dan terakhir beroperasi pada April 2010. Seiring keinginan Kementerian BUMN agar perusahaan pelat merah memberikan peran aktif dan layanan masif untuk membantu rakyat selama pandemi, Petrokimia Gresik memulai program pengefektifan kembali fasilitas tersebut pada Juli 2021.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: tinggilayar / lebarlayar * 8),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        height: tinggilayar / 1,
        width: lebarlayar,
        padding: EdgeInsets.symmetric(vertical: marginhorizontal),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pelaport/additionpage/detail/presensi.dart';
import 'package:pelaport/class/form_component.dart';
import 'package:pelaport/constant.dart';
import 'package:pelaport/home.dart';
import 'package:pelaport/my_function.dart';
import 'package:pelaport/views/home/home.dart';
import 'package:pelaport/views/login/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool buttongridclicked = false;
  bool buttonlistclicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: tinggilayar / 50),
            height: tinggilayar / 1.1,
            width: lebarlayar,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  child: Text(
                    "Profil",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primarycolor,
                        fontSize: tinggilayar / lebarlayar * 12),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.all(marginhorizontal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              foregroundImage: NetworkImage(
                                protokol +
                                    baseUrl +
                                    "/assets/foto_profil/" +
                                    dataUser['karyawan']['user']['foto'],
                              ),
                            ),
                            SizedBox(
                              width: lebarlayar / 20,
                            ),
                            Container(
                              width: lebarlayar / 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataUser['karyawan']['pt'],
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: tinggilayar / lebarlayar * 6),
                                  ),
                                  Text(
                                    dataUser['karyawan']['nama_lengkap'],
                                    style: TextStyle(
                                        fontSize: tinggilayar / lebarlayar * 7,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    dataUser['karyawan']['zona']['nama_zona'],
                                    style: TextStyle(
                                        color: primarycolor,
                                        fontSize: tinggilayar / lebarlayar * 5),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: tinggilayar / 60,
                        ),
                        Container(
                          width: lebarlayar / 1.3,
                          child: Text(
                            "Nomor Induk Karyawan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: tinggilayar / lebarlayar * 6),
                          ),
                        ),
                        SizedBox(
                          height: tinggilayar / 100,
                        ),
                        Container(
                          width: lebarlayar / 1.3,
                          child: Text(
                            dataUser['karyawan']['nik'],
                            style: TextStyle(
                                fontSize: tinggilayar / lebarlayar * 6),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 2,
                              color: Colors.grey.shade400),
                        ]),
                    height: tinggilayar / 3.4,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        vertical: tinggilayar / 15,
                        horizontal: marginhorizontal),
                  ),
                ),
                Positioned(
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(
                                //   "24",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.white,
                                //       fontSize: tinggilayar / lebarlayar * 10),
                                // ),
                                // Text(
                                //   "Menunggu",
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: tinggilayar / lebarlayar * 5),
                                // )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(
                                //   "12",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.white,
                                //       fontSize: tinggilayar / lebarlayar * 10),
                                // ),
                                // Text(
                                //   "Proses",
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: tinggilayar / lebarlayar * 5),
                                // )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(
                                //   "21",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       color: Colors.white,
                                //       fontSize: tinggilayar / lebarlayar * 10),
                                // ),
                                // Text(
                                //   "Selesai",
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: tinggilayar / lebarlayar * 5),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: tinggilayar / 10,
                    width: lebarlayar / 1.7,
                    margin: EdgeInsets.symmetric(vertical: tinggilayar / 3.4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: primarycolor),
                  ),
                ),
                Positioned(
                  right: 32,
                  child: ElevatedButton(
                      onPressed: () async {
                        await MyFunction().logout();
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }), (route) => false);
                      },
                      child: Icon(Icons.exit_to_app)),
                ),

                // SizedBox.expand(
                //   child: DraggableScrollableSheet(
                //     initialChildSize: 0.5,
                //     minChildSize: 0.5,
                //     maxChildSize: 1,
                //     builder: (BuildContext context, listController) {
                //       return Container(
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(40),
                //             topRight: Radius.circular(40),
                //           ),
                //         ),
                //         child: ListView(
                //           padding: EdgeInsets.only(bottom: tinggilayar / 15),
                //           // padding: EdgeInsets.symmetric(),
                //           controller: listController,
                //           children: [
                //             SizedBox(
                //               height: tinggilayar / 80,
                //             ),
                //             Container(
                //               margin: EdgeInsets.symmetric(
                //                   horizontal: lebarlayar / 3),
                //               color: Colors.grey,
                //               height: 5,
                //             ),
                //             SizedBox(
                //               height: tinggilayar / 30,
                //             ),
                //             Container(
                //               padding: EdgeInsets.symmetric(
                //                   horizontal: lebarlayar / 30),
                //               child: Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Container(
                //                     width: lebarlayar / 3,
                //                     child: Text(
                //                       "Laporan Saya",
                //                       style: TextStyle(
                //                           fontSize:
                //                               tinggilayar / lebarlayar * 7),
                //                     ),
                //                   ),
                //                   Row(
                //                     children: [
                //                       GestureDetector(
                //                           onTap: () {
                //                             setState(() {
                //                               buttongridclicked = true;
                //                               buttonlistclicked = false;
                //                             });
                //                           },
                //                           child: Icon(Icons.grid_view)),
                //                       SizedBox(
                //                         width: lebarlayar / 50,
                //                       ),
                //                       GestureDetector(
                //                           onTap: () {
                //                             setState(
                //                               () {
                //                                 buttongridclicked = false;
                //                                 buttonlistclicked = true;
                //                               },
                //                             );
                //                           },
                //                           child: Icon(Icons.list_rounded)),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             SizedBox(
                //               height: tinggilayar / 40,
                //             ),
                //             if (buttonlistclicked == true)
                //               for (var i = 0; i < 20; i++)
                //                 CardWithImage(
                //                   index: i.toString(),
                //                   title: "Ini Laporan",
                //                   deskripsi:
                //                       "Lorem ipsum dolor sit amet saf ardcf adfsds tufjedw dsdsd dsahdda shauhsau sbhausha suasu",
                //                   publisher: "Admin",
                //                   image:
                //                       "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                //                 )
                //             else
                //               Container(
                //                 padding: EdgeInsets.symmetric(
                //                     horizontal: lebarlayar / 30),
                //                 height: tinggilayar / 1,
                //                 child: GridView.builder(
                //                   gridDelegate:
                //                       SliverGridDelegateWithMaxCrossAxisExtent(
                //                           maxCrossAxisExtent: 200,
                //                           childAspectRatio: 2 / 2,
                //                           crossAxisSpacing: 20,
                //                           mainAxisSpacing: 20),
                //                   itemBuilder: (context, indext) {
                //                     return Container(
                //                       decoration: BoxDecoration(
                //                           borderRadius:
                //                               BorderRadius.circular(10)),
                //                       child: ClipRRect(
                //                         borderRadius: BorderRadius.circular(20),
                //                         child: Image.network(
                //                           "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                //                           fit: BoxFit.cover,
                //                         ),
                //                       ),
                //                     );
                //                   },
                //                 ),
                //               )
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

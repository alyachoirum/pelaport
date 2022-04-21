import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pelaport/additionpage/absen.dart';
import 'package:pelaport/additionpage/detail/presensi.dart';
import 'package:pelaport/class/public_function.dart';
import 'package:pelaport/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:pelaport/class/form_component.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pelaport/apicontroller.dart';

class Sakit extends StatefulWidget {
  const Sakit({Key? key}) : super(key: key);

  @override
  _SakitState createState() => _SakitState();
}

class _SakitState extends State<Sakit> {
  final deskripsiController = TextEditingController();
  final dateController = TextEditingController();

  List dataFoto = [];
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFileList;
  dynamic _pickImageError;

  Future datepicker() async {
    final DateTime? tgl = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (tgl != null) {
      dateController.text = tgl.toString().substring(0, 10);
    }
  }

  Future getImage() async {
    try {
      final pickedFileList = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 20,
      );
      setState(() {
        _imageFileList = pickedFileList;
      });

      print(_imageFileList);
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: primarycolor,
            ),
          ),
        ),
        title: Text(
          "Form Sakit",
          style: TextStyle(color: primarycolor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InfoUser(),
            SizedBox(
              height: 20,
            ),
            myContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("Tanggal Absen"),
                SizedBox(
                  height: 4,
                ),
                CustomTextFormField(
                  controller: dateController,
                  isDatePicker: true,
                  isReadonly: true,
                  placeholder: "Pilih Tanggal",
                  isRequired: true,
                  onTap: datepicker,
                )
              ],
            )),
            SizedBox(
              height: 16,
            ),
            myContainer(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  label("Deskripsi"),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    isLongText: true,
                    controller: deskripsiController,
                    placeholder: "Masukkan Deskripsi",
                    isRequired: true,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            myContainer(
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  label("Foto Bukti Sakit"),
                  IconButton(
                      onPressed: () {
                        getImage();
                      },
                      icon: Icon(CupertinoIcons.photo_camera))
                ],
              ),
              SizedBox(
                height: 4,
              ),
              _imageFileList != null
                  ? Image.file(File(_imageFileList!.path))
                  : Container()
            ])),
            SizedBox(
              height: 32,
            ),
            PrimaryButton(
              warna: Colors.white,
              onClick: () {
                save();
              },
              teksnya: 'K I R I M',
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String label) {
    return Text(
      label,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget myContainer(Widget append) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      child: Padding(padding: EdgeInsets.all(16), child: append),
    );
  }

  Future save() async {
    String base64 =
        await PublicFunction().convertImageToBase64(File(_imageFileList!.path));

    BotToast.showLoading(
        clickClose: false, allowClick: false, crossPage: false);

    Map<String, String> body = {
      'nama_lengkap': data['karyawan']['nama_lengkap'].toString(),
      'user_id_penerima':
          data['karyawan']['jabatan']['atasan_1']['user']['id_user'].toString(),
      'tgl_absen': dateController.text,
      'tipe_absen': "Sakit",
      'detail_absen': deskripsiController.text,
      'foto': base64
    };

    print(body);
    await ApiController().sakitSubmit(body).then((response) {
      var value = response.data;
      BotToast.closeAllLoading();

      Navigator.pop(context);

      BotToast.showText(
          text: "Berhasil mengajukan form sakit",
          crossPage: true,
          textStyle: TextStyle(fontSize: 14, color: Colors.white),
          contentColor: Colors.green);
    });
  }

  Future init() async {
    await ApiController().getUser().then((value) {
      if (mounted)
        setState(() {
          data = value.data;
          print("data=$data");
        });
    });
  }
}

class BoxDeskripsi extends StatelessWidget {
  const BoxDeskripsi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 1),
              spreadRadius: 0,
              blurRadius: 5,
              color: Colors.grey.shade400)
        ],
      ),
      width: lebarlayar,
      padding: EdgeInsets.symmetric(
          horizontal: marginhorizontal, vertical: tinggilayar / 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deskripsi"),
          SizedBox(
            height: tinggilayar / 50,
          ),
          TextFormField(
            maxLines: 6,
            decoration: InputDecoration(
              fillColor: Colors.grey[200],
              hintText: "Deskripsi Disini...",
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}

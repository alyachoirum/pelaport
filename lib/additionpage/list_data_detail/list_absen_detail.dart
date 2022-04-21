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

class ListAbsenDetail extends StatefulWidget {
  final String tipe;
  final String nik;
  final String judul;
  const ListAbsenDetail({Key? key, required this.tipe,required this.nik,required this.judul}) : super(key: key);

  @override
  _ListAbsenDetailState createState() => _ListAbsenDetailState();
}

class _ListAbsenDetailState extends State<ListAbsenDetail> {
  String _nik = '';
  String _tipe = '0';
  String _judul = '';
  int position = 1 ;
  List<dynamic> _dataAbsen = [];
  @override
  void initState() {
    // TODO: implement initState
    // init();
    _getDataAbsen(widget.tipe.toString(),widget.nik);
    _tipe = widget.tipe;
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
            "List Absen",
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
  scrollDirection: Axis.vertical,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: _createDataTable()
    ),
        ),
      );
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _createColumns(), 
      rows: _createRows(),
      showBottomBorder: true,
    );
  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('No')),
      DataColumn(label: Text('Tgl Absen')),
      DataColumn(label: Text('NIK')),
      DataColumn(label: Text('Nama')),
      DataColumn(label: Text('Tipe Absen')),
      DataColumn(label: Text('Kajaga')),
    ];
  }
  List<DataRow> _createRows() {
    if(_dataAbsen.length > 0){
    int num = 0;
    return _dataAbsen.map((data){
            num++;
            return DataRow(cells: [
              DataCell(Text(num.toString())),
              DataCell(Text(data['tgl_absen'].toString())),
              DataCell(Text(data['nik'])),
              DataCell(Text(data['karyawan']['nama_lengkap'])),
              DataCell(Text(data['tipe_absen'])),
              DataCell(Text(""))
            ]);
            }
            )
        .toList();
    }else{
      return [
      DataRow(cells: [
        DataCell(Text('Data Tidak ada')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text('')),
        DataCell(Text(''))
      ]),
    ];
    }
  }
  init() async {
    String nik = await MyFunction().getNik();
    print('$nik');
    setState(() {
      _nik = nik;
      _tipe = widget.tipe;
    });
  }

  Future _getDataAbsen(String tipe, String nik) async{
    Map<String,String> body = {
      'tipe' : tipe,
      'nik' : nik
    };
    var response = await ApiController().getDataAbsen(body);
    if(response.status){
      if(response.data.length > 0){
        // print(response.data.isList);
        setState(() {
          _dataAbsen = response.data;
        });
      }
    }
    
  }
}



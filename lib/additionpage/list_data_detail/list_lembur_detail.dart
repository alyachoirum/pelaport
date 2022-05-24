
import 'package:flutter/material.dart';
import 'package:pelaport/apicontroller.dart';
import 'package:pelaport/constant.dart';
import 'package:pelaport/my_function.dart';

class ListLemburDetail extends StatefulWidget {
  final String tipe;
  final String nik;
  final String judul;
  const ListLemburDetail({Key? key, required this.tipe,required this.nik,required this.judul}) : super(key: key);

  @override
  _ListLemburDetailState createState() => _ListLemburDetailState();
}

class _ListLemburDetailState extends State<ListLemburDetail> {
  // ignore: unused_field
  String _nik = '';
  // ignore: unused_field
  String _tipe = '0';
  String _judul = '';
  int position = 1 ;
  List<dynamic> _dataLembur = [];
  @override
  void initState() {
    // init();
    _getDataLembur(widget.tipe.toString(),widget.nik);
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
            "List Lembur",
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("$_judul"),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _createDataTable()
                ),
            ),
          ],
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
      DataColumn(label: Text('Tgl Lembur')),
      DataColumn(label: Text('NIK')),
      DataColumn(label: Text('Nama')),
      DataColumn(label: Text('Kajaga')),
    ];
  }
  List<DataRow> _createRows() {
    if(_dataLembur.length > 0){
    int num = 0;
    return _dataLembur.map((data){
            num++;
            return DataRow(cells: [
              DataCell(Text(num.toString())),
              DataCell(Text(data['tgl_lembur'].toString())),
              DataCell(Text(data['nik'])),
              DataCell(Text(data['karyawan']['nama_lengkap'])),
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

  Future _getDataLembur(String tipe, String nik) async{
    Map<String,String> body = {
      'tipe' : tipe,
      'nik' : nik
    };
    var response = await ApiController().getDataLembur(body);
    if(response.status){
      if(response.data.length > 0){
        // print(response.data.isList);
        setState(() {
          _dataLembur = response.data;
        });
      }
    }
    
  }
}



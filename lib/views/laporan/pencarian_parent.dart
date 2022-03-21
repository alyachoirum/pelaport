import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pelaport/apicontroller.dart';

class PencarianParent extends StatefulWidget {
  final String? tipe; //tipe adalah kategori, departemen
  const PencarianParent({Key? key, @required this.tipe}) : super(key: key);

  @override
  _PencarianParentState createState() => _PencarianParentState();
}

class _PencarianParentState extends State<PencarianParent> {
  List data = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cari ${widget.tipe}"),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, i) {
            return widget.tipe == "kategori"
                ? ListTile(
                    title: Text(data[i]['nama_kategori']),
                    onTap: () {
                      Navigator.pop(context, data[i]);
                    },
                  )
                : ListTile(
                    title: Text(data[i]),
                    onTap: () {
                      Navigator.pop(context, data[i]);
                    },
                  );
          }),
    );
  }

  Future init() async {
    BotToast.showLoading(
        crossPage: false, allowClick: false, clickClose: false);
    await ApiController().pencarianParent().then((value) {
      if (mounted) setState(() => data = value[widget.tipe]);

      BotToast.closeAllLoading();
    });
  }
}

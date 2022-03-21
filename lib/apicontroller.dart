import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:http/http.dart' as http;
import 'package:pelaport/constant.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class ApiController {
  late Response response;
  var dio = Dio();

  Future connection(
      {String method = "get",
      String path = "",
      Map<String, String>? body}) async {
    Uri url;

    BotToast.showLoading();

    // if (protokol == 'https://')
    //   url = Uri.https(baseUrl, "api/" + path);
    // else

    url = Uri.http(baseUrl, "api/" + path);
    var res;

    if (method == "get") {
      res = await http.get(url).then((response) {
        var body = jsonDecode(response.body);
        print(body);
        return body;
      });
    } else {
      res = await http.post(url, body: body).then((response) {
        var body = jsonDecode(response.body);

        print(body);
        return body;
      });
    }

    return res;
  }

  Future pencarianParent() async {
    return await connection(method: "get", path: "laporan/create");
  }

  Future laporanStore(Map<String, String> body) async {
    return await connection(method: 'post', path: "laporan", body: body);
  }

  Future login(Map<String, String> body) async {
    return await connection(method: 'post', path: "login", body: body);
  }

  Future checklistPresensi(Map<String, String> body) async {
    return await connection(
        method: 'post', path: "user/checklist_presensi", body: body);
  }

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var idregu = prefs.getString('id_regu');
    var idKar = prefs.getString('id_karyawan');
    response = await dio.get(protokol + baseUrl + '/api/user/get_user',
        queryParameters: {'id_karyawan': idKar, 'id_regu': idregu});

    return response.data;
    // return await connection(
    //     method: "get", path: "user/get_user?id_karyawan=447&id_regu=2");
  }

  Future checkin(var body) async {
    print(body);
    try {
      var formData = FormData.fromMap(body);
      response = await dio.post(protokol + baseUrl + '/api/user/checkin',
          data: formData);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future checkout({required String id_presensi}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = {'id_presensi': id_presensi};

    try {
      var formData = FormData.fromMap(body);
      response = await dio.post(protokol + baseUrl + '/api/user/checkout',
          data: formData);
      print("cekout=${response.data}");
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future getJamMasuk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nik = prefs.getString('nik');
    response = await dio.post(
        protokol + baseUrl + '/api/user/checklist_jammasuk',
        queryParameters: {'nik': nik});
    print("jam ${response.data}");
    return response.data;
    // return await connection(
    //     method: "get", path: "user/get_user?id_karyawan=447&id_regu=2");
  }

  Future ijinSubmit(Map<String, String> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nik = prefs.getString('nik');
    body['nik'] = nik.toString();

    return await connection(
        method: 'post', path: "user/ijin_submit", body: body);
  }

  Future dispensasiSubmit(Map<String, String> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nik = prefs.getString('nik');
    body['nik'] = nik.toString();
    return await connection(
        method: 'post', path: "user/dispensasi_submit", body: body);
  }

  Future sakitSubmit(Map<String, String> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nik = prefs.getString('nik');
    body['nik'] = nik.toString();
    return await connection(
        method: 'post', path: "user/sakit_submit", body: body);
  }

  Future cutiSubmit(Map<String, String> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nik = prefs.getString('nik');
    body['nik'] = nik.toString();
    return await connection(
        method: 'post', path: "user/cuti_submit", body: body);
  }

  Future lemburSubmit(Map<String, String> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nik = prefs.getString('nik');
    body['nik'] = nik.toString();
    return await connection(
        method: 'post', path: "user/lembur_submit", body: body);
  }

  Future lemburkhususSubmit(Map<String, String> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nik = prefs.getString('nik');
    body['nik'] = nik.toString();
    return await connection(
        method: 'post', path: "user/lemburkhusus_submit", body: body);
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

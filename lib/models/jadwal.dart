import 'package:equatable/equatable.dart';

class Jadwal extends Equatable {
  final int id_jadwal;
  final int tanggal;
  final int bulan;
  final int tahun;
  final int pattern_number;
  final String jam_masuk;
  final String jam_keluar;
  final String action;

  Jadwal({
    required this.id_jadwal,
    required this.tanggal,
    required this.bulan,
    required this.tahun,
    required this.pattern_number,
    required this.jam_masuk,
    required this.jam_keluar,
    required this.action,
  });

  @override
  List<Object?> get props => [id_jadwal];

  factory Jadwal.fromJson(Map<String, dynamic> json){
    return Jadwal(
      id_jadwal: json['id_jadwal'],
      tanggal:json['tanggal'],
      bulan:json['bulan'],
      tahun:json['tahun'],
      pattern_number:json['pattern_number'],
      jam_masuk:json['jam_masuk'],
      jam_keluar:json['jam_keluar'],
      action: json['action']
    );
  }
}
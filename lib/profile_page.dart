import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class Tugas {
  String tugas;
  DateTime deadline;
  bool status;

  Tugas({required this.tugas, required this.deadline, this.status = false});
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController tugasController = TextEditingController();
  final key = GlobalKey<FormState>();
  List<Tugas> daftarTugas = [];
  DateTime? selectedDate;

  
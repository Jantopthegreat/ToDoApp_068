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

  void addData() {
    if (key.currentState!.validate()) {
      if (selectedDate == null) {
        setState(() {});
        return;
      }
      setState(() {
        daftarTugas.add(
          Tugas(tugas: tugasController.text, deadline: selectedDate!),
        );
        tugasController.clear();
        selectedDate = null;
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }
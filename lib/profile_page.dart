import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final key = GlobalKey<FormState>();
  List<String> daftarNama = [];

  void addData(){
    setState(() {
      daftarNama.add(nameController.text);
    });
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                spacing: 15,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/fotogantenk.jpg'),
                  ),
                  Text('Yung Jan Never Broke Again', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height: 20),
              Form(
                key: key,
                child: Row(
                  spacing: 15,
                  children: [
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Nama masih Kosong!';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        label: Text('Nama Pendaftar'), 
                        hintText: 'Masukan Nama Anda'),
                      )
                    ),
                    OutlinedButton(onPressed: (){
                      if (key.currentState!.validate()){
                        addData();
                      }
                    }, child: Text("Submit")),
                  ],      
                ),
              ),
              Expanded(
                child: (daftarNama.isEmpty) ? Center(child: Text('Data Kosong')) :
                ListView.builder(
                  itemCount: daftarNama.length, 
                  itemBuilder: (context, index)
                {
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(daftarNama[index])],
                  )
                  );
                  
                },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
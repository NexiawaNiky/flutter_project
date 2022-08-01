import 'package:flutter/material.dart';
import 'package:flutter_project/SecondRoute.dart';

class FormRegistration extends StatefulWidget {
  const FormRegistration({Key? key}) : super(key: key);

  @override
  State<FormRegistration> createState() => _FormRegistrationState();
}

class _FormRegistrationState extends State<FormRegistration> {
  TextEditingController ctrUsername = new TextEditingController();
  TextEditingController ctrPassword = new TextEditingController();
  int id = 1;
  String myPhone = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Registration"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),

              SizedBox(height: 20,),
              Text("Pilih Jenis Kelamin", style: TextStyle(fontSize: 15),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        id = 1;
                      });

                    }
                  ),
                  Text("Male")
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        id = 2;
                      });
                    },
                  ),
                  Text("Female")
                ],
              ),
              Text("Phone: "+myPhone),
              ElevatedButton(onPressed: () async {
                final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
                );

                print("hasil input phone number : "+result.toString());
                setState(() {
                  myPhone = result.toString();
                });
              },
                  child: Text("Phone Number")),
              Center(
                child: Container(
                  width: 200,
                  child: ElevatedButton(onPressed: (){},

                      child: Text("Submit")),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

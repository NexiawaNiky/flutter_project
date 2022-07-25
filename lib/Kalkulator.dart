import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({Key? key}) : super(key: key);

  @override
  State<Kalkulator> createState() => _kalkulatorState();
}

class _kalkulatorState extends State<Kalkulator> {
  TextEditingController ctrPanjang = new TextEditingController();
  TextEditingController ctrLebar = new TextEditingController();
  TextEditingController ctrHasil = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("formRegistration"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: ctrPanjang,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Panjang',
              ),
            ),
            Container(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: ctrLebar,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Lebar',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (ctrPanjang.text.isNotEmpty && ctrLebar.text.isNotEmpty) {

                            int hasil =
                                int.parse(ctrPanjang.text) * int.parse(ctrLebar.text);
                            ctrHasil.text = hasil.toString();
                          }else{
                            ctrHasil.text = "ERROR" ;
                          }
                        });
                      },
                      child: Text("Submit")),
                )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Hasil : ${ctrHasil.text}",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
            )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
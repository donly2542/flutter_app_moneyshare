import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUi extends StatefulWidget {
  const MoneyshareUi({Key? key}) : super(key: key);

  @override
  _MoneyshareUiState createState() => _MoneyshareUiState();
}

class _MoneyshareUiState extends State<MoneyshareUi> {
  bool? check_tip = false;
  //สร้างออปเจ็กต์เพื่อนำไปใช้ควบคุม TextField ในหน้าจอที่สร้างไว้
  TextEditingController money_ctrl = TextEditingController();
  TextEditingController person_ctrl = TextEditingController();
  TextEditingController tip_ctrl = TextEditingController();

  //เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          //ปุ่มข้างล่าง
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4D7FE),
      appBar: AppBar(
        backgroundColor: Color(0xFFA00FD3),
        title: Text('แชร์เงินกันเถอะ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'assets/images/banner.png',
                height: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 30.0,
                ),
                child: TextField(
                  controller: money_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Color(0xFF7615B6),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 10.0,
                ),
                child: TextField(
                  controller: person_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    hintText: 'ป้อนจำนวนคน (คน)',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF7615B6),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (val) {
                      setState(() {
                        check_tip = val;
                      });
                    },
                    value: check_tip,
                    activeColor: Color(0xFF7615B6),
                    checkColor: Colors.yellow,
                    side: BorderSide(
                      color: Color(0xFF7615B6),
                    ),
                  ),
                  Text(
                    'ทิปให้พนักงานเสริฟ',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 10.0,
                ),
                child: TextField(
                  controller: tip_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Color(0xFF7615B6),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (money_ctrl.text.length == 0) {
                    //แสดง Msg เตือน
                    showWarningDialog(context, 'ป้อนจำนวนเงิน');
                  } else if (person_ctrl.text.length == 0) {
                    //แสดง Msg เตือน
                    showWarningDialog(context, 'ป้อนจำนวนคน');
                  } else if (tip_ctrl == true) {
                    if (tip_ctrl.text.length == 0) {
                      //แสดง Msg เตือน
                      showWarningDialog(context, 'ป้อนจำนวนเงินทิปด้วย');
                    } else {
                      //คำนวณ(เงิน + ทิป) / คน
                    }
                  } else {
                    //คำนวณ เงิน/คน
                  }
                },
                child: Text('คำนวณ'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width -
                        80.0, // กำหนดตวามกว้างเต็มหน้าจอลบด้วยซ้ายกับขวาที่เราใส่ Paddind
                    50.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  primary: Color(0xFF7615B6),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //เขียน Logic การทำงาน โดยจะเคลียค่าทุกอย่างบนหน้าจอ
                  //กลับมาเป็นเหมือนเดิม
                  setState(() {
                    money_ctrl.text = "";
                    person_ctrl.text = "";
                    tip_ctrl.text = "";
                    check_tip = false;
                  });
                },
                icon: Icon(
                  Icons.refresh,
                ),
                label: Text('ยกเลิก'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width -
                        80.0, // กำหนดตวามกว้างเต็มหน้าจอลบด้วยซ้ายกับขวาที่เราใส่ Padding
                    50.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  primary: Color(0xFFF3420D),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Created by BC SAU 2022',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

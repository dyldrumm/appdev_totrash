import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:totrash/screens/BarcodeScreen.dart';
import 'package:totrash/screens/CalendarScreen.dart';
import 'package:totrash/screens/CameraScreen.dart';
import 'package:totrash/helpers/common.dart';
import 'package:date_text_masked/date_text_masked.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OldDataScreen extends StatefulWidget {
  @override
  _OldDataScreenState createState() => _OldDataScreenState();
}

class _OldDataScreenState extends State<OldDataScreen> {
  DateFormat finalDate = new DateFormat();
  final formkey = GlobalKey<DateTextFormFieldState>();
  var datecontroller = new MaskedTextController(mask: '00/00/0000');
  TextEditingController dateText = new TextEditingController();
  String testDate = "";
  TextEditingController name = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h * 0.1),
              child: Center(
                child: Text(
                  "Enter Data",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Color(0xFF0A2135),
                    fontSize: w * 0.06,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.08,
            ),
            Container(
              height: h * 0.6,
              width: w * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.2, 0.2),
                    blurRadius: 0.5,
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.1),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.poppins(
                              color: Color(0xFF545166),
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.06,
                            ),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Container(
                            height: h * 0.07,
                            width: w * 0.75,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: w * 0.04,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h * 0.02),
                                  child: Container(
                                    width: w * 0.5,
                                    child: TextField(
                                      controller: name,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: Common.barcodeTemp,
                                        hintStyle: TextStyle(
                                          fontSize: w * 0.05,
                                          color: Color(0xFFA4A4A4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: GoogleFonts.poppins(
                              color: Color(0xFF545166),
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.06,
                            ),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Container(
                            height: h * 0.07,
                            width: w * 0.75,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: w * 0.04,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: h * 0.02, right: w * 0.02),
                                    child: Container(
                                      width: w * 0.5,
                                      child: TextField(
                                        controller: dateText,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          hintText: "yyyy-mm-dd",
                                          hintStyle: TextStyle(
                                            fontSize: w * 0.05,
                                            color: Color(0xFFA4A4A4),
                                          ),
                                        ),
                                      ),
                                    )

                                    // TextField(
                                    //   decoration: InputDecoration(
                                    //     enabledBorder: OutlineInputBorder(
                                    //         borderSide: BorderSide.none),
                                    //     hintText: "mm/dd/yyyy",
                                    //     hintStyle: TextStyle(
                                    //       fontSize: w * 0.05,
                                    //       color: Color(0xFFA4A4A4),
                                    //     ),
                                    //   ),
                                    // ),

                                    // DateTextFormField(
                                    //   onValidate: (date) {},
                                    //   validator: (date) {
                                    //     return true;
                                    //   },
                                    //   dateFormat: 'mm/dd/yyyy',
                                    //   showDatePicker: false,
                                    //   labelFail: "Invalid date",
                                    //   decoration: InputDecoration(),
                                    // )
                                    ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CameraScreen()));
                                    },
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 36,
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BarcodeScreen()));
                                    },
                                    child: Icon(
                                      Icons.vertical_split,
                                      size: 36,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.06,
                    ),
                    Container(
                      height: h * 0.1,
                      width: w * 0.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFCFDE2A),
                      ),
                      child: Center(
                        child: GestureDetector(
                            onTap: () {
                              Common.dateTemp = dateText.text;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CalendarScreen()));
                            },
                            child: Text(
                              "OK",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: w * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

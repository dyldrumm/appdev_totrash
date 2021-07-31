import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:totrash/helpers/common.dart';
import 'package:totrash/screens/CameraScreen.dart';
import 'package:totrash/screens/DataScreen.dart';
import 'package:totrash/screens/OldDataScreen.dart';
import 'package:totrash/screens/CalendarScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _imagePath;
  @override
  void initState() {
    super.initState();
  }

  List<String> names = ["Name", "Name", "Name", "Name"];
  List<String> time = ["mm/dd/yyyy", "mm/dd/yyyy", "mm/dd/yyyy", "mm/dd/yyyy"];
  List colors = [
    Color(0xFFFF7F00),
    Color(0xFFFFCC00),
    Color(0xFFCFDE2A),
    Color(0xFFCFDE2A)
  ];

  Future<void> getImage() async {
    String? imagePath;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      imagePath = (await EdgeDetection.detectEdge);
      print("$imagePath");
    } on PlatformException {
      imagePath = 'Failed to get cropped image path.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _imagePath = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 66.0, left: 25.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Common.assetImages + "drawer.png",
                  width: w * 0.08,
                  height: h * 0.04,
                ),
                SizedBox(
                  height: h * 0.035,
                ),
                Container(
                  width: 200,
                  child: Text(
                    "Find your food To Trash",
                    style: GoogleFonts.poppins(
                      fontSize: w * 0.07,
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Container(
                  height: h * 0.065,
                  width: w * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: w * 0.04,
                      ),
                      Image.asset(
                        Common.assetImages + "search.png",
                        width: w * 0.07,
                        height: h * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.02),
                        child: Container(
                          width: w * 0.5,
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Find",
                              hintStyle: TextStyle(
                                fontSize: w * 0.06,
                                color: Color(0xFFA4A4A4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                InkWell(
                  onTap: () {
                    //getImage();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OldDataScreen()));
                  },
                  child: Container(
                    height: h * 0.13,
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
                      padding: EdgeInsets.only(left: w * 0.045),
                      child: Row(
                        children: [
                          Image.asset(
                            Common.assetImages + "add.png",
                            width: w * 0.17,
                          ),
                          SizedBox(
                            width: w * 0.065,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "New Product",
                                style: GoogleFonts.poppins(
                                  fontSize: w * 0.05,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.008,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OldDataScreen()));
                                  },
                                  child: Text(
                                    "Add new",
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFFA4A4A4),
                                        fontWeight: FontWeight.normal,
                                        fontSize: w * 0.04),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Container(
                  height: h * 0.13,
                  width: w * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFFFF2D55),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: w * 0.045),
                    child: Row(
                      children: [
                        Image.asset(
                          Common.assetImages + "Rectangle.png",
                          width: w * 0.17,
                        ),
                        SizedBox(
                          width: w * 0.065,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Milk",
                              style: GoogleFonts.poppins(
                                fontSize: w * 0.05,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: h * 0.008,
                            ),
                            Text(
                              "Expired",
                              style: GoogleFonts.poppins(
                                  color: Color(0xFFFF2D55),
                                  fontWeight: FontWeight.normal,
                                  fontSize: w * 0.04),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * 0.08),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: h * 0.13,
                        width: w * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: colors[index]),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: w * 0.045),
                          child: Row(
                            children: [
                              Image.asset(
                                Common.assetImages + "Rectangle.png",
                                width: w * 0.17,
                              ),
                              SizedBox(
                                width: w * 0.065,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    names[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: w * 0.05,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.008,
                                  ),
                                  Text(
                                    time[index],
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFFA4A4A4),
                                        fontWeight: FontWeight.normal,
                                        fontSize: w * 0.04),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: h * 0.03,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

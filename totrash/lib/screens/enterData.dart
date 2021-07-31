import 'dart:convert';

import 'package:expiry_checker/routes/app_routes.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expiry_checker/Services/product.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class DataScreen extends StatefulWidget {
  final Product? item;

  DataScreen({this.item});
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final ImagePicker _picker = ImagePicker();
  String? _imagePath="f";
  List<Product> list = <Product>[];
  SharedPreferences? sharedPreferences;
  DateTime noww = DateTime.now();
  TextEditingController? titleController;
  DateTime? expdate;
  List listt = [];
  double? ddiff;
  String datee = "mm/dd/yyyy";
  DateTime? from;
  DateTime? to;
  XFile? gallery;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    titleController = new TextEditingController(
        text: widget.item != null ? widget.item!.title : null);
    loadSharedPreferencesAndData();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  Future<void> getImagecamera() async {
    String? imagePath="k";
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.

    try {
      imagePath = (await EdgeDetection.detectEdge);

      print("$imagePath");
    } catch (Exception) {
      print('ff');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _imagePath = imagePath;
      
    });
    
    //   if (imagePath == null) {
    //     Navigator.pushNamed(context, Approutes.homescreen);
    //   } else {
    //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //       return DataScreen(

    //       );
    //     }));
  }
  Future<void> getimagegallery()async {
final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
 File file = File(image!.path);
setState(() {
  
 
_imagePath = file.path;
 
});
print(_imagePath);

  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: h * 0.1),
                child: Center(
                  child: InkWell(
                    onTap: () => submit(),
                    child: Text(
                      "Enter Data",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0A2135),
                        fontSize: w * 0.06,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.08,
              ),
              Container(
                height: h * 0.7,
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
                  padding: EdgeInsets.only(top: h * 0.05),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          backgroundImage: FileImage(File(_imagePath??"f")),
                          radius: 55,

                          backgroundColor: Colors.grey.shade300,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    getImagecamera();
                                  },
                                    child: Icon(
                                  Icons.camera_enhance,
                                  size: 30,
                                   color: Color(0xFFA4A4A4),
                                ),),
                                SizedBox(
                                  width: 45,
                                ),
                                InkWell(
                                  onTap: (){
                                    getimagegallery();


                                  },
                                  child: Icon(Icons.photo,
                                      size: 30,  color: Color(0xFFA4A4A4),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
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
                                        controller: titleController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          hintText: "Food Name",
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
                              style: TextStyle(
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
                                  InkWell(
                                    onTap: () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(2021, 04, 1),
                                          maxTime: DateTime(2040, 04, 1),
                                          onChanged: (date) {
                                        print('change $date');
                                      }, onConfirm: (date) {
                                        setState(() {
                                          from = DateTime(
                                              noww.year, noww.month, noww.day);
                                          to = DateTime(
                                              date.year, date.month, date.day);
                                          double diff =
                                              (to!.difference(from!).inHours /
                                                  24);

                                          ddiff = diff;
                                          print('to date ${to.toString()}');
                                        });

                                        setState(() {
                                          datee = DateFormat("MM-dd-yyyy")
                                              .format(DateTime.parse(
                                                  to.toString()));
                                          print("rk ${datee}");
                                        });
                                        setState(() {
                                          expdate = date;
                                        });
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);
                                    },
                                    child: Container(
                                      width: w * 0.5,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 0),
                                        child: Text(
                                          datee,
                                          style: TextStyle(
                                              color: Color(0xFFA4A4A4),
                                              fontSize: w * 0.05),
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
                          child: InkWell(
                            onTap: () => submit(),
                            child: Text(
                              "OK",
                              style:TextStyle(
                                color: Colors.white,
                                fontSize: w * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void submit() {
    


    if (titleController!.text != null && datee != 'mm/dd/yyyy') {
      addItem(Product(
        title: titleController!.text,
        expdate: expdate.toString(),
        imageUrl: _imagePath,
        diff: ddiff,
        
      ));
      Navigator.pushNamed(context, Approutes.homescreen);
    } else {
      print("eerr");
    }
  }

  void addItem(Product item) {
    // Insert an item into the top of our list, on index zero
    list.insert(0, item);
    saveData();
  }

  void loadData() {
    List<String> listString = sharedPreferences!.getStringList('list')!;
    if (listString != null) {
      list =
          listString.map((item) => Product.fromMap(json.decode(item))).toList();
      setState(() {});
    }
  }

  void saveData() {
    List<String> stringList =
        list.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences!.setStringList('list', stringList);
  }
}

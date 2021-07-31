import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:expiry_checker/Screens/enterData.dart';
import 'package:expiry_checker/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:edge_detection/edge_detection.dart';
import 'package:expiry_checker/Services/product.dart';
import 'package:expiry_checker/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<Product> list = <Product>[];
  SharedPreferences? sharedPreferences;
  
  @override
  void initState() {
    loadSharedPreferencesAndData();
    super.initState();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  List<String> names = ["Name", "Name", "Name", "Name"];
  List<String> time = ["mm/dd/yyyy", "mm/dd/yyyy", "mm/dd/yyyy", "mm/dd/yyyy"];
  List colors = [
    Color(0xFFFF7F00),
    Color(0xFFFFCC00),
    Color(0xFFCFDE2A),
    Color(0xFFCFDE2A)
  ];
  DateTime dateTimeNow = DateTime.now();


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
                    style: TextStyle(
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
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 22),
                          width: w * 0.5,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Find",
                              hintStyle: TextStyle(
                                fontSize: 18,
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
                   Navigator.pushNamed(context, Approutes.datascreen);
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
                                style: TextStyle(
                                  fontSize: w * 0.05,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.008,
                              ),
                              Text(
                                "Add new",
                                style: TextStyle(
                                    color: Color(0xFFA4A4A4),
                                    fontWeight: FontWeight.normal,
                                    fontSize: w * 0.04),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                list.isEmpty ? emptyList() : buildListTile(),
                SizedBox(
                  height: h * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emptyList() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text('No items'),
    ));
  }

  Widget buildListTile() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(right: w * 0.08),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          //
          DateTime date = DateTime.now();

          Widget checkexp(DateTime from, double d, String too) {
            //  from = DateTime(from.year, from.month, from.day);
            //  to = DateTime(to.year, to.month, to.day);

            // print('difffff $diff');
            DateTime to = new DateFormat("yyyy-MM-dd").parse(too);
            // final differenceInDays = dateTimeNow.difference(dateTimeCreatedAt).inDays;

            double diff = (to.difference(from).inHours / 24);
            int dif = (to.difference(from).inHours / 24).round();
            if (diff <= 0) {
              return Text(
                "Expired",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.normal,
                    fontSize: w * 0.039),
              );
            } else {
              return Row(
                children: [
                  Text(
                    DateFormat("MM-dd-yyyy")
                        .format(DateTime.parse(list[index].expdate.toString())),
                    style: TextStyle(
                        color: Color(0xFFA4A4A4),
                        fontWeight: FontWeight.normal,
                        fontSize: w * 0.039),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    "Expire in ${diff.round()} days",
                    style: TextStyle(
                        color: Color(0xFFA4A4A4),
                        fontWeight: FontWeight.normal,
                        fontSize: w * 0.034),
                  ),
                ],
              );
            }
          }

          Color bordercolor(DateTime from, d, String too) {
            // double diff = (to.difference(from).inHours / 24);
            // int dd = (to.difference(from).inHours / 24).round();
            DateTime to = new DateFormat("yyyy-MM-dd").parse(too);
            double diff = (to.difference(from).inHours / 24);
            if (diff <= 0) {
              return Colors.red;
            } else if (diff > 0 && diff <= 1) {
              return Color(0xFFFF7F00);
            } else if (diff > 1 && diff <= 30) {
              return Color(0xFFCFDE2A);
            } else {
              return Colors.green;
            }
          }

          return Dismissible(
            key: Key('${list[index].hashCode}'),
            background: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.2, 0.2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      Common.assetImages + "Image 1.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.2, 0.2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      Common.assetImages + "Image 1.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
            onDismissed: (direction) => removeItem(list[index]),
            child: Container(
              height: h * 0.13,
              width: w * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(
                    color: bordercolor(
                        date, list[index].diff!, list[index].expdate!)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: w * 0.03),
                child: Row(
                  children: [
                    Container(
                      height: h * 0.101,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.file(
                          File(list[index].imageUrl!),
                          fit: BoxFit.cover,
                          height: h * 0.101,
                          width: w * 0.2,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.065,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list[index].title!,
                          key: Key('item-$index'),
                          style: TextStyle(
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.008,
                        ),
                        checkexp(dateTimeNow, list[index].diff!,
                            list[index].expdate!),
                      ],
                    ),
                  ],
                ),
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
    );
  }

/*
  void removeItemFromList(Todo item, int index) {
    animatedListKey.currentState!.removeItem(index, (context, animation) {
      return SizedBox(
        width: 0,
        height: 0,
      );
    });
    deleteItem(item);
  }

  void deleteItem(Todo item) {
    // We don't need to search for our item on the list because Dart objects
    // are all uniquely identified by a hashcode. This means we just need to
    // pass our object on the remove method of the list
    items.remove(item);
    if (items.isEmpty) {
      if (emptyListController != null) {
        emptyListController!.reset();
        setState(() {});
        emptyListController!.forward();
      }
    }
  }

  void goToNewItemView() {
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewTodoView();
    })).then((title) {
      if (title != null) {
        setState(() {
          addItem(Todo(title: title));
        });
      }
    });
  }

  void addItem(Todo item) {
    // Insert an item into the top of our list, on index zero
    items.insert(0, item);
    if (animatedListKey.currentState != null)
      animatedListKey.currentState!.insertItem(0);
  }

 */
  void goToNewItemView() {
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DataScreen();
    })).then((title) {
      if (title != null) {
        addItem(Product(title: title));
      }
    });
  }

  void addItem(Product item) {
    // Insert an item into the top of our list, on index zero
    list.insert(0, item);
    saveData();
  }

/*
  void changeItemCompleteness(Todo item) {
    setState(() {
      item.completed = !item.completed;
    });
    saveData();
  }

  void goToEditItemView(item) {
    // We re-use the NewTodoView and push it to the Navigator stack just like
    // before, but now we send the title of the item on the class constructor
    // and expect a new title to be returned so that we can edit the item
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewTodoView(item: item);
    })).then((title) {
      if (title != null) {
        editItem(item, title);
      }
    });
  }
*/
  void editItem(Product item, String title) {
    item.title = title;
    saveData();
  }

  void removeItem(Product item) {
    list.remove(item);
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

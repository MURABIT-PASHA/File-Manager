import 'package:file_manager/storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class MainMenu extends StatefulWidget {
  static const String id = 'main_page';
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late String search;
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(

          child: ListView(
            children: <Widget>[
              //Search Area
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: (value) {
                    search = value;
                  },
                  style: const TextStyle(fontFamily: "Quicksand"),
                  keyboardType: TextInputType.text,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Search file...',
                    filled: true,
                    suffixIcon: InkWell(
                      onTap: () {
                        searchFile();
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.white70,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF03045E)),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFF0077B6), width: 2.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              //Indicator Area
              Container(
                height: 120.0,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: blue1,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Diagram
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                    ),
                    //Details
                    Container(
                      height: 100,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //File Type
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.image,
                                        size: 20,
                                        color: Color(0xFF023E8A),
                                      ),
                                    ),
                                    TextSpan(
                                        text: "Pictures",
                                        style:
                                            TextStyle(fontFamily: 'Quicksand')),
                                  ],
                                ),
                              ),
                              //Storage Indicator
                              Container(
                                height: 10,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //File Type
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.play_circle,
                                        size: 20,
                                        color: Color(0xFF023E8A),
                                      ),
                                    ),
                                    TextSpan(
                                        text: "Videos",
                                        style:
                                            TextStyle(fontFamily: 'Quicksand')),
                                  ],
                                ),
                              ),
                              //Storage Indicator
                              Container(
                                height: 10,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //File Type
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.file_copy_rounded,
                                        size: 20,
                                        color: Color(0xFF023E8A),
                                      ),
                                    ),
                                    TextSpan(
                                        text: "Documents",
                                        style:
                                            TextStyle(fontFamily: 'Quicksand')),
                                  ],
                                ),
                              ),
                              //Storage Indicator
                              Container(
                                height: 10,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //File Type
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.folder_copy_rounded,
                                        size: 20,
                                        color: Color(0xFF023E8A),
                                      ),
                                    ),
                                    TextSpan(
                                        text: "Others",
                                        style:
                                            TextStyle(fontFamily: 'Quicksand')),
                                  ],
                                ),
                              ),
                              //Storage Indicator
                              Container(
                                height: 10,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Storage Area
              Container(
                height: 140,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blue9,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Local Storage
                    GestureDetector(
                      onTap:(){
                        Navigator.pushNamed(context, StoragePage.id);
                      },
                      child: Container(
                        width: 140,
                        height: 110,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: blue8),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Icon(Icons.folder, color: blue2, size: 40,),
                            const Text("Local Storage", style: TextStyle(color: Colors.white, fontFamily: 'Quicksand', fontSize: 16, fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("120 Files", style: TextStyle(color: Colors.white70, fontFamily: 'Quicksand', fontSize: 14),),
                                Text("64 GB", style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize: 14),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    //External Storage
                    GestureDetector(
                      onTap:(){print("External Storage");},
                      child: Container(
                        width: 140,
                        height: 110,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: blue8),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Icon(Icons.folder, color: blue2, size: 40,),
                            const Text("External Storage", style: TextStyle(color: Colors.white, fontFamily: 'Quicksand', fontSize: 16, fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("100 Files", style: TextStyle(color: Colors.white70, fontFamily: 'Quicksand', fontSize: 14),),
                                Text("32 GB", style: TextStyle(color: Colors.black, fontFamily: 'Quicksand', fontSize: 14),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Recent Label
              Container(
                height: 30,
                decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Recent Files", style: TextStyle(color: Colors.black, fontFamily: "Quicksand", fontSize: 18, fontWeight: FontWeight.bold),),
                    DropdownButton(
                      // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_control),
                        underline: Container(),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), onChanged: (value){})
                  ],
                ),
              ),
              //Recent File
              Container(
                height: 60,
                decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(color: blue6, borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.document_scanner, color: blue5,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("Murabit The Magnificent.pdf", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        Text("13/09/2022 21:00 AM",style: TextStyle(color: Colors.grey, fontSize: 10),)
                      ],
                    ),
                    DropdownButton(
                      // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_control),
                        underline: Container(),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), onChanged: (value){})
                  ],
                ),
              ),
              //Recent File
              Container(
                height: 60,
                decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(color: blue6, borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.image, color: blue5,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("MURABIT-PASHA.png", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        Text("13/09/2022 21:06 AM",style: TextStyle(color: Colors.grey, fontSize: 10),)
                      ],
                    ),
                    DropdownButton(
                      // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_control),
                        underline: Container(),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), onChanged: (value){})
                  ],
                ),
              ),
              //Recent File
              Container(
                height: 60,
                decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(color: blue6, borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.play_circle, color: blue5,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("murabit-akdogan.mp4", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        Text("13/09/2022 21:00 AM",style: TextStyle(color: Colors.grey, fontSize: 10),)
                      ],
                    ),
                    DropdownButton(
                      // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_control),
                        underline: Container(),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), onChanged: (value){})
                  ],
                ),
              ),
              //Videos Label
              Container(
                height: 30,
                decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Videos", style: TextStyle(color: Colors.black, fontFamily: "Quicksand", fontSize: 18, fontWeight: FontWeight.bold),),
                    DropdownButton(
                      // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_control),
                        underline: Container(),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), onChanged: (value){})
                  ],
                ),
              ),
              //Video Area
              Container(
                height: 250,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: blue7, borderRadius: BorderRadius.circular(10.0)),
              ),
              //Images Label
              Container(
                height: 30,
                decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Images", style: TextStyle(color: Colors.black, fontFamily: "Quicksand", fontSize: 18, fontWeight: FontWeight.bold),),
                    DropdownButton(
                      // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_control),
                        underline: Container(),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), onChanged: (value){})
                  ],
                ),
              ),
              //Image Area
              Container(
                height: 250,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: blue7, borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    Flexible(flex: 1, child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: blue6),
                      margin: const EdgeInsets.all(5)
                    )),
                    Flexible(flex: 2, child: Column(
                      children: [
                        Flexible(flex: 2, child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: blue6),
                            margin: const EdgeInsets.all(5)
                        )),
                        Flexible(flex: 2, child: Row(
                          children: [
                            Flexible(flex:1, child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: blue6),
                            margin: const EdgeInsets.all(5)),),
                            Flexible(flex:1, child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: blue6),
                                margin: const EdgeInsets.all(5)))
                          ],
                        ),)
                      ],
                    ) )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchFile() {}
}

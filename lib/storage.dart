import 'package:file_manager/constants.dart';
import 'package:flutter/material.dart';

class StoragePage extends StatefulWidget {
  static const String id = "storage_page";
  const StoragePage({Key? key}) : super(key: key);

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
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
        child: ListView(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(color: blue9, borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.folder, color: blue5,size: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("MURABIT-PASHA", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createFolder(),
        child: const Icon(Icons.create_new_folder),
      ),
    );
  }

  createFolder() {}
}

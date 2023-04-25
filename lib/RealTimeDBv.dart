import 'package:firebase/RealTimeDB.dart';
import 'package:firebase/RealTimeDBu.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealTimeDBv extends StatefulWidget {
  const RealTimeDBv({Key? key}) : super(key: key);

  @override
  State<RealTimeDBv> createState() => _RealTimeDBv();
}

class _RealTimeDBv extends State<RealTimeDBv> {
  Query getdata = FirebaseDatabase.instance.ref().child("FLUTTERdb");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const RealTimeDB();
            },
          ));
        },
        child: const Text("ADD"),
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll(50),
            shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            textStyle: MaterialStatePropertyAll(TextStyle(
                fontSize: 20,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                letterSpacing: 2)),
            backgroundColor: MaterialStatePropertyAll(Colors.black),
            iconSize: MaterialStatePropertyAll(20),
            minimumSize: MaterialStatePropertyAll(Size.square(40))),
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: getdata,
          defaultChild: Center(child: const Text("Loading")),
          itemBuilder: (context, snapshot, animation, index) {
            Map data=snapshot.value as Map;
            data['key']=snapshot.key;
            return Card(
              margin: const EdgeInsets.all(10),
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            snapshot.child("IMAGE").value.toString()),
                        maxRadius: 70),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      alignment: Alignment.topLeft,
                      margin:
                          const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                      child: Text(
                        "Id:  ${snapshot.child("ID").value.toString()}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "NAME:  ${snapshot.child("NAME").value.toString()}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "PHONE: ${snapshot.child("PHONE").value.toString()}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "EMAIL: ${snapshot.child("EMAIL").value.toString()}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 20, bottom: 30),
                      child: Text(
                        "Image URL:\n\n${snapshot.child("IMAGE").value.toString()}",
                        // maxLines: ,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return RealTimeDBu(data['key']);
                          },));
                        },
                        child: const Text("UPDATE"),
                        style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(50),
                            shape: MaterialStatePropertyAll(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            textStyle: MaterialStatePropertyAll(TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white24),
                            iconSize: MaterialStatePropertyAll(20),
                            minimumSize:
                                MaterialStatePropertyAll(Size.square(40))),
                      ),
                      ElevatedButton(
                        onPressed: () {

                          FirebaseDatabase.instance.reference()
                              .child('FLUTTERdb')
                              .child(snapshot.child("ID").value.toString())
                              .remove();

                          // snapshot.ref.remove();

                        },
                        child: const Text("DELETE"),
                        style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(50),
                            shape: MaterialStatePropertyAll(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            textStyle: MaterialStatePropertyAll(TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white24),
                            iconSize: MaterialStatePropertyAll(20),
                            minimumSize:
                                MaterialStatePropertyAll(Size.square(40))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

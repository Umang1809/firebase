import 'package:flutter/material.dart';

class WhatsAppUI extends StatefulWidget {
  const WhatsAppUI({Key? key}) : super(key: key);

  @override
  State<WhatsAppUI> createState() => _WhatsAppUIState();
}

class _WhatsAppUIState extends State<WhatsAppUI> with TickerProviderStateMixin {
  late TabController t;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    t = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 153,
            width: double.infinity,
            color: Color(0xFF008069),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text("WhatsApp",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    SizedBox(width: 180),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                TabBar(
                    controller: t,
                    indicatorPadding: EdgeInsets.all(2),
                    indicatorWeight: 5,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(),
                    tabs: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 150, 5),
                        child: Icon(Icons.camera_alt, size: 30),
                      ),
                      Text("CHATS",style: TextStyle(fontSize: 20)),
                      Text("STATUS",style: TextStyle(fontSize: 20)),
                      Text("CALLS",style: TextStyle(fontSize: 20)),
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }
}

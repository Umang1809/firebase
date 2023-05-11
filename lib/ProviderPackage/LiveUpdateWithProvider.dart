import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LiveUpdateWithProvider extends StatelessWidget {
  const LiveUpdateWithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 20,centerTitle: true,title: Text("LIVE CHANGES IN STATLESS")),
        body: ChangeNotifierProvider(create: (context) => ValueChange(),
        child: Consumer<ValueChange>(
          builder: (context, value, child) {
            return Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              Card(
                margin: EdgeInsets.only(right: 120,top: 20,bottom: 20,left: 120),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: Text(
                        "${value.cnt}",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                ),
              ),
              SizedBox(height: 50),
              Card(
                margin: EdgeInsets.only(right: 150,top: 20,bottom: 20,left: 150),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                      child: IconButton(onPressed: () {
                        value.increment();

                      }, icon: Icon(Icons.add,size: 30
                        ,))),
                ),
              ),

            ],);
          },
        ),),
      ),
    );
  }
}

class ValueChange extends ChangeNotifier
{
  int cnt=0;

  void increment() {
    cnt++;
    notifyListeners();
  }
}

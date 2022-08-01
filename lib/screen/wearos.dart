
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wear/wear.dart';

class WearSmartWatch extends StatefulWidget {
   const WearSmartWatch({Key? key}) : super(key: key);

  @override
  State<WearSmartWatch> createState() => _WearSmartWatchState();
}

class _WearSmartWatchState extends State<WearSmartWatch> {
  final _oneController = TextEditingController();
  final _twoController = TextEditingController();
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child){
        return AmbientMode(
          builder: (context, mode,child ){
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _oneController,
                      decoration: const InputDecoration(
                        labelText: "number 1",
                        border: OutlineInputBorder(),
              
                      ),
                    ),
                    const SizedBox( height: 20),
              
                    TextFormField(
                      controller: _twoController,
                      decoration: const InputDecoration(
                        labelText: "number 2",
                        border: OutlineInputBorder(),
              
                      ),
              
                    ),
                    const SizedBox( height: 20),
              
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sum = int.parse(_oneController.text) + int.parse(_twoController.text);
                        });
                        Fluttertoast.showToast(
                          msg: 'sum is #result',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.transparent,
                          textColor: Colors.black
                        );
                      },
                      child: const Text("Add"),
                    ),
                    // Text("Sum = ${sum.toString()}")
              
                  ],
                ),
              ),
            );
          },
        );
      }
    );
    
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ussd_advanced/ussd_advanced.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_response != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _response!,
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  child: Text("HUNGRY DEA"),
                  onPressed: () async {
                    String? _res = await UssdAdvanced.multisessionUssd(
                        code: "*611*1*1#", subscriptionId: 1);
                    setState(() {
                      _response = _res;
                    });
                    //   String? _res2 = await UssdAdvanced.sendMessage('3');
                    //   setState(() {
                    //     _response = _res2;
                    //   });
                    //   await UssdAdvanced.cancelSession();
                    // },
                  }),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                _callNumber();
              },
              child: Text("CALL NUMBER"))
        ],
      ),
    );
  }
}

_callNumber() async {
  String number = "911";
  await FlutterPhoneDirectCaller.callNumber(number);
}

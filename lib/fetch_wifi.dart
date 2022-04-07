import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';


class FetchWifiNetworkInsideApp extends StatefulWidget {
  const FetchWifiNetworkInsideApp({Key? key}) : super(key: key);

  @override
  State<FetchWifiNetworkInsideApp> createState() => _FetchWifiNetworkInsideAppState();
}

class _FetchWifiNetworkInsideAppState extends State<FetchWifiNetworkInsideApp> {


  String? wifiIPIPV6;
  String? wifiBroadCast;
  String? wifiGatewayIp;
  String? wifiSubmask;
  String? wifiIp;

  final info = NetworkInfo();

  getWifiDetails() async{
    String? myWifiIp = await info.getWifiIPv6();
    String? myWifiBroadCast = await info.getWifiBroadcast();
    String? myWifiGatewayIp = await info.getWifiGatewayIP();
    String? myWifiSubmask = await info.getWifiSubmask();
    String? mywifiIp = await info.getWifiIP();


    setState(() {
      wifiIPIPV6 = mywifiIp;
      wifiBroadCast = myWifiBroadCast;
      wifiGatewayIp = myWifiGatewayIp;
      wifiSubmask = myWifiSubmask;
      wifiIp = mywifiIp;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "Fetch Network Inside App",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    getWifiDetails();
                  },
                  color: Colors.amber,
                  shape: const StadiumBorder(),
                  child: const Text("Get Wifi Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Text("Wifi IPV6 is : ${wifiIPIPV6 ?? ""}", style: const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 6,),
            Text("Wifi BroadCast is : ${wifiBroadCast ?? ""}", style: const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 6,),
            Text("Wifi Gateway Ip Is : ${wifiGatewayIp ?? ""}", style: const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 6,),
            Text("Wifi Submask is : ${wifiSubmask ?? ""}", style: const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 6,),
            Text("Wifi Ip Address is : ${wifiIp ?? ""}", style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}


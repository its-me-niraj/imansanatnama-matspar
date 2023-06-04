import 'dart:convert';

import "package:flutter/material.dart";
import 'package:matspar/models/Product.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserWindow extends StatefulWidget {
  const BrowserWindow({super.key});

  @override
  State<BrowserWindow> createState() => _BrowserWindowState();
}

class _BrowserWindowState extends State<BrowserWindow> {
  late final WebViewController mycontroller;
  bool isLoading = true;
  bool didSearched = false;
  // List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // grab();
  }

  parseResp(myresp) {
    myresp = jsonEncode(jsonDecode(myresp)['payload']['products']);
    // print();
    List<Product> products = productFromJson(myresp);
    print(products.first.name);
    // jsonDecode(myresp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                if (isLoading) {
                } else {
                  await mycontroller.evaluateJavascript(
                      'var resp=[];async function postData(){try{let t=await fetch("https://api.matspar.se/slug",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({slug:"/kategori",query:{q:"coca cola"}})});if(!t.ok)throw Error("Network response was not ok");let a=await t.json();return a}catch(o){throw console.error(o),o}}async function fetchData(){try{let t=await postData();console.log(t),resp=t}catch(a){console.error(a)}}fetchData();');
                  await Future.delayed(Duration(seconds: 2));
                  var resp = await mycontroller.evaluateJavascript('resp');
                  if (resp == '[]') {
                    await Future.delayed(Duration(seconds: 2));
                    resp = await mycontroller.evaluateJavascript('resp');
                    if (resp == '[]') {
                      await Future.delayed(Duration(seconds: 2));
                      resp = await mycontroller.evaluateJavascript('resp');
                      if (resp == '') {
                      } else {
                        parseResp(resp);
                      }
                    } else {
                      parseResp(resp);
                    }
                  } else {
                    parseResp(resp);
                  }
                }
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: WebView(
              initialUrl: 'https://www.matspar.se/start',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                mycontroller = controller;
              },
              javascriptChannels: Set.from([
                JavascriptChannel(
                    name: 'Print',
                    onMessageReceived: (JavascriptMessage message) {
                      //This is where you receive message from
                      //javascript code and handle in Flutter/Dart
                      //like here, the message is just being printed
                      //in Run/LogCat window of android studio
                      print(message.message);
                    })
              ]),
              onPageFinished: (url) async {
                //
                var resp = await mycontroller.evaluateJavascript(
                    'var resp=[];async function postData(){try{let t=await fetch("https://api.matspar.se/slug",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({slug:"/kategori",query:{q:"coca cola"}})});if(!t.ok)throw Error("Network response was not ok");let a=await t.json();return a}catch(o){throw console.error(o),o}}async function fetchData(){try{let t=await postData();console.log(t),resp=t}catch(a){console.error(a)}}fetchData(); resp;');
                // List<Product> tempproducts = productFromJson(resp);
                setState(() {
                  // products = tempproducts;
                  isLoading = false;
                });
              },
            ),
          ),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white.withOpacity(1),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container()),
        ],
      ),
    );
  }
}

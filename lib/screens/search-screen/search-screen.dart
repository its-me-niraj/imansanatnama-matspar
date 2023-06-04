// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matspar/logic/cubit/search_cubit.dart';
import 'package:matspar/models/Product.dart';
import 'package:matspar/screens/search-screen/widgets/search-result.dart';
import 'package:matspar/styles/text-styles.dart';
import 'package:matspar/utils/error-screen.dart';
import 'package:matspar/utils/loading-screen.dart';
import 'package:matspar/utils/network-error.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final WebViewController mycontroller;
  List<Product> finalProducts = [];
  bool isLoading = true;
  bool didSearched = false;
  bool isSearching = false;
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
    setState(() {
      finalProducts = products;
      isSearching = false;
    });
    // jsonDecode(myresp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Search',
          style: DamiText.appbarTitle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.read<SearchCubit>().search('coca cola');
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
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.02),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.09)),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onSubmitted: (value) async {
                        // print(value);
                        setState(() {
                          isSearching = true;
                        });
                        if (isLoading) {
                        } else {
                          await mycontroller.evaluateJavascript(
                              'var resp=[];async function postData(){try{let t=await fetch("https://api.matspar.se/slug",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({slug:"/kategori",query:{q:"${value}"}})});if(!t.ok)throw Error("Network response was not ok");let a=await t.json();return a}catch(o){throw console.error(o),o}}async function fetchData(){try{let t=await postData();console.log(t),resp=t}catch(a){console.error(a)}}fetchData();');
                          await Future.delayed(Duration(seconds: 2));
                          var resp =
                              await mycontroller.evaluateJavascript('resp');
                          if (resp == '[]') {
                            await Future.delayed(Duration(seconds: 2));
                            resp =
                                await mycontroller.evaluateJavascript('resp');
                            if (resp == '[]') {
                              await Future.delayed(Duration(seconds: 2));
                              resp =
                                  await mycontroller.evaluateJavascript('resp');
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusColor: Colors.black,
                          hintText: 'Search Here',
                          hintStyle: DamiText.text),
                    ),
                  ),
                  isSearching
                      ? Container(
                          height: 500,
                          child: LoadingScreen(),
                        )
                      : SearchResult(searchResult: finalProducts)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

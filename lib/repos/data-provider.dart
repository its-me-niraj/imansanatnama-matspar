import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:matspar/models/Detail.dart';

class ProductProvider {
  start() async {
    var resp = await http.post(Uri.parse('https://api.matspar.se/slug'), body: {
      "slug": "/start",
      "query": jsonEncode({"q": ""})
    });
    // print(resp.body);
    print("RESPONSE DONE");
    return resp;
  }

  search(key) async {
    print("Searching ${key} to the server");
    var resp = await http.post(Uri.parse('https://api.matspar.se/slug'), body: {
      "slug": "/kategori",
      "query": jsonEncode({"q": "${key}"})
    });
    // print(resp.body);
    print("RESPONSE DONE");
    print(resp.body);
    return resp;
  }

  findDetails(title) async {
    var resp = await http.post(Uri.parse('https://api.matspar.se/slug'),
        body: {"slug": title, "query": jsonEncode({})});
    // print(resp.body);

    Detail details = detailFromJson(resp.body);
    // print(details.payload.name.toString());
    return details;
  }
}

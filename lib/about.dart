import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './main.dart';

void main() => runApp(new About());

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return WebviewScaffold(
      url: "https://k-dharura.netlify.com",
      appBar: new AppBar(
title: const Text('About K-Dharura'),
      ),
withZoom: true,
withLocalStorage: true,
    );
  }

}

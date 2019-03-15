import 'package:flutter/material.dart';
import './main.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


void main() => runApp(new FirstAid());

class FirstAid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      url: "http://www.sja.org.uk/sja/first-aid-advice.aspx",
      appBar: new AppBar(
title: const Text('First Aid'),
      ),
withZoom: true,
withLocalStorage: true,
    );
    
    
  }
 

}


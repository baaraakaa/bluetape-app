import 'package:flutter/material.dart';
import 'models/ClientModel.dart';
import 'database.dart';

class ComparePage extends StatefulWidget {
  final Map<String, num> measurements;

  const ComparePage({this.measurements});

  @override
  _ComparePageState createState() => _ComparePageState();
}

enum PageState { Brand, Sizing, Result }
enum Sizing { Slim, True, Over }

class _ComparePageState extends State<ComparePage> {
  // data for testing
  List<Client> testClients = Client.sample;

  //Simulating Inputs from app
//  String brand = "Vans"; //input brand
//  int userM = 50; //input measurement
//  int fit = 0; //0 = Slim, 1 = Fitted, 2 = Oversized

  PageState pageState = PageState.Brand;
  String brand;
  int fit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose a brand"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.local_offer),
              tooltip: 'Show Snackbar',
              onPressed: () => setState(() => pageState = PageState.Brand),
            ),
            IconButton(
              icon: const Icon(Icons.aspect_ratio),
              tooltip: 'Next page',
              onPressed: () => setState(() => pageState = PageState.Sizing),
            ),
          ],
        ),
        body: getBody());
  }

  String compare(String meas) {
    bool noSize = false;
    //Search through brands
    for (int i = 0; i < testClients.length; i++) {
      //Search through sizes of specified brand
      if (testClients[i].brandName == brand) {
        noSize = true; //for "no size found" error
        //Size too small
        if (testClients[i].toMap()[meas] < widget.measurements[meas]) {
        }
        //Proper size found
        else if (testClients[i].toMap()[meas] >= widget.measurements[meas]) {
          //Slim fit
          if (fit == 0 && testClients[i - 1].brandName == brand) {
            return (testClients[i - 1].sizeName);
          }
          //Fitted
          else if (fit == 1) {
            return (testClients[i].sizeName);
          }
          //Oversized
          else if (fit == 2 && testClients[i + 1].brandName == brand) {
            return (testClients[i + 1].sizeName);
          }
          //Fitted is smallest fit but user wants slim fit
          else if (fit == 0 && testClients[i - 1].brandName != brand) {
            String pval = testClients[i].sizeName;
            return ('No slim fit, fitted size is $pval');
          }
          //Fitted is biggest fit but user wants oversized fit
          else if (fit == 2 && testClients[i + 1].brandName != brand) {
            String pval = testClients[i].sizeName;
            return ('No oversized fit, fitted size is $pval');
          }
        }
      }
      //Cannot find fitted size
      else if (testClients[i].brandName != brand && noSize) {
        return ('size not found');
      }
    }

    return 'big error oops';
  }

  Widget getBody() {
    switch (pageState) {
      case PageState.Brand:
        return ListView(
            children: testClients
                .map((client) => client.brandName).toSet()
                .map((name) => FlatButton(
                    onPressed: () => setState(() {
                          brand = name;
                          pageState =
                              fit != null ? PageState.Result : PageState.Sizing;
                        }),
                    child: Text(name)))
                .toList());
      case PageState.Sizing:
        return Column(
            children: Sizing.values
                .map((f) => FlatButton(
                      onPressed: () => setState(() {
                            fit = f.index;
                            pageState = PageState.Result;
                          }),
                      child: Text(f.toString()),
                    ))
                .toList());
      case PageState.Result:
        return Text(compare("chest"));
    }
    return null;
  }
}

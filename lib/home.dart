import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  var _translateFrom = "en";
//   var _translateTo = "fa";
String inputText = "";
String dropdownValue1 = 'One';
String dropdownValue2 = 'Two';


TextEditingController controller = TextEditingController();
 
  _buildLang1Selctor(key) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 50.0,
          child: 
          DropdownButton<String>(
          value: dropdownValue1,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue1 = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        ),
      ],
    );
  }

  _buildLang2Selctor(key) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 50.0,
          child: 
          DropdownButton<String>(
          value: dropdownValue2,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue2 = newValue;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
          // key == "fa"
          //     ? Image.asset("assets/flags/ir.png")
          //     : Image.asset("assets/flags/us.png"),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 14.0),
        //   child: key == "fa" ? Text("Persian") : Text("English"),
        // )
      ],
    );
  }

  _swapLang() {
    setState(() {
      var tmp = dropdownValue1;
      dropdownValue1 = dropdownValue2;
      dropdownValue2 = tmp;

      // _visible = !_visible;
    });
  }
_onSubmitted(String value) {
    setState(() => inputText = value);
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:        
         Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                // height: 220.0,
                // width: double.infinity,
                child: Material(
                  elevation: 1.0,
                  child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 15.0),
                        child: Row(
                          children: <Widget>[
                           _buildLang1Selctor(dropdownValue1),//_translateFrom
                            Expanded(
                              child: Container(),
                            ),
                            IconButton(
                              icon: Icon(
                                IconData(0xe801, fontFamily: 'GTranslate'),
                                color: Colors.deepPurple,
                              ),
                              onPressed: () {
                                 _swapLang();
                              },
                            ),
                            Expanded(
                              child: Container(),
                            ),
                             _buildLang2Selctor(dropdownValue2),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.deepPurple,
                      ),
                      // input section
                      Directionality(
                        textDirection: 
                        //selected index of list
                        dropdownValue1 == "One" 
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: InkWell(
                            onTap: () {
                              // _getRecentsFromSharedPrefsFolder();
                               //_goToTranslatePage();
                            },
                            child: TextField(
                              controller: controller,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              // enabled: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: dropdownValue2 == "Two"
                                      ? 'Tap To Enter Text'
                                      : "چیزی برای ترجمه بنویسید "),
                                onChanged: _onSubmitted,
                            ),
                          ),
                        ),
                      ),
                      //Text view here for the translation    
                       Divider(
                        color: Colors.deepPurple,
                      ),  
                      Text(
                        inputText.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                        )
                    ],
                  ),
                ),
              ),
            ]),
      ),
     
      
     
    );
  }
  
}
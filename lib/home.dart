import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_translation/text_channel.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var _translateFrom = "en";
  var _translateTo = "fa";
String inputText = "";
String dropdownValue1 = "English";
String dropdownValue2 = "Uudu";

@override
  void initState() {
    // TextChannel.setMethodHandler(_handleMethod);
    // TextChannel.testChannel();
    // TextChannel.configTranslator();
  }
//   Future<dynamic> _handleMethod(MethodCall call) async {
//   switch (call.method) {
//     case "setLanguages":
//       print("Language List result:" + call.arguments);
//       return new Future.value("");
//   }
// }
TextEditingController controller = TextEditingController();
 
 _buildLangSelctor(key) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 50.0,
          child: key == "fa"
              ? Image.asset("assets/flags/ir.png")
              : Image.asset("assets/flags/us.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: key == "fa" ? Text("Persian") : Text("English"),
        )
      ],
    );
  }
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
          items: <String>["English","Urdu"]
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
        //   DropdownButton<String>(
        //   value: dropdownValue2,
        //   onChanged: (String newValue) {
        //     setState(() {
        //       dropdownValue2 = newValue;
        //     });
        //   },
        //   items: <String>["Urdu","English"]
        //       .map<DropdownMenuItem<String>>((String value) {
        //     return DropdownMenuItem<String>(
        //       value: value,
        //       child: Text(value),
        //     );
        //   }).toList(),
        // ),
          key == "fa"
              ? Image.asset("assets/flags/ir.png")
              : Image.asset("assets/flags/us.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: key == "fa" ? Text("Persian") : Text("English"),
        )
      ],
    );
  }

  _swapLang() {
    setState(() {
      var tmp = _translateFrom;
      _translateFrom = _translateTo;
      _translateTo = tmp;
      

      // _visible = !_visible;
    });
  }

_onSubmitted(String value) {
    setState(() => inputText = value);
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body:        
         Container(
           color: Colors.black,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
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
                            _buildLangSelctor(_translateFrom),
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
                             _buildLangSelctor(_translateTo),
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
                        _translateFrom == "en" 
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
                                  hintText: _translateFrom == "en"
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
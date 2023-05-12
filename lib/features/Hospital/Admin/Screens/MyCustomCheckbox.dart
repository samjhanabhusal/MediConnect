import 'package:flutter/material.dart';
// import 'package:luveen/features/Hospital/Admin/Screens/MainPage.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => MyAppState(),

    ),
  ],child: const MyApp(),
));


class MyApp extends StatelessWidget {
  const MyApp({Key?key}):super(key:key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
    builder: (context, child) {
      return Directionality(textDirection: TextDirection.ltr, child: child!);
    },
    title: 'GNav',
    theme: ThemeData(
       primarySwatch: Colors.green,
    ),

    home: AuthScreen(), 
    );
}
}


class MyAppState extends ChangeNotifier {

  //.................................
  //
  // here are the variables that must be available to more than one page and which are gonna
  // change while the app's running
  //
  //...........................................................................  
  List<String> bhkOptions = [];
  String city = 'Rome';


  bhkOptionsAdd(String s){
    bhkOptions.add(s);
    notifyListeners();
  }

  bhkOptionsRemove(String s){
    bhkOptions.remove(s);
    notifyListeners();
  }

}


//from this simple start page you have access to other different pages
class StartPage extends StatelessWidget{
  const StartPage({Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AppBar")),
      body: Row(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SelectOptionsPage(),
                ));
              },
              child: Text("Options")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ClientPreferencesPage(),
                ));
              },
              child: Text("Client Preferences"))
        ],
      ),
    );
  }

}


//on this page you gonna set the checkboxes
class SelectOptionsPage extends StatelessWidget {
  const SelectOptionsPage({Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Options')),
      body: const CheckBoxes()
    );
  }
}

//this pages uses the values which have been set in the screen with the checkboxes
class ClientPreferencesPage extends StatelessWidget {
  const ClientPreferencesPage();

  @override
  Widget build(BuildContext context) {
    final myAppState = Provider.of<MyAppState>(context);
    String prefers = myAppState.bhkOptions.join(", ");

    return Scaffold(
        appBar: AppBar(title: const Text("Client page")),
        body: Center(
            child: Text("Client prefers $prefers real estate in ${myAppState.city}")));
  }
}


//this widget is used in SelectOptionsPage
class CheckBoxes extends StatelessWidget {
  const CheckBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);


    List<Widget> bhkOptions = <Widget>[
      MyCustomCheckbox(
        text: const Text('General Ward'),
        value: appState.bhkOptions.contains('1 BHK'),
        onChanged: (bool? value) {
            if (value!) {
              //myAppState.selectedBhkOptions
              appState.bhkOptionsAdd('1 BHK');
            } else {
              appState.bhkOptionsRemove('1 BHK');
            }
        },
      ),
      MyCustomCheckbox(
        text: const Text('VIP Ward'),
        value: appState.bhkOptions.contains('2 BHK'),
        onChanged: (bool? value) {
            if (value!) {
              appState.bhkOptionsAdd('2 BHK');
            } else {
              appState.bhkOptionsRemove('2 BHK');
            }
        },
      ),
      MyCustomCheckbox(
        text: const Text('ICU'),
        value: appState.bhkOptions.contains('3 BHK'),
        onChanged: (bool? value) {
            if (value!) {
              appState.bhkOptionsAdd('3 BHK');
            } else {
              appState.bhkOptionsRemove('3 BHK');
            }
        },
      ),
      MyCustomCheckbox(
        text: const Text('Ventilator'),
        value: appState.bhkOptions.contains('4 BHK'),
        onChanged: (bool? value) {
            if (value!) {
              appState.bhkOptionsAdd('4 BHK');
            } else {
              appState.bhkOptionsRemove('4 BHK');
            }
        },
      ),

    ];

    return Column(
      children: bhkOptions,
    );
  }
}


//this widget is used in CheckBoxes
class MyCustomCheckbox extends StatelessWidget {
  const MyCustomCheckbox({
   Key?key ,
    required this.text,
    required this.value,
    required this.onChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
  }):super(key:key);

  final Text text;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(child: text),
                Checkbox(
                  value: value,
                  onChanged: (bool? newValue) {
                    onChanged(newValue!);
                  },
                ),
              ],
            ),
            value
                //.........................................
                //HERE IS THE TextFormField WIDGET
                //.........................................
                ? TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.arrow_right),
                      labelText: 'Total number of beds of this category',
                    )
                  )
                //SizedBox is just an empty placeholder
                : const SizedBox() 
          ],
        ),
      ),
    );
  }
}
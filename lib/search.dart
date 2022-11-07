import 'package:flutter/material.dart';
import 'package:ui/home.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchItem = '';
  List<String> name = ['Mizan', 'Saif', 'Tusar', 'Sumon'];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool found = name.contains(searchItem);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search any of this name'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Mizan, Saif, Tusar, Sumon', textScaleFactor: 1.4),
              Text('(Name are caseSensitive)'),
              SizedBox(height: 20),
              controller.text.isNotEmpty
                  ? Center(
                      child: found ? Text('Found') : Text('Not found'),
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Input any of this name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    searchItem = controller.text;
                  });
                },
                child: Text(' Submit'),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      )),
                  child: Text('Try another way'))
            ],
          ),
        ),
      ),
    );
  }
}

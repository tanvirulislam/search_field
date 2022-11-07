import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController? _controller = TextEditingController();
  List<String> searchName = [];
  List<String> name = ['Mizan', 'Saif', 'Tusar', 'Sumon'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Search any of this name ')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text('Mizan, Saif, Tusar, Sumon', textScaleFactor: 1.4),
              Text('(Not caseSensitive)'),
              SizedBox(height: 20),
              TextFormField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    searchName = name
                        .where(
                          (element) => element.toLowerCase().contains(value),
                        )
                        .toList();
                    print('${searchName}---------------------------------');
                  });
                },
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
              _controller!.text.isNotEmpty && searchName.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Not found'),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller!.text.isNotEmpty
                          ? searchName.length
                          : name.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _controller!.text.isNotEmpty
                                  ? Text(searchName[index])
                                  : Text(name[index]),
                            ),
                          ],
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapp/model/country.dart';
import 'package:myapp/service.dart';
class api extends StatefulWidget {
  @override
  _apiState createState() => _apiState();
}

class _apiState extends State<api> {

  List<Country> _countries;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    service.getCountries().then((countries) {
      setState(() {
        _countries = countries;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(_loading ? 'Loading...' : 'Countries'),
          backgroundColor: Colors.green,
      ),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: null == _countries ? 0 : _countries.length,
              itemBuilder: (context, index) {
                Country country = _countries[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        country.countryInfo.flag
                    ),
                  ),
                  title: Text(country.country,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  subtitle: Text("Total Cases: " + country.cases.toString()+" , "+"Total Recovered: "+country.recovered.toString()),
                );
              }
          )
      ),
    );
  }
}
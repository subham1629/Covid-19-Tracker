import 'package:http/http.dart' as http;
import 'model/country.dart';

class service {
  static String url = "https://disease.sh/v2/countries";

  static Future<List<Country>> getCountries() async{
    try{
      http.Response response=await http.get(url);
      if(response.statusCode==200){
        final List<Country> countries= countryFromJson(response.body);
        return countries;
      }
      else {
        return List<Country>();
      }
    }catch(e) {
      return List<Country>();
    }
  }
}
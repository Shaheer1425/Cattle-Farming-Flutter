import 'dart:convert';
import 'package:cattlefarming/Models/customerClass.dart';
import 'package:cattlefarming/Models/farmClass.dart';
import 'package:cattlefarming/Models/milkClass.dart';
import 'package:cattlefarming/Models/temperatureClass.dart';
import 'package:cattlefarming/Models/viewcattleClass.dart';
import 'package:cattlefarming/Models/weightClass.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static const String base_url = 'http://192.168.18.130/CattleFarmingAPI/api/';

//-----------------------------User API

  Future<http.Response> login(String gmail, String pass) async {
    String url = base_url + "User/Login?gmailOrPhone=$gmail&pass=$pass";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    return response;
  }

  Future<int> signupnew(String name, String email, String pass, String contact,
      int farmid, String role) async {
    String url = base_url +
        "User/SignUp?name=$name&email=$email&pass=$pass&contact=$contact&farmid=$farmid&role=$role";
    Uri uri = Uri.parse(url);
    var response = await http.post(uri);

    return response.statusCode;
  }

  Future<int> signup(String name, String email, String pass, String contact,
      int farmid, String role) async {
    String url = base_url + "Signup";
    var userobj = {
      "Name": name,
      "Email": email,
      "Password": pass,
      "Contact": contact,
      "FarmID": farmid,
      "Role": role
    };
    var json = jsonEncode(userobj);
    Uri uri = Uri.parse(url);
    var response = await http.post(uri,
        body: json,
        headers: {"Content-Type": "application/json; charset=UTF-8"});
    return response.statusCode;
  }

  Future<List<dynamic>> getallfarm() async {
    String url = base_url + "User/GetFarm";
    List<dynamic> mlist = [];
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        mlist = jsonDecode(response.body);
      } else {
        print('Failed to fetch Societies');
      }
    } catch (e) {
      print('Error fetching Societies: $e');
    }
    return mlist;
  }

//------------------Add Farm and  Admin Dashbord
  Future<List<FarmRecord>> getAlladminFarm() async {
    final response = await http.get(Uri.parse('$base_url/Farms/GetAllFarms'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => FarmRecord.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load Farms');
    }
  }

  Future<String> addFarm(Map<String, dynamic> FarmData) async {
    final url = Uri.parse('$base_url/Farms/saveFarm');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(FarmData),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to add Farm. Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to add cattle. Error: $e');
    }
  }

//-----------------------------Cattle API

  static Future<List<viewCattleRecord>> fetchCattle({
    String? status,
    String? type,
    String? isVaccinate,
  }) async {
    final Uri uri = Uri.parse(
      '$base_url/Cattle/FilterAllCattles?status=${status ?? ''}&type=${type ?? ''}&isVaccinate=${isVaccinate ?? ''}',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print("Data Fetched");
      return data.map((json) => viewCattleRecord.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cattle data ${response.statusCode}');
    }
  }

  static Future<List<viewCattleRecord>> fetchCattlewithFarm(
      {String? status, String? type, String? isVaccinate, int? id}) async {
    final Uri uri = Uri.parse(
      '$base_url/Cattle/FarmAllCattles?status=${status ?? ''}&type=${type ?? ''}&isVaccinate=${isVaccinate ?? ''}&id=$id',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print("Data Fetched");
      return data.map((json) => viewCattleRecord.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cattle data ${response.statusCode}');
    }
  }

  Future<String> addCattle(Map<String, dynamic> cattleData) async {
    final url = Uri.parse('$base_url/Cattle/SaveCattle');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(cattleData),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Failed to add cattle. Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to add cattle. Error: $e');
    }
  }

//-----------------------------Weight API

  Future<List<WeightRecord>> getAllWeights() async {
    final response = await http.get(Uri.parse('$base_url/Weight/GetAllWeight'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => WeightRecord.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load weights');
    }
  }

  // Future<WeightRecord> getWeightByDate(String date) async {
  //   final response = await http
  //       .get(Uri.parse('$base_url/Weight/GetWeightByDate?date=$date'));

  //   if (response.statusCode == 200) {
  //     return WeightRecord.fromJson(json.decode(response.body));
  //   } else if (response.statusCode == 204) {
  //     throw Exception('No weight record found for the specified date');
  //   } else {
  //     throw Exception('Failed to load weight by date');
  //   }
  // }

  // Future<List<WeightRecord>> getWeightByDate(String date) async {
  //   final response = await http
  //       .get(Uri.parse('$base_url/Weight/GetWeightByDate?date=$date'));

  //   if (response.statusCode == 200) {
  //     Iterable list = json.decode(response.body);
  //     return list.map((model) => WeightRecord.fromJson(model)).toList();
  //   } else {
  //     throw Exception('Failed to load weights for date $date');
  //   }
  // }

  Future<List<WeightRecord>> getWeightByDate(String date) async {
    final response = await http
        .get(Uri.parse('$base_url/Weight/GetWeightByDate?date=$date'));

    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      if (list is List) {
        return list.map((model) => WeightRecord.fromJson(model)).toList();
      } else {
        return [WeightRecord.fromJson(list)];
      }
    } else {
      throw Exception('Failed to load weights for date $date');
    }
  }

  Future<String> saveWeight(WeightRecord weight) async {
    final response = await http.post(
      Uri.parse('$base_url/Weight/SaveWeight'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(weight.toJson()),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to save weight');
    }
  }

  //-----------------------------Temperature API

  Future<List<TemperatureRecord>> getAllTemperature() async {
    final response =
        await http.get(Uri.parse('$base_url/Temperature/GetAllTemperature'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => TemperatureRecord.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load Temperature');
    }
  }

  Future<List<TemperatureRecord>> GetTemperatureByDate(String date) async {
    final response = await http.get(
        Uri.parse('$base_url/Temperature/GetTemperatureByDate?date=$date'));

    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      if (list is List) {
        return list.map((model) => TemperatureRecord.fromJson(model)).toList();
      } else {
        return [TemperatureRecord.fromJson(list)];
      }
    } else {
      throw Exception('Failed to load Temperature for date $date');
    }
  }

  Future<String> saveTemperature(TemperatureRecord record) async {
    final response = await http.post(
      Uri.parse('$base_url/Temperature/SaveTemperature'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(record.toJson()),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to save temperature');
    }
  }

  //-----------------------------Customer API

  Future<List<CustomerRecord>> getAllCustomers() async {
    final response =
        await http.get(Uri.parse('$base_url/Customer/GetAllCustomers'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => CustomerRecord.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load  Customers');
    }
  }

  Future<List<CustomerRecord>> getCustomerByName(String name) async {
    final response = await http
        .get(Uri.parse('$base_url/Customer/GetCustomerByName?name=$name'));

    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      if (list is List) {
        return list.map((model) => CustomerRecord.fromJson(model)).toList();
      } else {
        return [CustomerRecord.fromJson(list)];
      }
    } else {
      throw Exception('Failed to load Customer for name $name');
    }
  }

  Future<String> saveCustomer(CustomerRecord customer) async {
    final response = await http.post(
      Uri.parse('$base_url/Customer/saveCustomer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(customer.toJson()),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to save Customer');
    }
  }

  //-------------------------Milk

  Future<String> addMilk(Map<String, dynamic> milkData) async {
    final url = Uri.parse('$base_url/Milk/SaveMilkCollection');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(milkData),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to add Milk. Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to add Milk. Error: $e');
    }
  }

  Future<List<MilkRecord>> getAllMilkCollection() async {
    final response =
        await http.get(Uri.parse('$base_url/Milk/GetAllMilkDetails'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => MilkRecord.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load Milk Record');
    }
  }

  Future<List<MilkRecord>> GetMilkCollectionByDate(String date) async {
    final response = await http
        .get(Uri.parse('$base_url/Milk/GetMilkCollectionByDate?date=$date'));

    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      if (list is List) {
        return list.map((model) => MilkRecord.fromJson(model)).toList();
      } else {
        return [MilkRecord.fromJson(list)];
      }
    } else {
      throw Exception('Failed to load Milk for date $date');
    }
  }

  // static Future<bool> saveTemperature(TemperatureRecord record) async {
  //   final url = Uri.parse('$base_url/Temperature/SaveTemperature');
  //   final headers = {'Content-Type': 'application/json'};
  //   final body = jsonEncode({
  //     'Temperature1': record.temperature,
  //     'date': record.date,
  //     'time': record.time,
  //   });

  //   try {
  //     final response = await http.post(url, headers: headers, body: body);

  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       print(
  //           'Failed to save temperature. Status code: ${response.statusCode}');
  //       return false;
  //     }
  //   } catch (e) {
  //     print('Error occurred while saving temperature: $e');
  //     return false;
  //   }
  // }

// Future<void> fetchData() async {
//   try {
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       // Request successful, parse the response data
//       final jsonData = jsonDecode(response.body);
//       // Process jsonData as needed
//       print(jsonData);
//     } else {

//       // Request failed with an error code
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (error) {
//     // An error occurred during the request
//     print('Error occurred: $error');
//   }
// }
}

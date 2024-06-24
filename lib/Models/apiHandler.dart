import 'dart:convert';

import 'package:cattlefarming/Models/FoodStockClass.dart';
import 'package:cattlefarming/Models/addnewMilk.dart';
import 'package:cattlefarming/Models/cattleAvgMilkClass.dart';
import 'package:cattlefarming/Models/cattleInfClass.dart';
import 'package:cattlefarming/Models/cattleSaleClass.dart';
import 'package:cattlefarming/Models/customerClass.dart';
import 'package:cattlefarming/Models/farmClass.dart';
import 'package:cattlefarming/Models/injectVaccineClass.dart';
import 'package:cattlefarming/Models/milkClass.dart';
import 'package:cattlefarming/Models/milksaleClass.dart';
import 'package:cattlefarming/Models/temperatureClass.dart';
import 'package:cattlefarming/Models/vaccineStockClass.dart';
import 'package:cattlefarming/Models/viewcattleClass.dart';
import 'package:cattlefarming/Models/weightClass.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static String base_url = 'http://192.168.239.224/CattleFarmingAPI/api/';
  //ApiHandler(this.baseUrl);
  //static String? _baseUrl;

  // static void setBaseUrl(String baseUrl) {
  //   base_url = baseUrl;
  // }

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

  // static Future<List<viewCattleRecord>> fetchCattle({
  //   String? status,
  //   String? type,
  //   String? isVaccinate,
  // }) async {
  //   final Uri uri = Uri.parse(
  //     '$base_url/Cattle/FilterAllCattles?status=${status ?? ''}&type=${type ?? ''}&isVaccinate=${isVaccinate ?? ''}',
  //   );

  //   final response = await http.get(uri);

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = json.decode(response.body);
  //     print("Data Fetched");
  //     return data.map((json) => viewCattleRecord.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load cattle data ${response.statusCode}');
  //   }
  // }

  static Future<viewCattleRecord?> searchCattleByTag({
    required String tag,
    required int farmId,
  }) async {
    final Uri uri = Uri.parse(
      '$base_url/Cattle/SearchCattleByTagAndFarm?tag=$tag&&farmid=$farmId',
    );

    final response = await http.get(uri);

    // final uri = Uri.http(base_url, 'Cattle/SearchCattleByTagAndFarm', {
    //   'tag': tag,
    //   'farmid': farmId,
    // });
    // final response = await http.get(uri);

    if (response.statusCode == 200) {
      return viewCattleRecord.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      return null; // Cattle not found
    } else {
      throw Exception('Failed to search cattle');
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

  // Future<List<dynamic>> getAllSaledCattle() async {
  //   final response =
  //       await http.get(Uri.parse('$base_url/Cattle/GetAllSaledCattle'));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load Saled Cattle ');
  //   }
  // }
  Future<List<CattleSale>> getAllSaledCattle() async {
    final response =
        await http.get(Uri.parse('$base_url/Cattle/GetAllSaledCattle'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => CattleSale.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load Saled Cattle');
    }
  }

  Future<CattleInfo?> fetchCattleInfo(String tag, int farmid) async {
    final response = await http.get(Uri.parse(
        '$base_url/Cattle/ShowCattleInfoByTag?tag=$tag&farmid=$farmid')); // Adjust endpoint accordingly

    if (response.statusCode == 200) {
      return CattleInfo.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to load cattle info');
      return null;
    }
  }

  Future<String> deadCattle(Map<String, dynamic> cattleData) async {
    final url = Uri.parse('$base_url/Cattle/DeadCattle');
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
            '------------Failed to save dead cattle. Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception(
          '------------------Failed to save dead cattle. Error: $e');
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

  Future<List<WeightRecord>> getWeightByTag(String tag) async {
    final response =
        await http.get(Uri.parse('$base_url/Weight/GetWeightByTag?tag=$tag'));

    if (response.statusCode == 200) {
      var list = json.decode(response.body);
      if (list is List) {
        return list.map((model) => WeightRecord.fromJson(model)).toList();
      } else {
        return [WeightRecord.fromJson(list)];
      }
    } else {
      throw Exception('Failed to load Cattle Weight for tag $tag');
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

  Future<WeightRecord?> getLastWeightByTag(String tag) async {
    final response = await http
        .get(Uri.parse('$base_url/Weight/GetLastMatricsByTag?cattleTag=$tag'));

    if (response.statusCode == 200) {
      return WeightRecord.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to load weight record: ${response.statusCode}');
      return null;
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
  Future<List<dynamic>> getAllCustomer() async {
    String url = base_url + "Customer/GetCustomer";
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

  Future<List<CustomerRecord>> getAllCustomers() async {
    final response =
        await http.get(Uri.parse('$base_url/Customer/GetCustomer'));

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
  Future<Map<String, dynamic>> fetchSingleCattleMilkData(String tag) async {
    final response = await http
        .get(Uri.parse('$base_url/Milk/GetAliveCattleWithMilk?tag=$tag'));
    if (response.statusCode == 200) {
      print("--------------------------${response.body}");
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data for cattle with tag: $tag');
    }
  }

  Future<void> postUpdatedSingleCattleMilkData(
      Map<String, dynamic> updatedRecord) async {
    final response = await http.post(
      Uri.parse('$base_url/Milk/PostUpdatedSingleCattleMilkData'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedRecord),
    );

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to post data to the database. Status code: ${response.statusCode}');
    }
  }

  Future<void> saveMilkCollection(Map<String, dynamic> milkData) async {
    final response = await http.post(
      Uri.parse('$base_url/Milk/SaveMilkCollection'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(milkData),
    );

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to save milk collection. Status code: ${response.statusCode}');
    }
  }

  Future<List<Map<String, dynamic>>> fetchMilkData() async {
    final response =
        await http.get(Uri.parse('$base_url/Milk/GetAliveCattleWithMilk'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list
          .map((model) => {
                'Tag': model['Tag'],
                'TotalMilk': model['TotalMilk'].toString(),
              })
          .toList();
    } else {
      throw Exception('Failed to load Milk data');
    }
  }

  Future<void> postUpdatedMilkData(
      List<Map<String, dynamic>> updatedRecords) async {
    final response = await http.post(
      Uri.parse('$base_url/Milk/PostUpdatedMilkData'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedRecords),
    );

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to post data to the database. Status code: ${response.statusCode}');
    }
  }

  // Future<String> addMilk(Map<String, dynamic> milkData) async {
  //   final url = Uri.parse('$base_url/Milk/SaveMilkCollection');
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: json.encode(milkData),
  //     );

  //     if (response.statusCode == 200) {
  //       return json.decode(response.body);
  //     } else {
  //       throw Exception('Failed to add Milk. Error: ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to add Milk. Error: $e');
  //   }
  // }

//-------------Version 2 of Save Milk Function by using this function you Can Add data on the spot on View Milk Screen
  // Future<String> addMilk(MilkRecord milk) async {
  //   final response = await http.post(
  //     Uri.parse('$base_url/Milk/SaveMilkCollection'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(milk.toJson()),
  //   );

  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to save Milk');
  //   }
  // }

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

  Future<double?> fetchRemainingMilk(int farmId, String type) async {
    final url = '$base_url/Milk/CattleTypeTotalMilk?farmId=$farmId&type=$type';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['TotalMilk'] ?? 0;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<List<cattleAvgMilkRecord>> getAverageMilkForAllCattleOfAllTime(
      int farmid) async {
    final response = await http.get(Uri.parse(
        '$base_url/Milk/GetAverageMilkForAllCattleOfAllTime?farmid=$farmid'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => cattleAvgMilkRecord.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<cattleAvgMilkRecord> getAverageMilkForSpecificCattleTag(
      String tag, int farmid) async {
    final response = await http.get(Uri.parse(
        '$base_url/Milk/GetAverageMilkForSpecificCattleTag?tag=$tag&farmid=$farmid'));

    if (response.statusCode == 200) {
      return cattleAvgMilkRecord.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Future<List<dynamic>> getAllSaledMilk() async {
  //   final response =
  //       await http.get(Uri.parse('$base_url/Milk/GetAllSaledMilk'));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load Milk Sale stock');
  //   }
  // }
  Future<List<MilkSaleRecord>> getAllSaledMilk() async {
    final response =
        await http.get(Uri.parse('$base_url/Milk/GetAllSaledMilk'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => MilkSaleRecord.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load Saled Cattle');
    }
  }
  //-------------------Income Screen Api

  Future<String> saleCattle(CattleSale cattleSale) async {
    try {
      final response = await http.post(
        Uri.parse('$base_url/Cattle/SaleCattle'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(cattleSale.toJson()),
      );

      if (response.statusCode == 200) {
        return 'Cattle ${cattleSale.cattleTag} sale successfully';
      } else {
        throw Exception('Failed to sale cattle: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<void> saveMilkSales(List<MilkSaleRecord> milkSales) async {
    try {
      final response = await http.post(
        Uri.parse('$base_url/Milk/MilkSale'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(milkSales.map((m) => m.toJson()).toList()),
      );

      if (response.statusCode == 200) {
        print('Milk sales saved successfully.');
      } else {
        throw Exception('Failed to save milk sales.');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

//--------------------Add Expense Screen Api
  Future<String> saveFoodStock(FoodStock foodStock) async {
    final response = await http.post(
      Uri.parse('$base_url/Food/SaveFoodStock'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(foodStock.toJson()),
    );

    if (response.statusCode == 200) {
      return 'Food stock saved successfully';
    } else {
      throw Exception('Failed to save food stock');
    }
  }

  Future<String> saveVaccineStock(Vaccination vaccination) async {
    final response = await http.post(
      Uri.parse('$base_url/Vaccination/SaveVaccineStock'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(vaccination.toJson()),
    );

    if (response.statusCode == 200) {
      return 'Vaccine stock saved successfully';
    } else {
      throw Exception('Failed to save vaccine stock');
    }
  }

  Future<List<Vaccination>> getAllVaccinationsStock() async {
    final response = await http
        .get(Uri.parse('$base_url/Vaccination/GetAllVaccinationsStock'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => Vaccination.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load Vaccination');
    }
  }

  //---------------------------------Inject Vaccine Code

  Future<String> saveInjectedVaccine(InjectedVaccination vaccination) async {
    final response = await http.post(
      Uri.parse('$base_url/Vaccination/SaveInjectedVaccine'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(vaccination.toJson()),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to save injected vaccination');
    }
  }

  Future<InjectedVaccination?> getLastInjectedVaccineForTag(String tag) async {
    final response = await http.get(Uri.parse(
        '$base_url/Vaccination/GetLastInjectedVaccineForTag?tag=$tag'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return InjectedVaccination.fromJson(jsonDecode(response.body));
    } else {
      // If the server returns an error response, throw an exception
      throw 'Tag = $tag cattle not vaccinated yet';
    }
  }
  //-----------------Consume Food API

  // Future<List<FoodStock>> getAllFoodStock() async {
  //   final response = await http.get(Uri.parse('$base_url/Food/GetAllFood'));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load food stock');
  //   }
  // }
  Future<List<FoodStock>> getAllFoodStock() async {
    final response = await http.get(Uri.parse('$base_url/Food/GetAllFood'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => FoodStock.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load food stock');
    }
  }

  Future<List<FoodStock>> remainingFoodStock() async {
    final response =
        await http.get(Uri.parse('$base_url/Food/GetRemainingFood'));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => FoodStock.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load food stock');
    }
  }

  // Future<List<String>> getAllFood() async {
  //   final response = await http.get(Uri.parse('$base_url/Food/GetAllFood'));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load food stock');
  //   }
  // }
  //   Future<Map<String, dynamic>> getAllFood() async {
  //   final response = await http.get(Uri.parse('$base_url/Food/GetAllFood'));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Failed to load food data');
  //   }
  // }

  // Future<String> saveConsumeFood(
  //     String type, String food, String date, int farmId) async {
  //   final response = await http.post(
  //     Uri.parse('$base_url/Food/saveConsumeFood'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'type': type,
  //       'food': food,
  //       'date': date,
  //       'farmId': farmId,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     throw Exception('Failed to save consume food');
  //   }
  // }

  // Future<void> consumeFood({
  //   required String cattleType,
  //   required String fodderType,
  //   required String date,
  //   required int farmid,
  // }) async {
  //   final response = await http.post(
  //     Uri.parse('$base_url/Food/SaveConsumeFood'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode({
  //       'cattleType': cattleType,
  //       'fodderType': fodderType,
  //       'date': date,
  //       'farmId': farmid
  //     }),
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to consume food');
  //   }
  // }

  Future<void> consumeFood({
    required String cattleType,
    required String fodderType,
    required String date,
    required int farmId, // Add this if required by the API
  }) async {
    final response = await http.post(
      Uri.parse('$base_url/Food/SaveConsumeFood'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'cattleType': cattleType,
        'fodderType': fodderType,
        'date': date,
        'farmId': farmId, // Add this if required by the API
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to consume food');
    }
  }
  // Future<void> consumeSpecialFood(
  //     {required String tag,
  //     required String food,
  //     required double quantity,
  //     required String date,
  //     required int farmId}) async {
  //   final response = await http.post(
  //     Uri.parse('$base_url/Food/ConsumeFoodSpecialCase'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode({
  //       'tag': tag,
  //       'food': food,
  //       'quantity': quantity,
  //       'date': date,
  //       'farmId': farmId,
  //     }),
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to consume special food');
  //   }
  // }

  Future<void> consumeSpecialFood({
    required String tag,
    required String foodType,
    required double quantity,
    required String date,
    required int farmId,
  }) async {
    final response = await http.post(
      Uri.parse('$base_url/Food/ConsumeFoodSpecialCase'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'tag': tag,
        'foodType': foodType,
        'quantity': quantity,
        'date': date,
        'farmId': farmId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to consume special food');
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

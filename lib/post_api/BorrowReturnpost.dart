
import 'dart:convert';

import 'package:appcsmju/APImodel/BorrowReturnPostmodel.dart';
import 'package:http/http.dart' as http;


  Future<BorrowReturnPostmodel?> postBorrowreturn(
    String Equipment_Name,
    String Borrow_Date,
    String Borrow_Details,
    String Return_Date,
    String Status,
    String FirstName,
    String LastName,
    String Email,
    



     
  ) async {
    var authToken = '1|U8ZzAjCwBiTqZPqNF1WphIbEFgJC3z69qxKRI9KZ';
    String Url = 'https://wwwdev.csmju.com/api/borrow_return/create';
    var response1 = await http.post(Uri.parse(Url),
          headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken'
    },
    body: jsonEncode(<String, String >{
      'Equipment_Name': Equipment_Name,
      'Borrow_Date': Borrow_Date,
      'Borrow_Details': Borrow_Details,
      'Return_Date': Return_Date,
      'Status': Status,
      'FirstName': FirstName,
      'LastName': LastName,
      'Email': Email,
      
    }),
         
         
     );
      if (response1.statusCode == 200) {
        print("put success");
        
      } else {
        var messageError = "Can not post !!";
        print(messageError);
        print(response1.statusCode);
      }
      
  }


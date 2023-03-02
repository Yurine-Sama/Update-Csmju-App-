import 'package:http/http.dart' as http;
class AppealService {
Future<bool> addImage(Map<String, String> body, String filepath) async {
  var authToken = '1|U8ZzAjCwBiTqZPqNF1WphIbEFgJC3z69qxKRI9KZ';
    String addimageUrl = 'https://wwwdev.csmju.com/api/complain/create';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $authToken',
      
    };
var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('Complain_Picture', filepath,));
var response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
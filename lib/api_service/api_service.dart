import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:our_gazipur/model/complain_model.dart';
import 'package:our_gazipur/utils/constants.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  static ApiService instance = ApiService();


  Future<void> complainData({
    required String category,
    required String ward,
    required String opinion,
    required String userId,
    required String location,
    required Uint8List imageBytes,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(complainApi));

      request.fields['category'] = category;
      request.fields['ward'] = ward;
      request.fields['description'] = opinion;
      request.fields['user_id'] = userId;
      request.fields['location'] = location;

      var tempDir = await getTemporaryDirectory();
      var tempFile = await File('${tempDir.path}/temp_image.jpg').writeAsBytes(imageBytes);


      var imageStream = http.ByteStream(tempFile.openRead());
      var imageLength = await tempFile.length();
      var imageUpload = http.MultipartFile(
        'pictures',
        imageStream,
        imageLength,
        filename: 'temp_image.jpg',
      );
      request.files.add(imageUpload);

      var response = await request.send();

       print("Kawchar :$response");
      if (response.statusCode == 201) {
        print('API request successful');
        var responseString = await response.stream.bytesToString();
        print('Response: $responseString');
      } else {
        print('API request failed with status code ${response.statusCode}');
      }

      await tempFile.delete();
    } catch (e) {
      print('Error: $e');
    }
  }






  Future<List<ComplainModel>> getComplain()async{

    try{

      var response=await http.get(Uri.parse('https://app.zufaa.tech/our-gazipur/public/api/complain'),);
      if(response.statusCode==200){

        var complainList= jsonDecode(response.body);
        List<ComplainModel> resultList=[];

        for(var item in complainList){
          ComplainModel complain=ComplainModel.fromJson(item);
          resultList.add(complain);
        }
         print(response.body);
        return resultList;
      }else{
        print("Response status code: ${response.statusCode}");
        throw Exception('Failed to get complain data');
      }
    }catch(e){
      print('Error: $e');
      throw Exception('Failed to get complain data');
    }


  }
}

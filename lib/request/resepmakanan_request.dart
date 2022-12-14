import 'package:dio/dio.dart';
import 'package:resep_makanan/model/detail_resep_makananmodel.dart';
import '/model/resepmakanan_model.dart';

class ResepMakananRequest {

  Future<ResepMakananModel> getResepMakanan() async {
    Response response = await Dio()
        .get('https://masak-apa-tomorisakura.vercel.app/api/recipes');
    return ResepMakananModel.fromJson(response.data);
  }

  Future<DetailResepMakananModel> getDetailResepMakanan(String key) async {
    Response response = await Dio()
        .get('https://masak-apa-tomorisakura.vercel.app/api/recipe/' + key);
    return DetailResepMakananModel.fromJson(response.data);
  }
}
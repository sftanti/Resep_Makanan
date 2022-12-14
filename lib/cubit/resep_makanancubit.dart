import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resep_makanan/model/detail_resep_makananmodel.dart';
import 'package:resep_makanan/request/resepmakanan_request.dart';
import '../model/resepmakanan_model.dart';
part 'resep_makananstate.dart';

class ResepMakananCubit extends Cubit<ResepMakananState> {
  ResepMakananCubit() : super(ResepMakananInitial());

  final ResepMakananRequest resepMakananRequest = ResepMakananRequest();

  ResepMakananModel resepMakananModel = ResepMakananModel();

  DetailResepMakananModel detailResepMakananModel = DetailResepMakananModel();

  getDataResepMakanan() async {
    emit(ResepMakananInitial());
    resepMakananModel = await resepMakananRequest.getResepMakanan();
    emit(DataResepMakanan(resepMakananModel));
  }

  getDetailDataResepMakanan(String key) async {
    emit(ResepMakananInitial());
    detailResepMakananModel =
        await resepMakananRequest.getDetailResepMakanan(key);
    emit(DataDetailResepMakanan(detailResepMakananModel));
  }
}
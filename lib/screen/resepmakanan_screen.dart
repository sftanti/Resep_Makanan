import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resep_makanan/cubit/resep_makanancubit.dart';
import 'package:resep_makanan/screen/detailresep_makanan_screen.dart';

class ResepMakananScreen extends StatefulWidget {
  const ResepMakananScreen({Key? key}) : super(key: key);

  @override
  State<ResepMakananScreen> createState() => _ResepMakananScreenState();
}

class _ResepMakananScreenState extends State<ResepMakananScreen> {

  final ResepMakananCubit resepMakananCubit = ResepMakananCubit();

  @override
  void initState() {

    resepMakananCubit.getDataResepMakanan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:Text("NIM : 191011450295 - NAMA : SAFITRI RISTANTI")
          ,)
      ),
      body: BlocBuilder<ResepMakananCubit, ResepMakananState>(
        bloc: resepMakananCubit,
        builder: (context, state) {
          if (state is ResepMakananInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: resepMakananCubit.resepMakananModel.results?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailResepMakananScreen(
                            keyResepMakanan: resepMakananCubit
                                .resepMakananModel.results?[index].key!,
                            titleResepMakanan: resepMakananCubit
                                .resepMakananModel.results?[index].title!,
                            thumbResepMakanan: resepMakananCubit
                                .resepMakananModel.results?[index].thumb!,
                          );
                        },
                      ),
                    );
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                  title: Text(
                    resepMakananCubit.resepMakananModel.results![index].title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(resepMakananCubit
                            .resepMakananModel.results![index].serving!),
                        Text(resepMakananCubit
                            .resepMakananModel.results![index].times!),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
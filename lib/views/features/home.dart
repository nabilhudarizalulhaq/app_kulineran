import 'package:apps_kulineran/blocs/home/home_bloc.dart';
import 'package:apps_kulineran/data/datasource/remote_data_source.dart';
import 'package:apps_kulineran/views/features/detail_item.dart';
import 'package:apps_kulineran/views/features/widget/custom_search.dart';
import 'package:apps_kulineran/views/features/widget/item_custom.dart';
import 'package:apps_kulineran/views/globals/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(remoteDataSource: RemoteDataSource())..add(LoadHome()),
      child: Scaffold(
        backgroundColor: lightGray,
        body: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 60, left: 22, right: 4),
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white60,
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                        width: 300,
                        child: Search(title: 'Search'),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){},
                        child: Image.asset(
                        'assets/images/img/ic_home.png',
                        width: 50,
                        height: 50,
                      ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Text(
                    'Delicious \nfood for you',
                    style: blackTextStyle.copyWith(
                      fontSize: 50,
                      fontWeight: extraBold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is HomeLoaded) {
                      final data = state.kuliners;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Wrap(
                          spacing: 2,
                          runSpacing: 10,
                          children: data.map((kuliner) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const DetailItem()),
                                );
                              },
                              child: SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    16,
                                child: Item_Content(
                                  name: kuliner.nama,
                                  price: kuliner.pemilik,
                                  imgUrl: kuliner.fotoUrl,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    } else if (state is HomeError) {
                      return Center(
                        child: Text(
                          'No Data',
                          style: greenTextStyle.copyWith(
                            fontSize: 30,
                            fontWeight: bold,
                          ),
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
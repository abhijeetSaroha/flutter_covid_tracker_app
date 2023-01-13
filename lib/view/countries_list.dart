import 'package:flutter/material.dart';
import 'package:flutter_corona_cases_tracker/services/stats_services.dart';
import 'package:flutter_corona_cases_tracker/view/detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search with Country Name',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: statsServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              highlightColor: Colors.grey.shade100,
                              baseColor: Colors.grey.shade700,
                              child: Column(
                                children: [
                                  ListTile(
                                      title: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white,
                                      ),
                                      subtitle: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white,
                                      ),
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];

                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                            name: snapshot.data![index]
                                                    ['country']
                                                .toString(),
                                            image: snapshot.data![index]
                                                    ['countryInfo']['flag']
                                                .toString(),
                                            totalCases: snapshot.data![index]
                                                    ['cases']
                                                .toString(),
                                            totalRecovered: snapshot
                                                .data![index]['recovered']
                                                .toString(),
                                            totalDeaths: snapshot.data![index]
                                                    ['deaths']
                                                .toString(),
                                            active: snapshot.data![index]
                                                    ['active']
                                                .toString(),
                                            test: snapshot.data![index]['test']
                                                .toString(),
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered']
                                                .toString(),
                                            critical: snapshot.data![index]
                                                    ['critical']
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                          snapshot.data![index]['countryInfo']
                                              ['flag'],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                            name: snapshot.data![index]
                                                    ['country']
                                                .toString(),
                                            image: snapshot.data![index]
                                                    ['countryInfo']['flag']
                                                .toString(),
                                            totalCases: snapshot.data![index]
                                                    ['cases']
                                                .toString(),
                                            totalRecovered: snapshot
                                                .data![index]['recovered']
                                                .toString(),
                                            totalDeaths: snapshot.data![index]
                                                    ['deaths']
                                                .toString(),
                                            active: snapshot.data![index]
                                                    ['active']
                                                .toString(),
                                            test: snapshot.data![index]['test']
                                                .toString(),
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered']
                                                .toString(),
                                            critical: snapshot.data![index]
                                                    ['critical']
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                          snapshot.data![index]['countryInfo']
                                              ['flag'],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

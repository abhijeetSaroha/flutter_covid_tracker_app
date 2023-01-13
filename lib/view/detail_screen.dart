import 'package:flutter/material.dart';
import 'package:flutter_corona_cases_tracker/view/world_stats.dart';

class DetailScreen extends StatefulWidget {
  String name,
      image,
      totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailScreen(
      {required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.todayRecovered,
      required this.active,
      required this.critical,
      required this.totalRecovered,
      required this.test});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.067,
                ),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      ResusableRow(
                        title: 'Cases',
                        value: widget.totalCases,
                      ),
                      ResusableRow(
                        title: 'Recovered',
                        value: widget.totalRecovered,
                      ),
                      ResusableRow(
                        title: 'Deaath',
                        value: widget.totalDeaths,
                      ),
                      ResusableRow(
                        title: 'Critical',
                        value: widget.critical,
                      ),
                      ResusableRow(
                        title: 'Today Recovered',
                        value: widget.todayRecovered,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

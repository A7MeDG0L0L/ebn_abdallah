import 'package:ebn_abdallah/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultFormField(
                controller: searchController,
                type: TextInputType.text,
                validate: () {},
                label: 'Search',
                prefix: Icons.search),
          ),
        ],
      ),
    );
  }
}

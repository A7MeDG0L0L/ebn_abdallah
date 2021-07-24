import 'package:ebn_abdallah/layout/home_cubit.dart';
import 'package:ebn_abdallah/layout/home_states.dart';
import 'package:ebn_abdallah/modules/search_screen.dart';
import 'package:ebn_abdallah/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandabar/main.view.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var nameController = TextEditingController();

  var colorController = TextEditingController();

  var sizeController = TextEditingController();

  var quantityController = TextEditingController();

  var priceForPieceController = TextEditingController();

  var priceForMultiplePieceController = TextEditingController();

  var descriptionController = TextEditingController();

  var imageController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return HomeCubit();
      },
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                'Ebn Abdallah',
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ));
                  },
                ),
              ],
            ),
            bottomNavigationBar: PandaBar(
              buttonData: HomeCubit.get(context).items,
              onChange: (id) {
                HomeCubit.get(context).changeNavIndex(id);
              },
              onFabButtonPressed: () {
                scaffoldKey.currentState!.showBottomSheet((context) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButton(
                              hint: _dropDownValue == null
                                  ? Text('Size')
                                  : Text(
                                      _dropDownValue!,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                              isExpanded: true,
                              iconSize: 30.0,
                              style: TextStyle(color: Colors.blue),
                              items: ['M', 'L', 'XL', '2XL', '3XL'].map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    _dropDownValue = val as String?;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: nameController,
                              type: TextInputType.text,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'Enter Name of the item';
                                }
                              },
                              label: 'Item Name',
                              prefix: Icons.text_fields,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: colorController,
                              type: TextInputType.text,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'Enter Color of the item';
                                }
                              },
                              label: 'Color',
                              prefix: Icons.color_lens_outlined,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: sizeController,
                              type: TextInputType.text,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'Enter Size of the item';
                                }
                              },
                              label: 'Item Size',
                              prefix: Icons.transform_sharp,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: quantityController,
                              type: TextInputType.number,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'Enter Quantity of the item';
                                }
                              },
                              label: 'Quantity Stock',
                              prefix: Icons.production_quantity_limits,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: priceForPieceController,
                              type: TextInputType.number,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'Enter Price for only one item';
                                }
                              },
                              label: 'One item Price',
                              prefix: Icons.price_change,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: priceForMultiplePieceController,
                              type: TextInputType.number,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'Enter Price for Multiple items';
                                }
                              },
                              label: 'price for Multiple Items',
                              prefix: Icons.price_check,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: descriptionController,
                              type: TextInputType.multiline,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return null;
                                }
                              },
                              label: 'Description',
                              prefix: Icons.description_outlined,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormField(
                              controller: imageController,
                              type: TextInputType.text,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'upload image';
                                }
                              },
                              label: 'Item\'s Image',
                              prefix: Icons.text_fields,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              },
              backgroundColor: Colors.blue,
              buttonColor: Colors.white,
              buttonSelectedColor: Colors.black,
            ),
            body: HomeCubit.get(context).builder(),
          );
        },
      ),
    );
  }
}

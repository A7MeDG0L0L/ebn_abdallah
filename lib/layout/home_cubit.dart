import 'package:ebn_abdallah/layout/home_states.dart';
import 'package:ebn_abdallah/modules/accounting_screen.dart';
import 'package:ebn_abdallah/modules/all_screen.dart';
import 'package:ebn_abdallah/modules/profile_screen.dart';
import 'package:ebn_abdallah/modules/savior_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandabar/pandabar.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    SaviorScreen(),
    AllScreen(),
    AccountingScreen(),
    ProfileScreen(),
  ];
  String id = 'savior';
  List<PandaBarButtonData> items = [
    PandaBarButtonData(
      id: 'savior',
      title: 'SaVioR',
      icon: Icons.view_in_ar,
    ),
    PandaBarButtonData(
      id: 'all',
      title: 'All Items',
      icon: Icons.all_inbox,
    ),
    PandaBarButtonData(
      id: 'Accounting',
      title: 'Accounting',
      icon: Icons.attach_money,
    ),
    PandaBarButtonData(
      id: 'Profile',
      title: 'Profile',
      icon: Icons.person,
    ),
  ];

  int? currentIndex;

  void changeNavIndex(String id) {
    this.id = id;
    emit(ChangeNavBarHomeState());
  }

  Widget? builder() {
    switch (this.id) {
      case 'savior':
        return SaviorScreen();
      case 'all':
        return AllScreen();
      case 'Accounting':
        return AccountingScreen();
      case 'Profile':
        return ProfileScreen();
    }
    emit(ChangeNavBarHomeState());
  }
}

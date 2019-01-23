import 'package:flutter/material.dart';

import 'package:flutter_app/Views/Profile/profile.dart';
import 'package:flutter_app/Views/Admin/admin_use_view.dart';
import 'package:flutter_app/Views/Admin/manage_users_view.dart';
import 'package:flutter_app/Views/Admin/manage_building_view.dart';
import 'package:flutter_app/Views/Admin/manage_room_view.dart';
import 'package:flutter_app/Views/Admin/view_complain_view.dart';
import 'package:flutter_app/Views/Admin/view_usage_view.dart';

import 'package:flutter_app/Models/admin_home_model.dart';

import 'package:flutter_app/CustomWidgets/common_home_view.dart';

import 'package:flutter_app/Classes/admin_navigation.dart';

class AdminHomeView extends StatefulWidget {

  final String role;

  AdminHomeView(this.role);

  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {

  AdminHomeModel model;
  AdminNevigation nevigation;

  @override
    void initState() {
      if(widget.role=="admin"){
        model=AdminHomeModel("Admin","admin");
      }
      else{
        model=AdminHomeModel("Director","director");
      }
      super.initState();
    }

  void _gotoProfile()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Profile(model.data.name,model.data.role)));
  }

  void _gotoUsage()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => AdminUseView()));
  }

  void _gotoManageUsers()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => ManageUsersView()));
  }

  void _gotoManageBuildings()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => ManageBuildingView()));
  }

  void _gotoManageRooms()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => ManageRoomView()));
  }

  void _gotoViewUsage()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => ViewUsageView()));
  }

  void _gotoViewComplains()
  {
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => ViewComplainView()));
  }

  @override
  Widget build(BuildContext context) {

    nevigation=AdminNevigation(
      gotoProfile: _gotoProfile,
      gotoUsage: _gotoUsage,
      gotoManageUsers: _gotoManageUsers,
      gotoManageBuildings: _gotoManageBuildings,
      gotoManageRooms: _gotoManageRooms,
      gotoViewUsage: _gotoViewUsage,
      gotoViewComplains: _gotoViewComplains
    );

    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          accentColor: Colors.teal),
      home: Scaffold(
        body:CommonHomeView(nevigation,model.data.name,model.data.role)
        
      ),
    );
  }
}
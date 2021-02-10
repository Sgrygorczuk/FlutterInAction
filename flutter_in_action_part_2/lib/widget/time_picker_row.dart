import 'package:flutter/material.dart';
import 'package:flutter_in_action_part_2/controller/forecast_controller.dart';
import 'package:flutter_in_action_part_2/utils/forecast_animation_utils.dart';

//Public Widget
class TimePickerRow extends StatefulWidget {
  //============================= Variables ====================================
  final List<String> tabItems;                //List of the times 0-21 in intervals of 3
  final ForecastController forecastController;  //Deals with the data for the city
  final Function onTabChange;                   //Tells parent when new tab is selected
  final int startIndex;                           //Where we are at
  //============================================================================

  //=============================== Constructor ================================
  const TimePickerRow({Key key, this.forecastController, this.tabItems,
    this.onTabChange, this.startIndex,}) : super(key: key);
  //============================================================================

  //============================ Methods =======================================
  @override
  _TimePickerRowState createState() => _TimePickerRowState();
  //============================================================================
}

//Private Widget Logic
class _TimePickerRowState extends State<TimePickerRow> with SingleTickerProviderStateMixin {
  //============================== Variables ===================================
  TabController _tabController;
  //============================================================================

  //============================= Methods ======================================
  @override
  //Setting up settings
  void initState() {
    _tabController = TabController(length: AnimationUtil.hours.length, vsync:
    this, initialIndex: widget.startIndex,);
    _tabController.addListener(handleTabChange); //Listens for change
    super.initState();
  }

  //
  void handleTabChange() {
    if (_tabController.indexIsChanging) return;
    widget.onTabChange(_tabController.index);
  }

  @override
  void didUpdateWidget(TimePickerRow oldWidget) {
    _tabController.animateTo(widget.startIndex);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  //============================================================================

  //================================= Widget ===================================
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black38,
      unselectedLabelStyle: Theme.of(context).textTheme.caption.copyWith(fontSize: 10.0),
      labelStyle: Theme.of(context).textTheme.caption.copyWith(fontSize: 12.0),
      indicatorColor: Colors.transparent,
      labelPadding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 8.0),
      controller: _tabController,
      tabs: widget.tabItems.map((t) => Text(t)).toList(),
      isScrollable: true,
    );
  }
  //============================================================================
}

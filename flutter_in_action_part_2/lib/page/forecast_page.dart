import 'package:flutter/material.dart';
import 'package:flutter_in_action_part_2/controller/forecast_controller.dart';
import 'package:flutter_in_action_part_2/model/app_setting.dart';
import 'package:flutter_in_action_part_2/model/forecast_animation_state.dart';
import 'package:flutter_in_action_part_2/model/offset_sequence.dart';
import 'package:flutter_in_action_part_2/model/weather.dart';
import 'package:flutter_in_action_part_2/utils/forecast_animation_utils.dart';
import 'package:flutter_in_action_part_2/utils/humanize.dart';
import 'package:flutter_in_action_part_2/widget/clouds_background.dart';
import 'package:flutter_in_action_part_2/widget/color_transition_box.dart';
import 'package:flutter_in_action_part_2/widget/color_transition_text.dart';
import 'package:flutter_in_action_part_2/widget/forecast_table.dart';
import 'package:flutter_in_action_part_2/widget/sun_background.dart';
import 'package:flutter_in_action_part_2/widget/time_picker_row.dart';
import 'package:flutter_in_action_part_2/widget/transition_appbar.dart';
import 'package:flutter_in_action_part_2/utils/flutter_ui.dart' as ui;

class ForecastPage extends StatefulWidget {
  final PopupMenuButton menu;
  final Widget settingsButton;
  final AppSetting settings;

  const ForecastPage({
    Key key,
    this.menu,
    this.settingsButton,
    @required this.settings,
  }) : super(key: key);

  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> with TickerProviderStateMixin {
  int activeTabIndex = 0;
  ForecastController _forecastController;
  AnimationController _animationController;
  AnimationController _weatherConditionAnimationController;
  ColorTween _colorTween;
  ColorTween _backgroundColorTween;
  ColorTween _textColorTween;
  ColorTween _cloudColorTween;
  Tween<Offset> _positionOffsetTween;
  TweenSequence<Offset> _cloudPositionOffsetTween;
  ForecastAnimationState currentAnimationState;
  ForecastAnimationState nextAnimationState;
  Offset verticalDragStart;

  @override
  void initState() {
    super.initState();
    _forecastController = ForecastController(widget.settings.activeCity);
    _render();
  }

  @override
  void didUpdateWidget(ForecastPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _render();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _weatherConditionAnimationController?.dispose();
    super.dispose();
  }

  void _render() {
    _forecastController.city = widget.settings.activeCity;
    var startTime = _forecastController.selectedHourlyTemperature.dateTime.hour;
    currentAnimationState = AnimationUtil.getDataForNextAnimationState(
      selectedDay: _forecastController.selectedDay,
      currentlySelectedTimeOfDay: startTime,
    );
    final activeTabIndex = AnimationUtil.hours.indexOf(startTime);
    _handleStateChange(activeTabIndex);
  }

  void _handleStateChange(int activeIndex) {
    /// If choosing the same tab, there's nothing to animate.
    if (activeIndex == activeTabIndex) return;

    /// The next animation state represents the _end_ values
    /// for the next animation that fires. (It will also become the
    /// starting values for the _next_ animation cycle.)
    nextAnimationState = AnimationUtil.getDataForNextAnimationState(
      selectedDay: _forecastController.selectedDay,
      currentlySelectedTimeOfDay: _forecastController.selectedHourlyTemperature.dateTime.hour,
    );

    /// These methods build all the relevant objects
    /// _and_ call `AnimationController.forward()`
    _buildAnimationController();
    _buildTweens();
    _initAnimation();

    /// At this point, multiple values on this object
    /// have been updated. Even though only `activeTabIndex` is
    /// set within the callback of setState, _all_ of the changed
    /// values on this object will be built appropriately.
    setState(() => activeTabIndex = activeIndex);

    var nextSelectedHour = AnimationUtil.getSelectedHourFromTabIndex(
      activeIndex,
      _forecastController.selectedDay,
    );

    /// set the selectedHourlyTemperature on the controller
    /// with the data from the _new_ values.
    /// This way, the data for the _next_ animation cycle
    /// is already loaded in.
    _forecastController.selectedHourlyTemperature = ForecastDay.getWeatherForHour(
      _forecastController.selectedDay,
      nextSelectedHour,
    );
    currentAnimationState = nextAnimationState;
  }

  void _handleDragEnd(DragUpdateDetails d, BuildContext context) {
    //Grabs the screen size from MediaQuery
    var screenHeight = MediaQuery.of(context).size.height;
    var dragEnd = d.globalPosition.dy;
    var percentage = (dragEnd / screenHeight) * 100.0;
    var scaleToTimesOfDay = (percentage ~/ 12).toInt();
    if (scaleToTimesOfDay > 7) scaleToTimesOfDay = 7;
    _handleStateChange(scaleToTimesOfDay);
  }

  void _initAnimation() {
    _animationController.forward();
    _weatherConditionAnimationController.forward();
  }

  void _buildAnimationController() {
    _animationController?.dispose();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _weatherConditionAnimationController?.dispose();
    _weatherConditionAnimationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  void _buildTweens() {
    _colorTween = ColorTween(
      begin: currentAnimationState.sunColor,
      end: nextAnimationState.sunColor,
    );
    _backgroundColorTween = ColorTween(
      begin: currentAnimationState.backgroundColor,
      end: nextAnimationState.backgroundColor,
    );
    _textColorTween = ColorTween(
      begin: currentAnimationState.textColor,
      end: nextAnimationState.textColor,
    );
    _cloudColorTween = ColorTween(
      begin: currentAnimationState.cloudColor,
      end: nextAnimationState.cloudColor,
    );
    _positionOffsetTween = Tween<Offset>(
      begin: currentAnimationState.sunOffsetPosition,
      end: nextAnimationState.sunOffsetPosition,
    );

    var cloudOffsetSequence = OffsetSequence.fromBeginAndEndPositions(
      currentAnimationState.cloudOffsetPosition,
      nextAnimationState.cloudOffsetPosition,
    );
    _cloudPositionOffsetTween = TweenSequence<Offset>(
      <TweenSequenceItem<Offset>>[
        TweenSequenceItem<Offset>(
          weight: 50.0,
          tween: Tween<Offset>(
            begin: cloudOffsetSequence.positionA,
            end: cloudOffsetSequence.positionB,
          ),
        ),
        TweenSequenceItem<Offset>(
          weight: 50.0,
          tween: Tween<Offset>(
            begin: cloudOffsetSequence.positionB,
            end: cloudOffsetSequence.positionC,
          ),
        ),
      ],
    );
  }

  //============================== Widget ======================================
  @override
  Widget build(BuildContext context) {
    //Gets the current temp string number and unit
    final _currentTemp = Humanize.currentTemperature(
      widget.settings.selectedTemperature,
      _forecastController.selectedHourlyTemperature,
    );

    //Gets the current weather description
    final _weatherDescription =
    Humanize.weatherDescription(_forecastController.selectedHourlyTemperature);
    final isRaining =
        _forecastController.selectedHourlyTemperature.description == WeatherDescription.rain;

    //Populates the forecast data
    final forecastContent = ForecastTableView(
      settings: widget.settings,
      controller: _animationController,
      textColorTween: _textColorTween,
      forecast: _forecastController.forecast,
    );

    //The Big text in the middle of the screen, Day, Weather Type and temperature
    final mainContent = Padding(
      padding: EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: <Widget>[
          ColorTransitionText(
            text: _weatherDescription,
            style: Theme.of(context).textTheme.headline,
            animation: _textColorTween.animate(_animationController),
          ),
          ColorTransitionText(
            text: _currentTemp,
            style: Theme.of(context).textTheme.display3,
            animation: _textColorTween.animate(_animationController),
          ),
        ],
      ),
    );

    //Sets up the time picker TabBar
    final timePickerRow = TimePickerRow(
      tabItems: Humanize.allHours(),
      forecastController: _forecastController,
      onTabChange: (int selectedTabIndex) => _handleStateChange(selectedTabIndex),
      startIndex: activeTabIndex,
    );

    //The main chunk of the UI screen
    return Scaffold(
      //Preferred size allows us to preset the size of it and its children
      //rather than allowing it to just conform to whatever it parents constraints were
      appBar: PreferredSize(
        //ui is not a class but the filed imported using in and renamed to 'ui'
        preferredSize: Size.fromHeight(ui.appBarHeight(context)),
        child: TransitionAppbar(
          animation: _backgroundColorTween.animate(_animationController),
          title: ColorTransitionText(
            text: _forecastController.selectedHourlyTemperature.city.name,
            style: Theme.of(context).textTheme.headline,
            animation: _textColorTween.animate(_animationController),
          ),
          actionIcon: widget.settingsButton,
          leadingAction: widget.menu,
        ),
      ),
      //Listens for action from user
      body: GestureDetector(
        onDoubleTap: () {
          //Specifically waits for the user to double tap the screen
          setState(() {
            //If occurs change the setting to the other unit type
            widget.settings.selectedTemperature == TemperatureUnit.celsius
                ? widget.settings.selectedTemperature = TemperatureUnit.fahrenheit
                : widget.settings.selectedTemperature = TemperatureUnit.celsius;
          });
        },
        //Deals with user dragon the screen up and down
        onVerticalDragUpdate: (DragUpdateDetails details) {
          //Updates data if detects dragging
          _handleDragEnd(details, context);
        },
        child: ColorTransitionBox(
          animation: _backgroundColorTween.animate(_animationController),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            //Stack puts the widgets on top of each other
            //So we draw the sun then the cloud on top it
            child: Stack(
              children: <Widget>[
                SlideTransition(
                  position: _positionOffsetTween.animate(
                    _animationController.drive(
                      CurveTween(curve: Curves.bounceOut),
                    ),
                  ),
                  child: Sun(
                    animation: _colorTween.animate(_animationController),
                  ),
                ),
                SlideTransition(
                  position: _cloudPositionOffsetTween.animate(
                    _weatherConditionAnimationController.drive(
                      CurveTween(curve: Curves.bounceOut),
                    ),
                  ),
                  child: Clouds(
                    isRaining: isRaining,
                    animation: _cloudColorTween.animate(_animationController),
                  ),
                ),
                //This sets all the text information that shows up on top of the
                //sun and clouds
                Column(
                  //Vertical direction is used to reverse the flow of the column
                  //flips the orders in which these are drawn
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    //Forecast table
                    forecastContent,
                    //Big text in the center
                    mainContent,
                    //The horizontal scrolling wheel
                    Flexible(child: timePickerRow),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //============================================================================
}

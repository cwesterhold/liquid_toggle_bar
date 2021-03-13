library liquid_toggle_bar;

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LiquidToggleBar extends StatefulWidget {
  ///The background color of the card holding tabs;
  final Color backgroundColor;

  ///The background color of the active tab
  final Color selectedTabColor;

  ///The background color of any shown inactive tabs;
  final Color tabColor;

  /// The text color of the active tab;
  final Color selectedTextColor;

  /// The text color of the inactive tabs
  final Color textColor;

  /// List of names of the tabs to be shown inside of the card
  /// for example - ['tabOne','tabTwo','tabThree']
  final List<String> tabsNames;

  /// Call back function on changing tabs
  /// this is an int - representing the index of the tabsNames list
  final Function(int) onSelectionUpdated;

  /// radius of the card corners
  final double borderRadius;

  /// this is the main class to call.
  LiquidToggleBar(
      {@required this.tabsNames,
      this.backgroundColor = Colors.grey,
      this.selectedTabColor = Colors.orangeAccent,
      this.tabColor = Colors.orange,
      this.selectedTextColor = Colors.white,
      this.textColor = Colors.white,
      this.onSelectionUpdated,
      this.borderRadius = 12});

  @override
  State<StatefulWidget> createState() {
    return _LiquidToggleBarState();
  }
}

class _LiquidToggleBarState extends State<LiquidToggleBar> {
  LinkedHashMap<String, bool> _hashMap = LinkedHashMap();
  int _selectedIndex = 0;
  PageController _controller = PageController(initialPage: 0, viewportFraction: .6);

  @override
  void initState() {
    _hashMap = LinkedHashMap.fromIterable(widget.tabsNames, value: (value) => value = false);
    _hashMap[widget.tabsNames[0]] = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.borderRadius)),
          color: widget.backgroundColor,
          child: Container(
            height: 50,
            padding: EdgeInsets.all(8.0),
            child: PageView.builder(
              itemCount: widget.tabsNames.length,
              controller: _controller,
              onPageChanged: (int index) => {
                setState(
                  () => {
                    _selectedIndex = index,
                    if (_controller.hasClients)
                      {
                        _controller.animateToPage(_selectedIndex,
                            duration: Duration(milliseconds: 400), curve: Curves.ease),
                        _updateSelection(_selectedIndex)
                      }
                  },
                ),
              },
              itemBuilder: (context, index) {
                return Transform.scale(
                  scale: index == _selectedIndex ? 1.0 : 0.9,
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: _hashMap.values.elementAt(index)
                          ? widget.selectedTabColor
                          : widget.tabColor != null
                              ? widget.tabColor
                              : null,
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => setState(
                          () => {
                            _updateSelection(index),
                            _controller.animateToPage(index,
                                duration: Duration(milliseconds: 400), curve: Curves.ease),
                          },
                        ),
                        child: Text(
                          _hashMap.keys.elementAt(index),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: _hashMap.values.elementAt(index)
                                  ? widget.selectedTextColor
                                  : widget.textColor),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  _updateSelection(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onSelectionUpdated(_selectedIndex);
      _hashMap.updateAll((label, selected) => selected = false);
      _hashMap[_hashMap.keys.elementAt(index)] = true;
    });
  }
}

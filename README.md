# Liquid Toggle Bar

![Screenshot_1615594687](https://user-images.githubusercontent.com/43251690/111011918-a566aa00-8360-11eb-90c8-8af9efff85b3.png)


Use Liquid Toggle Bar for an easy customizable tab interface.

## Getting Started

Add 

### Prerequisites

Works across Android, iOS, Web, Window, and Linux.


### Attributes

   Color backgroundColor - The background color of the card holding tabs 
   
   Color selectedTabColor - The background color of the active tab
   
   Color tabColor -  The background color of any shown inactive tabs
   
   Color selectedTextColor The text color of the active tab
   
   Color textColor The text color of the inactive tabs
   
   List<String> tabsNames - The list of tab names
   
   double borderRadius - The radius of the card holding the tabs
   
   Function(int) onSelectionUpdated - The callback function that gives the index
   


### Basic Example

int currentIndex = 0;

LiquidToggleBar(
  tabsNames: tabsNames,
  borderRadius: 0,
  backgroundColor: Colors.grey,
  selectedTabColor: Colors.orange,
  tabColor: Colors.purple,
  onSelectionUpdated: (index) => setState(() => currentIndex = index),
),

See example tab for more detail



## Built With Flutter Love


## Change Log

Check out the CHANGELOG.md file updates

## Authors

* **Chris Westerhold** - *Initial work* - (https://github.com/cwesterhold)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details








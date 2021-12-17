import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Menu Home Page', selectedPrices: [0], dropDownItems: [""], orderTotal: 0, totalItems: [""], loadState: "first"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.selectedPrices, required this.dropDownItems, required this.totalItems, required this.orderTotal, required this.loadState}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  final List<String> dropDownItems;
  final List<int> selectedPrices;

  final double orderTotal;
  final List<String> totalItems;

  final String loadState;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String dropdownValue = "No Items Selected";
  List<String> dropDownItems = ["No Items Selected"];

  double orderTotal = 0;
  List<String> totalItems = [];

  List<int> selectedPrices = [0];

  String resturantName = "*Insert name here*";

  static const TextStyle titleStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const TextStyle descStyle =
  TextStyle(fontSize: 16, fontWeight: FontWeight.bold);


  @override
  void initState() {

    if (widget.loadState == "first")
      {

      }
    if (widget.loadState == "empty")
      {
        orderTotal = widget.orderTotal;
        totalItems = widget.totalItems;
      }
    if (widget.loadState == "full")
      {
          dropDownItems = widget.dropDownItems;
          dropdownValue = "Selected Items:";
          orderTotal = widget.orderTotal;
          totalItems = widget.totalItems;
          selectedPrices = widget.selectedPrices;
      }
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _placeOrder() {
    setState(() {
      for(int i = 0; i < selectedPrices.length; i++)
      {
        orderTotal = orderTotal + selectedPrices[i];
      }

      for(int i = 1; i < dropDownItems.length; i++)
      {
        totalItems.add(dropDownItems[i]);
      }


      dropdownValue = "No Items Selected";
      dropDownItems = ["No Items Selected"];

      selectedPrices = [0];



    });
  }



  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Center(
        child: Container(
          color: Color(0xff7c94b6),
          child: Column(
            children: <Widget>[
              Text(
                'Welcome to ' + resturantName +'! ',
                style: titleStyle,
              ),
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),

              Text(
                'You can use the navigation bar below to view our selection',
                style: descStyle,
              ),
              Text(
                'of foods and drinks.',
                style: descStyle,
              ),
              Text(
                'To place your order, you can select the place order button ',
                style: descStyle,
              ),
              Text(
                'located on the top right.',
                style: descStyle,
              ),
              Text(
                'To pay after your meal, you can select the pay button located',
                style: descStyle,
              ),
              Text(
                'beside the place order button.',
                style: descStyle,
              ),
            ],
          ),

        ),
      ),
      Center(
        child: Container(
          //color: Color(0xff7c94b6),
          child: Column(
            children: <Widget>[
              Text(
                'Food Menu',
                style: titleStyle,
              ),
              Text(
                'To view our food menu click to button below',
                style: descStyle,
              ),

              FloatingActionButton(
                onPressed: () {

                  if (dropdownValue == "No Items Selected") {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        MyFoodMenuPage(title: 'Food Menu',
                            selectedPrices: [0],
                            dropDownItems: [""],
                            orderTotal: orderTotal,
                            totalItems: totalItems,
                            loadState: "empty")),);
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        MyFoodMenuPage(title: 'Food Menu',
                            selectedPrices: selectedPrices,
                            dropDownItems: dropDownItems,
                            orderTotal: orderTotal,
                            totalItems: totalItems,
                            loadState: "full")),);
                  }

                },
                tooltip: 'Open food menu',
                child: const Icon(Icons.food_bank),
              ),
            ],
          ),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.contain,
              image: new AssetImage(
                'assets/images/burger.png',
              ),

            ),
          ),
        ),
      ),
      Center(
        child: Container(
          //color: Color(0xff7c94b6),
          child: Column(
            children: <Widget>[
              Text(
                'Drink Menu',
                style: titleStyle,
              ),
              Text(
                'To view our drink menu click to button below',
                style: descStyle,
              ),

              FloatingActionButton(
                onPressed: () {


                  if (dropdownValue == "No Items Selected") {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        MyDrinkMenuPage(title: 'Drink Menu',
                            selectedPrices: [0],
                            dropDownItems: [""],
                            orderTotal: orderTotal,
                            totalItems: totalItems,
                            loadState: "empty")),);
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        MyDrinkMenuPage(title: 'Drink Menu',
                            selectedPrices: selectedPrices,
                            dropDownItems: dropDownItems,
                            orderTotal: orderTotal,
                            totalItems: totalItems,
                            loadState: "full")),);
                  }

                },
                tooltip: 'Open drink menu',
                child: const Icon(Icons.local_drink),
              ),
            ],
          ),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.contain,
              image: new AssetImage(
                'assets/images/drink.png',
              ),

            ),
          ),
        ),
      ),
    ];

    return new WillPopScope(
        onWillPop: () async => false,
    child: new Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Menu Home Page"),
        actions: <Widget> [
          Center(
            child:Text("View selected foods:     "),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                for(int i = 0; i < dropDownItems.length; i++)
                {
                  if (dropDownItems[i] == newValue!)
                  {
                    if (i != 0)
                    {
                      dropDownItems.removeAt(i);
                      i = dropDownItems.length + 1;
                    }
                    if (i == 0)
                    {
                      i = dropDownItems.length + 1;
                    }
                  }
                }
              });

            },
            items: dropDownItems
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(value.toString()+ "    "),
                    Icon(Icons.cancel,
                    color: Colors.red),
                  ],
                ),
              );
            }).toList(),
          ),

          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {

              _placeOrder();


            },
            tooltip: 'Place Order',
            child: const Icon(Icons.check),
          ),

          Center(
            child:Text("Your Totals:     \$" + orderTotal.toString()),
          ),

          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBillPage(title: 'Pay Bill', totalList: totalItems, totalCost: orderTotal)),
              );


            },
            tooltip: 'Ask for check',
            child: const Icon(Icons.attach_money),
          ),
          FloatingActionButton(
            heroTag: "btn3",
            onPressed: () {

              if (dropdownValue == "No Items Selected") {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    MySettingsPage(title: 'settings',
                        selectedPrices: [0],
                        dropDownItems: [""],
                        orderTotal: orderTotal,
                        totalItems: totalItems,
                        loadState: "empty")),);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    MySettingsPage(title: 'settings',
                        selectedPrices: selectedPrices,
                        dropDownItems: dropDownItems,
                        orderTotal: orderTotal,
                        totalItems: totalItems,
                        loadState: "full")),);
              }


            },
            tooltip: 'Open settings menu',
            child: const Icon(Icons.settings),
          ),
        ],
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Drinks',
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    ),
    );
  }
}

/*
//
//
//
 */

class MyFoodMenuPage extends StatefulWidget {
  const MyFoodMenuPage({Key? key, required this.title, required this.selectedPrices, required this.dropDownItems, required this.totalItems, required this.orderTotal, required this.loadState}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  final List<String> dropDownItems;
  final List<int> selectedPrices;

  final double orderTotal;
  final List<String> totalItems;

  final String loadState;

  @override
  State<MyFoodMenuPage> createState() => _MyFoodMenuPageState();
}

class _MyFoodMenuPageState extends State<MyFoodMenuPage> {
  String _imageSrc = 'assets/images/nocheese.png';
  double _imageTransparency = 1;
  Color _colour = Color(0xff7c94b6);

  List<String> items = ["Hamburger - \$10", "Cheeseburger - \$12", "Grilled Cheese - \$8", "Chicken Fingers - \$8"];
  List<int> prices = [10, 12, 8, 8];

  String selectedItem = "Hamburger - \$10";
  int selectedPrice = 10;

  String dropdownValue = "No Items Selected";
  List<String> dropDownItems = ["No Items Selected"];
  List<int> selectedPrices = [0];
  int dropDownIndex = 0;

  double orderTotal = 0;
  List<String> totalItems = [];

  @override
  void initState() {

    if (widget.loadState == "first")
    {

    }
    if (widget.loadState == "empty")
    {
      orderTotal = widget.orderTotal;
      totalItems = widget.totalItems;
    }
    if (widget.loadState == "full")
    {
      dropDownItems = widget.dropDownItems;
      dropdownValue = "Selected Items:";
      orderTotal = widget.orderTotal;
      totalItems = widget.totalItems;
      selectedPrices = widget.selectedPrices;
    }
    super.initState();
  }

  void _addItemToOrder() {
    setState(() {
        if (dropDownItems[0] == "No Items Selected")
          {
              dropDownItems[0] = "Selected Items:";
              dropdownValue = "Selected Items:";
              dropDownIndex = dropDownIndex + 1;
              dropDownItems.add(selectedItem);
              selectedPrices.add(selectedPrice);
          } else {
            dropDownIndex = dropDownIndex + 1;
            dropDownItems.add(selectedItem);
            selectedPrices.add(selectedPrice);
        }
    });
  }



  void _placeOrder() {
    setState(() {
        for(int i = 0; i < selectedPrices.length; i++)
          {
              orderTotal = orderTotal + selectedPrices[i];
          }

        for(int i = 1; i < dropDownItems.length; i++)
        {
          totalItems.add(dropDownItems[i]);
        }


      dropdownValue = "No Items Selected";
      dropDownItems = ["No Items Selected"];

      selectedPrices = [0];



    });
  }

  @override
  Widget build(BuildContext context) {

    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          Center(
            child:Text("View selected foods:     "),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {

                for(int i = 0; i < dropDownItems.length; i++)
                  {
                      if (dropDownItems[i] == newValue!)
                        {
                          if (i != 0)
                          {
                            dropDownItems.removeAt(i);
                            i = dropDownItems.length + 1;
                          }
                          if (i == 0)
                            {
                              i = dropDownItems.length + 1;
                            }
                        }
                  }

              });
            },
            items: dropDownItems
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(value.toString()+ "    "),
                    Icon(Icons.cancel,
                    color: Colors.red),
                  ],
                ),
              );
            }).toList(),
          ),

          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {

              _placeOrder();


            },
            tooltip: 'Place Order',
            child: const Icon(Icons.check),
          ),

          Center(
            child:Text("Your Total:     \$" + orderTotal.toString()),
          ),

          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBillPage(title: 'Pay Bill', totalList: totalItems, totalCost: orderTotal)),
              );


            },
            tooltip: 'Ask for check',
            child: const Icon(Icons.attach_money),
          ),
          FloatingActionButton(
            heroTag: "btn3",
            onPressed: () {


              if (dropdownValue == "No Items Selected") {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    MySettingsPage(title: 'settings',
                        selectedPrices: [0],
                        dropDownItems: [""],
                        orderTotal: orderTotal,
                        totalItems: totalItems,
                        loadState: "empty")),);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    MySettingsPage(title: 'settings',
                        selectedPrices: selectedPrices,
                        dropDownItems: dropDownItems,
                        orderTotal: orderTotal,
                        totalItems: totalItems,
                        loadState: "full")),);
              }

            },
            tooltip: 'Open settings menu',
            child: const Icon(Icons.settings),
          ),

        ],


      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Food Selection',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(

              title: Text(
                'Main Courses: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
                leading: Image(
                  image: AssetImage('assets/images/nocheese.png'),
                ),
                title: Text(items[0]),
                onTap: () {
                  setState(() {
                    _imageSrc = 'assets/images/nocheese.png';
                    selectedItem = items[0];
                    selectedPrice = prices[0];
                  }
                  );
                }
            ),
            ListTile(
                leading: Image(
                  image: AssetImage('assets/images/burger.png'),
                ),
                title: Text(items[1]),
                onTap: () {
                  setState(() {
                    _imageSrc = 'assets/images/burger.png';
                    selectedItem = items[1];
                    selectedPrice = prices[1];
                  }
                  );
                }
            ),
            ListTile(
                leading: Image(
                  image: AssetImage('assets/images/grilledcheese.png'),
                ),
                title: Text(items[2]),
                onTap: () {
                  setState(() {
                    _imageSrc = 'assets/images/grilledcheese.png';
                    selectedItem = items[2];
                    selectedPrice = prices[2];
                  }
                  );
                }
            ),
            ListTile(
                leading: Image(
                  image: AssetImage('assets/images/chickenFinger.png'),
                ),
                title: Text(items[3]),
                onTap: () {
                  setState(() {
                    _imageSrc = 'assets/images/chickenFinger.png';
                    selectedItem = items[3];
                    selectedPrice = prices[3];
                  }
                  );
                }
            ),


          ],
        ),
      ),
      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          width: 400,
          child: Column(
            children:<Widget> [
              Text("Food Menu",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
              ),
              FloatingActionButton(
                heroTag: "x",
                onPressed: () {

                    _addItemToOrder();

                },
                tooltip: 'Add To Order',
                child: const Text("Add To Order"),
              ),

          ],

          ),
          decoration: new BoxDecoration(
          color: _colour,
          image: new DecorationImage(
            fit: BoxFit.contain,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(_imageTransparency), BlendMode.dstATop),
            image: new AssetImage(
              '$_imageSrc',
            ),
          ),
        ),



        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: 'title')),
            ); */

          if (dropdownValue == "No Items Selected") {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                MyHomePage(title: 'title',
                    selectedPrices: [0],
                    dropDownItems: [""],
                    orderTotal: orderTotal,
                    totalItems: totalItems,
                    loadState: "empty")),);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                MyHomePage(title: 'title',
                    selectedPrices: selectedPrices,
                    dropDownItems: dropDownItems,
                    orderTotal: orderTotal,
                    totalItems: totalItems,
                    loadState: "full")),);
          }

        },
        tooltip: 'Return Home',
        child: const Icon(Icons.home),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyDrinkMenuPage extends StatefulWidget {
  const MyDrinkMenuPage({Key? key, required this.title, required this.selectedPrices, required this.dropDownItems, required this.totalItems, required this.orderTotal, required this.loadState}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  final List<String> dropDownItems;
  final List<int> selectedPrices;

  final double orderTotal;
  final List<String> totalItems;

  final String loadState;

  @override
  State<MyDrinkMenuPage> createState() => _MyDrinkMenuPageState();
}

class _MyDrinkMenuPageState extends State<MyDrinkMenuPage> {
  String _imageSrc = 'assets/images/water.png';
  double _imageTransparency = 1;
  Color _colour = Color(0xff7c94b6);

  List<String> items = ["Water - \$0", "Coke - \$2", "Beer - \$5"];
  List<int> prices = [0, 2, 5];

  String selectedItem = "Water - \$0";
  int selectedPrice = 0;

  String dropdownValue = "No Items Selected";
  List<String> dropDownItems = ["No Items Selected"];
  List<int> selectedPrices = [0];
  int dropDownIndex = 0;

  double orderTotal = 0;
  List<String> totalItems = [];

  @override
  void initState() {

    if (widget.loadState == "first")
    {

    }
    if (widget.loadState == "empty")
    {
      orderTotal = widget.orderTotal;
      totalItems = widget.totalItems;
    }
    if (widget.loadState == "full")
    {
      dropDownItems = widget.dropDownItems;
      dropdownValue = "Selected Items:";
      orderTotal = widget.orderTotal;
      totalItems = widget.totalItems;
      selectedPrices = widget.selectedPrices;
    }
    super.initState();
  }

  void _addItemToOrder() {
    setState(() {
      if (dropDownItems[0] == "No Items Selected")
      {
        dropDownItems[0] = "Selected Items:";
        dropdownValue = "Selected Items:";
        dropDownIndex = dropDownIndex + 1;
        dropDownItems.add(selectedItem);
        selectedPrices.add(selectedPrice);
      } else {
        dropDownIndex = dropDownIndex + 1;
        dropDownItems.add(selectedItem);
        selectedPrices.add(selectedPrice);
      }
    });
  }



  void _placeOrder() {
    setState(() {
      for(int i = 0; i < selectedPrices.length; i++)
      {
        orderTotal = orderTotal + selectedPrices[i];
      }

      for(int i = 1; i < dropDownItems.length; i++)
      {
        totalItems.add(dropDownItems[i]);
      }


      dropdownValue = "No Items Selected";
      dropDownItems = ["No Items Selected"];

      selectedPrices = [0];



    });
  }

  @override
  Widget build(BuildContext context) {

    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          Center(
            child:Text("View selected drinks:     "),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {

                for(int i = 0; i < dropDownItems.length; i++)
                {
                  if (dropDownItems[i] == newValue!)
                  {
                    if (i != 0)
                    {
                      dropDownItems.removeAt(i);
                      i = dropDownItems.length + 1;
                    }
                    if (i == 0)
                    {
                      i = dropDownItems.length + 1;
                    }
                  }
                }

              });
            },
            items: dropDownItems
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(value.toString()+ "    "),
                    Icon(Icons.cancel,
                        color: Colors.red),
                  ],
                ),
              );
            }).toList(),
          ),

          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {

              _placeOrder();


            },
            tooltip: 'Place Order',
            child: const Icon(Icons.check),
          ),

          Center(
            child:Text("Your Total:     \$" + orderTotal.toString()),
          ),

          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBillPage(title: 'Pay Bill', totalList: totalItems, totalCost: orderTotal)),
              );


            },
            tooltip: 'Ask for check',
            child: const Icon(Icons.attach_money),
          ),
          FloatingActionButton(
            heroTag: "btn3",
            onPressed: () {


              if (dropdownValue == "No Items Selected") {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    MySettingsPage(title: 'settings',
                        selectedPrices: [0],
                        dropDownItems: [""],
                        orderTotal: orderTotal,
                        totalItems: totalItems,
                        loadState: "empty")),);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    MySettingsPage(title: 'settings',
                        selectedPrices: selectedPrices,
                        dropDownItems: dropDownItems,
                        orderTotal: orderTotal,
                        totalItems: totalItems,
                        loadState: "full")),);
              }

            },
            tooltip: 'Open drink menu',
            child: const Icon(Icons.settings),
          ),

        ],


      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drink Selection',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                leading: Image(
                  image: AssetImage('assets/images/water.png'),
                ),
                title: Text(items[0]),
                onTap: () {
                  setState(() {
                    _imageSrc = 'assets/images/water.png';
                    selectedItem = items[0];
                    selectedPrice = prices[0];
                  }
                  );
                }
            ),
            ListTile(
                leading: Image(
                  image: AssetImage('assets/images/coke.png'),
                ),
                title: Text(items[1]),
                onTap: () {
                  setState(() {
                    _imageSrc = 'assets/images/coke.png';
                    selectedItem = items[1];
                    selectedPrice = prices[1];
                  }
                  );
                }
            ),
            ListTile(
                leading: Image(
                  image: AssetImage('assets/images/beer.png'),
                ),
                title: Text(items[2]),
                onTap: () {
                  setState(() {
                    _imageSrc = 'assets/images/beer.png';
                    selectedItem = items[2];
                    selectedPrice = prices[2];
                  }
                  );
                }
            ),


          ],
        ),
      ),
      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          width: 400,
          child: Column(
            children:<Widget> [
              Text("Food Menu",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              FloatingActionButton(
                heroTag: "x",
                onPressed: () {

                  _addItemToOrder();

                },
                tooltip: 'Add To Order',
                child: const Text("Add To Order"),
              ),

            ],

          ),
          decoration: new BoxDecoration(
            color: _colour,
            image: new DecorationImage(
              fit: BoxFit.contain,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(_imageTransparency), BlendMode.dstATop),
              image: new AssetImage(
                '$_imageSrc',
              ),
            ),
          ),



        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage(title: 'title')),
            ); */

          if (dropdownValue == "No Items Selected") {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                MyHomePage(title: 'title',
                    selectedPrices: [0],
                    dropDownItems: [""],
                    orderTotal: orderTotal,
                    totalItems: totalItems,
                    loadState: "empty")),);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                MyHomePage(title: 'title',
                    selectedPrices: selectedPrices,
                    dropDownItems: dropDownItems,
                    orderTotal: orderTotal,
                    totalItems: totalItems,
                    loadState: "full")),);
          }

        },
        tooltip: 'Return Home',
        child: const Icon(Icons.home),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyBillPage extends StatefulWidget {
  const MyBillPage({Key? key, required this.title, required this.totalList, required this.totalCost}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  final List<String> totalList;
  final double totalCost;

  @override
  State<MyBillPage> createState() => _MyBillState();
}

class _MyBillState extends State<MyBillPage> {

  String display = "----------\n   Bill   \n----------\n";

  @override
  void initState() {



    display = display + "Items Order: \n";
    for(int i = 0; i < widget.totalList.length; i++)
      {
        display = display + widget.totalList[i] + "\n";
      }

    display = display + " Total Cost: ....... \$" + widget.totalCost.toString();

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children:
            <Widget>[
        Text(display),

      FloatingActionButton(
        heroTag: "x2",
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              MyHomePage(title: 'Food Menu',
                  selectedPrices: [0],
                  dropDownItems: [""],
                  orderTotal: 0,
                  totalItems: [""],
                  loadState: "first")),
          );



        },
        tooltip: 'Confirm',
        child: const Text("Confirm"),
      ),

    ],

    ),
    );
  }
}

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({Key? key, required this.title, required this.selectedPrices, required this.dropDownItems, required this.totalItems, required this.orderTotal, required this.loadState}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  final List<String> dropDownItems;
  final List<int> selectedPrices;

  final double orderTotal;
  final List<String> totalItems;

  final String loadState;

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  int _selectedIndex = 0;
  String dropdownValue = "No Items Selected";
  List<String> dropDownItems = ["No Items Selected"];

  double orderTotal = 0;
  List<String> totalItems = [];

  List<int> selectedPrices = [0];

  Color _colour = Color(0xff7c94b6);



  static const TextStyle titleStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const TextStyle descStyle =
  TextStyle(fontSize: 16, fontWeight: FontWeight.bold);


  @override
  void initState() {

    if (widget.loadState == "first")
    {

    }
    if (widget.loadState == "empty")
    {
      orderTotal = widget.orderTotal;
      totalItems = widget.totalItems;
    }
    if (widget.loadState == "full")
    {
      dropDownItems = widget.dropDownItems;
      dropdownValue = "Selected Items:";
      orderTotal = widget.orderTotal;
      totalItems = widget.totalItems;
      selectedPrices = widget.selectedPrices;
    }
    super.initState();
  }



  void _placeOrder() {
    setState(() {
      for(int i = 0; i < selectedPrices.length; i++)
      {
        orderTotal = orderTotal + selectedPrices[i];
      }

      for(int i = 1; i < dropDownItems.length; i++)
      {
        totalItems.add(dropDownItems[i]);
      }


      dropdownValue = "No Items Selected";
      dropDownItems = ["No Items Selected"];

      selectedPrices = [0];



    });
  }



  @override
  Widget build(BuildContext context) {


    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Menu Home Page"),
          actions: <Widget> [
            Center(
              child:Text("View selected foods:     "),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  for(int i = 0; i < dropDownItems.length; i++)
                  {
                    if (dropDownItems[i] == newValue!)
                    {
                      if (i != 0)
                      {
                        dropDownItems.removeAt(i);
                        i = dropDownItems.length + 1;
                      }
                      if (i == 0)
                      {
                        i = dropDownItems.length + 1;
                      }
                    }
                  }
                });

              },
              items: dropDownItems
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(value.toString()+ "    "),
                      Icon(Icons.cancel,
                          color: Colors.red),
                    ],
                  ),
                );
              }).toList(),
            ),

            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {

                _placeOrder();


              },
              tooltip: 'Place Order',
              child: const Icon(Icons.check),
            ),

            Center(
              child:Text("Your Totals:     \$" + orderTotal.toString()),
            ),

            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBillPage(title: 'Pay Bill', totalList: totalItems, totalCost: orderTotal)),
                );


              },
              tooltip: 'Ask for check',
              child: const Icon(Icons.attach_money),
            ),
            FloatingActionButton(
              heroTag: "btn3",
              onPressed: () {


                if (dropdownValue == "No Items Selected") {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      MyHomePage(title: 'main menu',
                          selectedPrices: [0],
                          dropDownItems: [""],
                          orderTotal: orderTotal,
                          totalItems: totalItems,
                          loadState: "empty")),);
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      MyHomePage(title: 'main menu',
                          selectedPrices: selectedPrices,
                          dropDownItems: dropDownItems,
                          orderTotal: orderTotal,
                          totalItems: totalItems,
                          loadState: "full")),);
                }

              },
              tooltip: 'Return Home',
              child: const Icon(Icons.home),
            ),
          ],
        ),

        body: Center(

        ),
      ),
    );
  }
}
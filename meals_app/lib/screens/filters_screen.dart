import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  Function saveFilters;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(_selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 50, bottom: 20),
            child: Text(" Select the filters as required",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              SwitchListTile(
                title: Text("Gluten-Free"),
                value: _glutenFree,
                subtitle: Text("Only include gluten-free meals"),
                onChanged: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Vegan"),
                value: _vegan,
                subtitle: Text("Only include vegan meals"),
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Vegetarian"),
                value: _vegetarian,
                subtitle: Text("Only include vegetarian meals"),
                onChanged: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Lactose-Free"),
                value: _lactoseFree,
                subtitle: Text("Only include lactose-free meals"),
                onChanged: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}

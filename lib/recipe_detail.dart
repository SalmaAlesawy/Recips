import 'package:flutter/material.dart';
import 'package:recipeapp/main.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.recipe.lable!,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
               return const MyHomePage(title: "Recipe");
              }));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(image: AssetImage(widget.recipe.imageUrl!)),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.recipe.lable!,
                style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.recipe.ingredients!.length,
                    itemBuilder: (context, index) {
                      final ingredient = widget.recipe.ingredients![index];
                      return Row(
                        children: [
                          Text("${ingredient.quantity! * _sliderVal}",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 19),),
                          const SizedBox(width: 5,),
                          Text("${ingredient.measure}",style: TextStyle(fontSize: 20),),
                          const SizedBox(width: 5,),
                          Text("${ingredient.name}",style: TextStyle(fontSize: 20),)
                        ],
                      );
                      return Text("${ingredient.quantity}"
                          "${ingredient.measure}"
                          " ${ingredient.name}");
                    }),
              ),
              Expanded(
                child: Slider(
                  min: 1,
                  max: 10,thumbColor: Colors.black,
                  divisions: 10,
                  label: "${_sliderVal * widget.recipe.servings!} Serving",
                  value: _sliderVal.toDouble(),
                  onChanged: (val) {
                    setState(() {
                      _sliderVal = val.round();
                    });
                  },
                  activeColor: Colors.red,
                  inactiveColor: Colors.yellow,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

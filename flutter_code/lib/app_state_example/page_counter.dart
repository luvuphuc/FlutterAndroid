import 'package:flutter/material.dart';
import 'package:luvuphuc63135096/app_state_example/counterState.dart';
import 'package:provider/provider.dart';

class CounterStateProvider extends StatelessWidget {
  const CounterStateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterState(),
      child: PageCounter2(),
    );
  }
}
class PageCounter extends StatelessWidget {
  PageCounter({super.key});
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Page Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //doi tuong duoc tra ve boi read chi dc use trong cac su kien
                  var c = context.read<CounterState>();
                  value++;
                  c.tang();
                },
                child: Text("+",style: TextStyle(
                    fontSize: 20)
                )
            ),
            Consumer<CounterState>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Text("${value.count}",style: TextStyle(fontSize: 20),),
                      child?? Text("chua co widget")
                    ],
                  );
                },
              child: Text("Not rebuild: $value"),
            ),
            ElevatedButton(
                onPressed: () {
                  //doi tuong duoc tra ve boi read chi dc use trong cac su kien
                  var c = context.read<CounterState>();
                  c.giam();
                  value--;
                },
                child: Text("-",style: TextStyle(
                  fontSize: 20
                ),)
            )
          ],
        ),
      ),
    );
  }
}

class PageCounter2 extends StatelessWidget {
  const PageCounter2({super.key});

  @override
  Widget build(BuildContext context) {
    //var c = context.watch<CounterState>();
    //cach 2
    var c = Provider.of<CounterState>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My Counter Page 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  var c = context.read<CounterState>();
                  c.tang();
                },
                child: Text("+")
            ),
            Text("${c.count}"),
            ElevatedButton(
                onPressed: () {
                  var c = context.read<CounterState>();
                  c.giam();
                },
                child: Text("-")
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/api_integration_using_bloc/counter/counter_bloc.dart';
import 'package:machine_test/api_integration_using_bloc/counter/counter_event.dart';
import 'package:machine_test/api_integration_using_bloc/counter/counter_state.dart';
import 'package:machine_test/main.dart';

void main(){
  runApp(BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(home: HomePage(),)));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('build -> called');
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc,CounterState>(
              builder: (context,state) {
                print('BlockBuilder()-> called');

                return Text("${state.count}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: (){
              context.read<CounterBloc>().add(Increment());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: (){
              context.read<CounterBloc>().add(Decrement());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

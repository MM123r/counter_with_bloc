import 'package:counter_with_bloc/bloc/counter_bloc.dart';
import 'package:counter_with_bloc/bloc/counter_event.dart';
import 'package:counter_with_bloc/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
          body: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state is UpdateCounterState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Counter Value has been Update Successfully")));
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Counter with bloc",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

                const SizedBox(height: 30,),
                
                 Text(
                  context.read<CounterBloc>().counter.toString(),
                  style: const TextStyle(
                    fontSize: 24
                  ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(addcounterevent());
                          },
                          icon: const Icon(Icons.add)),
                      IconButton(
                          onPressed: () {
                            context
                                .read<CounterBloc>()
                                .add(removecounterevent());
                          },
                          icon: const Icon(Icons.remove)),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}

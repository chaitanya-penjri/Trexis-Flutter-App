import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPageBlocCubit extends StatelessWidget {
  const CounterPageBlocCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter using Bloc and Cubit"),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => CounterBody(count: count,),
      )
    );
  }
}

class CounterBody extends StatelessWidget {
  CounterBody({Key? key, required this.count}) : super(key: key);
  int count;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // plus button
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: Text("+"),
            ),

            // counter text
            Text(
              "$count",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800
              ),
            ),

            // minus button
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().decrement();
              },
              child: Text("-"),
            ),
          ],
        ),
      ),
    );
  }
}


class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

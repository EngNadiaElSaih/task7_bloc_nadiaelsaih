import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/item_bloc.dart';
import 'package:flutter_application_1/counter/cubit/counter_cubit.dart';
import 'package:flutter_application_1/model/repoistory/item.dart';
import 'package:flutter_application_1/pages/Counter_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CounterPage()),
                );
              },
              icon: Icon(Icons.add)),
        ],
        title: Text(
          "Bloc Page",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ItemBloc, ItemState>(
              builder: (context, state) {
                if (state is ItemLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ItemLoadedState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(state.items[index].name ?? "No name"),
                        subtitle: Text(
                            state.items[index].description ?? "No description"),
                        onTap: () =>
                            context.read<Item>().selectItem(state.items[index]),
                      ),
                    ),
                  );
                } else if (state is ItemErrorState) {
                  return Center(
                    child: Text('Error: ${state.error}'),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        child: Icon(Icons.add),
        tooltip: 'Increment',
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

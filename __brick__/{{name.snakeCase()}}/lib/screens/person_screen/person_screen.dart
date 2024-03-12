import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/person_bloc.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonBloc()..add(GetAllPersonsEvent()),
      child: const PersonScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Person',
        ),
      ),
      body: Container(
        child: BlocBuilder<PersonBloc, PersonState>(
          builder: (context, state) {
            return switch (state) {
              PersonInitial() => const Center(
                  child: CircularProgressIndicator(),
                ),
              PersonError() => Center(
                  child: Text(state.message),
                ),
              PersonSuccess() => ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.persons[index].name),
                      subtitle: Text(state.persons[index].age.toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: state.persons.length,
                )
            };
          },
        ),
      ),
    );
  }
}

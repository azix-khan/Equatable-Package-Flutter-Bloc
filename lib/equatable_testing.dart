import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Person person = const Person(name: 'azix', age: 19);
        Person person1 = const Person(name: 'azix', age: 19);

        print(person.hashCode.toString());
        print(person1.hashCode.toString());

        print(person == person1);
        // print(person == person);
      }),
    );
  }
}

//--->>> With Equatable Package
class Person extends Equatable {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}

//--->>> Without Equatable Package

// class Person {
//   final String name;
//   final int age;

//   const Person({required this.name, required this.age});

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Person &&
//           runtimeType == other.runtimeType &&
//           name == other.name &&
//           age == other.age;

//   @override
//   int get hashCode => name.hashCode ^ age.hashCode;
// }

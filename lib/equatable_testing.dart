import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  String? personHash;
  String? person1Hash;
  bool? areEqual;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // if the hashcode of the values is not same it shows false and if the values are same it shows true

          // Person person = const Person(name: 'azix', age: 19);
          // Person person1 = const Person(name: 'azix', age: 19);

          Person person = const Person(name: 'azix khan', age: 19);
          Person person1 = const Person(name: 'azix', age: 19);

          setState(() {
            personHash = person.hashCode.toString();
            person1Hash = person1.hashCode.toString();
            areEqual = person == person1;
          });

          print(personHash);
          print(person1Hash);
          print(areEqual);
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Person hash code: ${personHash ?? 'Not calculated'}'),
            Text('Person1 hash code: ${person1Hash ?? 'Not calculated'}'),
            Text('Are they equal? ${areEqual ?? 'Not checked'}'),
          ],
        ),
      ),
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

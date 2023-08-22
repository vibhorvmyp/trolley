import 'package:flutter/material.dart';
import 'package:trolley/constants/colors.dart';

class TrolleyCreditModel {
  final String status;
  final String id;
  final String date;
  final String currency;
  final String amount;
  final Color amountColor;

  TrolleyCreditModel({
    this.currency = '',
    this.amount = '',
    this.date = '',
    this.id = '',
    this.status = '',
    this.amountColor = Colors.black,
  });

  static List<TrolleyCreditModel> trolleyCreditList1 = [
    TrolleyCreditModel(
      status: 'PAID',
      id: '#TROLL12345',
      date: '26th May 2023, 11:30 am',
      amount: '198.90',
      currency: 'EGP ',
      amountColor: kColorBlack2,
    ),
    TrolleyCreditModel(
      status: 'Topped Up',
      id: '#TROLL12345',
      date: '26th May 2023, 11:30 am',
      amount: '198.90',
      currency: '+EGP ',
      amountColor: const Color(0xFF4CB64C),
    ),
    TrolleyCreditModel(
      status: 'Topped Up',
      id: '#TROLL12345',
      date: '26th May 2023, 11:30 am',
      amount: '198.90',
      currency: '+EGP ',
      amountColor: const Color(0xFF4CB64C),
    ),
    TrolleyCreditModel(
      status: 'Topped Up',
      id: '#TROLL12345',
      date: '26th May 2023, 11:30 am',
      amount: '198.90',
      currency: '+EGP ',
      amountColor: const Color(0xFF4CB64C),
    ),
    TrolleyCreditModel(
      status: 'Topped Up',
      id: '#TROLL12345',
      date: '26th May 2023, 11:30 am',
      amount: '198.90',
      currency: '+EGP ',
      amountColor: const Color(0xFF4CB64C),
    ),
  ];

  static List<Map<String, List<TrolleyCreditModel>>> tsListAll = [
    {
      'Today': [
        TrolleyCreditModel(
          status: 'PAID',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: 'EGP ',
          amountColor: kColorBlack2,
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
      ],
    },
    {
      'Yesterday': [
        TrolleyCreditModel(
          status: 'PAID',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: 'EGP ',
          amountColor: kColorBlack2,
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
      ],
    },
    {
      '23rd May 2023': [
        TrolleyCreditModel(
          status: 'PAID',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: 'EGP ',
          amountColor: kColorBlack2,
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
      ],
    },
    {
      '24rd May 2023': [
        TrolleyCreditModel(
          status: 'PAID',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: 'EGP ',
          amountColor: kColorBlack2,
        ),
      ],
    }
  ];

  static List<Map<String, List<TrolleyCreditModel>>> tsListDebits = [
    {
      'Today': [
        TrolleyCreditModel(
          status: 'PAID',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: 'EGP ',
          amountColor: kColorBlack2,
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: 'EGP ',
          amountColor: kColorBlack2,
        ),
      ],
    },
    {
      'Yesterday': [
        TrolleyCreditModel(
          status: 'PAID',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: 'EGP ',
          amountColor: kColorBlack2,
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: 'EGP ',
          amountColor: kColorBlack2,
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: 'EGP ',
          amountColor: kColorBlack2,
        ),
      ],
    },
  ];

  static List<Map<String, List<TrolleyCreditModel>>> tsListCredits = [
    {
      'Today': [
        TrolleyCreditModel(
          status: 'PAID',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
      ],
    },
    {
      'Yesterday': [
        TrolleyCreditModel(
          status: 'PAID',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
      ],
    },
    {
      '23rd May 2023': [
        TrolleyCreditModel(
          status: 'PAID',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
        TrolleyCreditModel(
          status: 'Topped Up',
          id: '#TROLL12345',
          date: '26th May 2023, 11:30 am',
          amount: '198.90',
          currency: '+EGP ',
          amountColor: const Color(0xFF4CB64C),
        ),
      ],
    },
  ];
}

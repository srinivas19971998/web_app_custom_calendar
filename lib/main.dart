import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _currentDate = DateTime.now();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  String _selectedButton = 'All';
  void _updateDates(DateTime startDate, DateTime endDate) {
    setState(() {
      _startDate = startDate;
      _endDate = endDate;
    });
  }

  void _showLastSixMonths() {
    DateTime startDate = DateTime(_currentDate.year, _currentDate.month - 6, 1);
    DateTime endDate = DateTime(_currentDate.year, _currentDate.month, 0);
    _updateDates(startDate, endDate);
    setState(() => _selectedButton = 'Last 6 Months');
  }

  void _showLastThreeMonths() {
    DateTime startDate = DateTime(_currentDate.year, _currentDate.month - 3, 1);
    DateTime endDate = DateTime(_currentDate.year, _currentDate.month, 0);
    _updateDates(startDate, endDate);
    setState(() => _selectedButton = 'Last 3 Months');
  }

  void _showThisMonth() {
    DateTime startDate = DateTime(_currentDate.year, _currentDate.month, 1);
    DateTime endDate = DateTime(_currentDate.year, _currentDate.month + 1, 0);
    _updateDates(startDate, endDate);
    setState(() => _selectedButton = 'This Month');
  }

  void _showLastSevenDays() {
    DateTime startDate = _currentDate.subtract(const Duration(days: 6));
    DateTime endDate = _currentDate;
    _updateDates(startDate, endDate);
    setState(() => _selectedButton = 'Last 7 Days');
  }

  void _showToday() {
    DateTime startDate = _currentDate;
    DateTime endDate = _currentDate;
    _updateDates(startDate, endDate);
    setState(() => _selectedButton = 'Today');
  }

  void _showAllDates() {
    setState(() {
      _currentDate = DateTime.now();
      _startDate = DateTime(_currentDate.year, _currentDate.month, 1);
      _endDate = DateTime(_currentDate.year, _currentDate.month + 1, 0);
      _selectedButton = 'All';
    });
  }

  @override
  Widget build(BuildContext context) {
    int startWeekday =
        DateTime(_currentDate.year, _currentDate.month, 1).weekday;

    List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 500,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: _showAllDates,
                                  style: TextButton.styleFrom(
                                    foregroundColor: _selectedButton == 'All'
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                  child: const Text(
                                    'All',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: _showToday,
                                  style: TextButton.styleFrom(
                                    foregroundColor: _selectedButton == 'Today'
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                  child: const Text(
                                    'Today',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: _showLastSevenDays,
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        _selectedButton == 'Last 7 Days'
                                            ? Colors.blue
                                            : Colors.black,
                                  ),
                                  child: const Text(
                                    'Last 7 Days',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: _showThisMonth,
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        _selectedButton == 'This Month'
                                            ? Colors.blue
                                            : Colors.black,
                                  ),
                                  child: const Text(
                                    'This Month',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: _showLastThreeMonths,
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        _selectedButton == 'Last 3 Months'
                                            ? Colors.blue
                                            : Colors.black,
                                  ),
                                  child: const Text(
                                    'Last 3 Months',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: _showLastSixMonths,
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        _selectedButton == 'Last 6 Months'
                                            ? Colors.blue
                                            : Colors.black,
                                  ),
                                  child: const Text(
                                    'Last 6 Months',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    _buildFirstDateContainer(
                        _startDate, _endDate, startWeekday, daysOfWeek),
                    const SizedBox(
                      width: 40,
                    ),
                    _buildFirstDateContainer(
                        _endDate, _startDate, startWeekday, daysOfWeek),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                width: 330,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Calendar : ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${_startDate.day}-${_startDate.month}-${_startDate.year} to ${_endDate.day}-${_endDate.month}-${_endDate.year}',
                      style: const TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstDateContainer(DateTime startDate, DateTime endDate,
      int startWeekday, List<String> daysOfWeek) {
    int daysInMonth = DateTime(startDate.year, startDate.month + 1, 0).day;

    return Container(
      height: 350,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              '${startDate.month} ${startDate.year}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var day in daysOfWeek)
                Text(
                  day,
                  style: const TextStyle(fontSize: 14),
                ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: daysInMonth + startWeekday,
              itemBuilder: (context, index) {
                if (index < startWeekday) {
                  return Container();
                } else {
                  int day = index - startWeekday + 1;
                  return Center(
                    child: Text(
                      '$day',
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

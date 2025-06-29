import 'package:flutter/material.dart';
import 'package:throtl/core/utils/routes/route_constants.dart';
import 'package:throtl/core/utils/themes/pallete.dart';

class MaintenanceScreen extends StatefulWidget {
  static const routeName = RouteConstants.maintenanceRoute;
  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedBike = 'Road Master';
  
  final List<String> bikes = ['Road Master', 'Mountain Explorer', 'City Cruiser'];
  
  // Sample maintenance data
  final List<MaintenanceTask> upcomingTasks = [
    MaintenanceTask(
      title: 'Chain Lubrication',
      description: 'Clean and lubricate chain',
      dueDate: DateTime.now().add(Duration(days: 3)),
      priority: Priority.high,
      category: MaintenanceCategory.drivetrain,
      estimatedTime: 30,
    ),
    MaintenanceTask(
      title: 'Brake Inspection',
      description: 'Check brake pads and cables',
      dueDate: DateTime.now().add(Duration(days: 7)),
      priority: Priority.medium,
      category: MaintenanceCategory.brakes,
      estimatedTime: 45,
    ),
    MaintenanceTask(
      title: 'Tire Pressure Check',
      description: 'Check and adjust tire pressure',
      dueDate: DateTime.now().add(Duration(days: 1)),
      priority: Priority.low,
      category: MaintenanceCategory.wheels,
      estimatedTime: 15,
    ),
  ];

  final List<MaintenanceTask> completedTasks = [
    MaintenanceTask(
      title: 'Full Bike Service',
      description: 'Complete bike overhaul and inspection',
      dueDate: DateTime.now().subtract(Duration(days: 10)),
      priority: Priority.high,
      category: MaintenanceCategory.general,
      estimatedTime: 180,
      isCompleted: true,
      completedDate: DateTime.now().subtract(Duration(days: 10)),
    ),
    MaintenanceTask(
      title: 'Wheel Truing',
      description: 'Adjust wheel spokes for proper alignment',
      dueDate: DateTime.now().subtract(Duration(days: 15)),
      priority: Priority.medium,
      category: MaintenanceCategory.wheels,
      estimatedTime: 60,
      isCompleted: true,
      completedDate: DateTime.now().subtract(Duration(days: 15)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor:AppColors.cardBackground,
        elevation: 0,
        title: Text(
          'Maintenance',
          style: TextStyle(
            color: AppColors.cardHeading,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () => _showAddMaintenanceDialog(),
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () => _showFilterDialog(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Bike Selector
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Bike',
                  style: TextStyle(
                    color: AppColors.cardParagraph,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                DropdownButton<String>(
                  value: selectedBike,
                  dropdownColor: Color(0xFF4F5D75),
                  style: TextStyle(
                    color: AppColors. cardHeading,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  underline: Container(),
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  items: bikes.map((String bike) {
                    return DropdownMenuItem<String>(
                      value: bike,
                      child: Text(bike),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBike = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          
          // Quick Stats
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Overdue',
                    '2',
                    Colors.red,
                    Icons.warning,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Due Soon',
                    '3',
                    Colors.orange,
                    Icons.schedule,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Completed',
                    '15',
                    Colors.green,
                    Icons.check_circle,
                  ),
                ),
              ],
            ),
          ),
          
          // Tab Bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.iconStroke,
              ),
              labelColor: AppColors.cardHeading,
              unselectedLabelColor: AppColors.cardParagraph,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: 'Upcoming'),
                Tab(text: 'Overdue'),
                Tab(text: 'Completed'),
              ],
            ),
          ),
          
          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildUpcomingTab(),
                _buildOverdueTab(),
                _buildCompletedTab(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMaintenanceDialog(),
        backgroundColor: AppColors.iconHighlight,
        child: Icon(Icons.add, color: AppColors.iconMain),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.cardParagraph,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: upcomingTasks.length,
      itemBuilder: (context, index) {
        return MaintenanceTaskCard(
          task: upcomingTasks[index],
          onComplete: () => _completeTask(upcomingTasks[index]),
          onEdit: () => _editTask(upcomingTasks[index]),
        );
      },
    );
  }

  Widget _buildOverdueTab() {
    final overdueTasks = upcomingTasks.where((task) => 
      task.dueDate.isBefore(DateTime.now())).toList();
    
    if (overdueTasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 80, color: Colors.green),
            SizedBox(height: 16),
            Text(
              'No overdue tasks!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Great job staying on top of maintenance',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: overdueTasks.length,
      itemBuilder: (context, index) {
        return MaintenanceTaskCard(
          task: overdueTasks[index],
          isOverdue: true,
          onComplete: () => _completeTask(overdueTasks[index]),
          onEdit: () => _editTask(overdueTasks[index]),
        );
      },
    );
  }

  Widget _buildCompletedTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: completedTasks.length,
      itemBuilder: (context, index) {
        return MaintenanceTaskCard(
          task: completedTasks[index],
          onEdit: () => _editTask(completedTasks[index]),
        );
      },
    );
  }

  void _completeTask(MaintenanceTask task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Complete Task'),
          content: Text('Mark "${task.title}" as completed?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Complete'),
              onPressed: () {
                setState(() {
                  task.isCompleted = true;
                  task.completedDate = DateTime.now();
                  upcomingTasks.remove(task);
                  completedTasks.insert(0, task);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Task completed!')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _editTask(MaintenanceTask task) {
    // Implementation for editing task
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit task functionality would be implemented here')),
    );
  }

  void _showAddMaintenanceDialog() {
    // Implementation for adding new maintenance task
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Add maintenance task dialog would open here')),
    );
  }

  void _showFilterDialog() {
    // Implementation for filtering tasks
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Filter options would be shown here')),
    );
  }
}

class MaintenanceTaskCard extends StatelessWidget {
  final MaintenanceTask task;
  final bool isOverdue;
  final VoidCallback? onComplete;
  final VoidCallback? onEdit;

  const MaintenanceTaskCard({
    required this.task,
    this.isOverdue = false,
    this.onComplete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = task.isCompleted;
    final Color borderColor = isCompleted 
        ? Colors.green 
        : isOverdue 
            ? Colors.red 
            : _getPriorityColor(task.priority);

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(task.category).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    _getCategoryName(task.category),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: _getCategoryColor(task.category),
                    ),
                  ),
                ),
                Spacer(),
                if (!isCompleted)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: borderColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      isOverdue ? 'OVERDUE' : _getPriorityName(task.priority),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: borderColor,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              task.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isCompleted ? AppColors.cardHeading : AppColors.subheadline,
                decoration: isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            SizedBox(height: 4),
            Text(
              task.description,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.subheadline,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 16,
                  color: AppColors.cardParagraph,
                ),
                SizedBox(width: 4),
                Text(
                  isCompleted 
                      ? 'Completed: ${_formatDate(task.completedDate!)}'
                      : 'Due: ${_formatDate(task.dueDate)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.cardParagraph,
                  ),
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.timer,
                  size: 16,
                  color: AppColors.cardParagraph,
                ),
                SizedBox(width: 4),
                Text(
                  '${task.estimatedTime} min',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.cardParagraph,
                  ),
                ),
                Spacer(),
                if (!isCompleted && onComplete != null)
                  IconButton(
                    icon: Icon(Icons.check_circle, color: Colors.green),
                    onPressed: onComplete,
                  ),
                if (onEdit != null)
                  IconButton(
                    icon: Icon(Icons.edit, color: AppColors.cardParagraph),
                    onPressed: onEdit,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.high:
        return Colors.red;
      case Priority.medium:
        return Colors.orange;
      case Priority.low:
        return Colors.blue;
    }
  }

  String _getPriorityName(Priority priority) {
    switch (priority) {
      case Priority.high:
        return 'HIGH';
      case Priority.medium:
        return 'MEDIUM';
      case Priority.low:
        return 'LOW';
    }
  }

  Color _getCategoryColor(MaintenanceCategory category) {
    switch (category) {
      case MaintenanceCategory.drivetrain:
        return Colors.purple;
      case MaintenanceCategory.brakes:
        return Colors.red;
      case MaintenanceCategory.wheels:
        return Colors.blue;
      case MaintenanceCategory.frame:
        return Colors.green;
      case MaintenanceCategory.suspension:
        return Colors.orange;
      case MaintenanceCategory.general:
        return Colors.grey;
    }
  }

  String _getCategoryName(MaintenanceCategory category) {
    switch (category) {
      case MaintenanceCategory.drivetrain:
        return 'Drivetrain';
      case MaintenanceCategory.brakes:
        return 'Brakes';
      case MaintenanceCategory.wheels:
        return 'Wheels';
      case MaintenanceCategory.frame:
        return 'Frame';
      case MaintenanceCategory.suspension:
        return 'Suspension';
      case MaintenanceCategory.general:
        return 'General';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class MaintenanceTask {
  final String title;
  final String description;
  final DateTime dueDate;
  final Priority priority;
  final MaintenanceCategory category;
  final int estimatedTime;
  bool isCompleted;
  DateTime? completedDate;

  MaintenanceTask({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.category,
    required this.estimatedTime,
    this.isCompleted = false,
    this.completedDate,
  });
}

enum Priority { high, medium, low }
enum MaintenanceCategory { drivetrain, brakes, wheels, frame, suspension, general }
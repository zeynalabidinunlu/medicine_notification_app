import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:medicine_notification_app/common/common_page_transition.dart';
import 'package:medicine_notification_app/data/models/blood_pressure/blood_pressure_model.dart';
import 'package:medicine_notification_app/presentation/blood_pressure/blood_pressure_view_model.dart';
import 'package:medicine_notification_app/presentation/blood_pressure/widgets/adding_blood_pressure.dart';
import 'package:provider/provider.dart';

class BloodPressureView extends StatefulWidget {
  const BloodPressureView({super.key});

  @override
  State<BloodPressureView> createState() => _BloodPressureViewState();
}

class _BloodPressureViewState extends State<BloodPressureView> {
  bool _showChart = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BloodPressureViewModel>().loadBloodPressures();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kan Basıncı'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_showChart ? Icons.list : Icons.analytics),
            onPressed: () => setState(() => _showChart = !_showChart),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await context.fadeToPage(const AddingBloodPressure());
              if (mounted) {
                context.read<BloodPressureViewModel>().loadBloodPressures();
              }
            },
          ),
        ],
      ),
      body: Consumer<BloodPressureViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return _buildErrorWidget(viewModel);
          }

          if (viewModel.bloodPressures.isEmpty) {
            return _buildEmptyWidget();
          }

          return RefreshIndicator(
            onRefresh: () => viewModel.loadBloodPressures(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  // Summary Cards
                  _buildSummaryCards(viewModel.bloodPressures, theme),
                  
                  const SizedBox(height: 16),
                  
                  // Chart or List Toggle
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _showChart
                        ? _buildChartView(viewModel.bloodPressures, theme)
                        : _buildListView(viewModel.bloodPressures, viewModel),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget(BloodPressureViewModel viewModel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Hata: ${viewModel.errorMessage}',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => viewModel.loadBloodPressures(),
            icon: const Icon(Icons.refresh),
            label: const Text('Tekrar Dene'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_outline,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Henüz kan basıncı verisi yok',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            'Yeni ölçüm eklemek için + butonuna tıklayın',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(List<BloodPressure> bloodPressures, ThemeData theme) {
    final latest = bloodPressures.isNotEmpty ? bloodPressures.last : null;
    final average = _calculateAverages(bloodPressures);
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryCard(
              title: 'Son Ölçüm',
              systolic: latest?.systolic?.toInt().toString() ?? '-',
              diastolic: latest?.diastolic?.toInt().toString() ?? '-',
              pulse: latest?.pulse?.toInt().toString() ?? '-',
              icon: Icons.schedule,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSummaryCard(
              title: 'Ortalama',
              systolic: average['systolic']?.toInt().toString() ?? '-',
              diastolic: average['diastolic']?.toInt().toString() ?? '-',
              pulse: average['pulse']?.toInt().toString() ?? '-',
              icon: Icons.analytics,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String systolic,
    required String diastolic,
    required String pulse,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '$systolic/$diastolic',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Nabız: $pulse',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartView(List<BloodPressure> bloodPressures, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kan Basıncı Trendi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 20,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.shade300,
                        strokeWidth: 1,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: 1,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            if (value.toInt() < bloodPressures.length) {
                              final date = bloodPressures[value.toInt()].measurementDate;
                              return SideTitleWidget(
                                meta: meta,
                                child: Text(
                                  DateFormat('dd/MM').format(date ?? DateTime.now()),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            }
                            return const Text('');
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 20,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          },
                          reservedSize: 32,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    minX: 0,
                    maxX: (bloodPressures.length - 1).toDouble(),
                    minY: 40,
                    maxY: 200,
                    lineBarsData: [
                      // Sistolik çizgisi
                      LineChartBarData(
                        spots: bloodPressures.asMap().entries.map((entry) {
                          return FlSpot(entry.key.toDouble(), entry.value.systolic ?? 0);
                        }).toList(),
                        isCurved: true,
                        color: Colors.red,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 4,
                            color: Colors.red,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          ),
                        ),
                        belowBarData: BarAreaData(show: false),
                      ),
                      // Diastolik çizgisi
                      LineChartBarData(
                        spots: bloodPressures.asMap().entries.map((entry) {
                          return FlSpot(entry.key.toDouble(), entry.value.diastolic ?? 0);
                        }).toList(),
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 4,
                            color: Colors.blue,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          ),
                        ),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Legend
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendItem('Sistolik', Colors.red),
                  const SizedBox(width: 20),
                  _buildLegendItem('Diastolik', Colors.blue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildListView(List<BloodPressure> bloodPressures, BloodPressureViewModel viewModel) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bloodPressures.length,
      itemBuilder: (context, index) {
        final bloodPressure = bloodPressures[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: _getBloodPressureColor(bloodPressure.systolic, bloodPressure.diastolic),
                child: const Icon(Icons.favorite, color: Colors.white),
              ),
              title: Text(
                'Sistolik: ${bloodPressure.systolic?.toInt() ?? '-'}, Diastolik: ${bloodPressure.diastolic?.toInt() ?? '-'}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nabız: ${bloodPressure.pulse?.toInt() ?? '-'} bpm'),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm').format(bloodPressure.measurementDate ?? DateTime.now()),
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  if (bloodPressure.notes != null && bloodPressure.notes!.isNotEmpty)
                    Text(
                      bloodPressure.notes!,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Sil'),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'delete') {
                    _showDeleteDialog(context, viewModel, bloodPressure);
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getBloodPressureColor(double? systolic, double? diastolic) {
    if (systolic == null || diastolic == null) return Colors.grey;
    
    if (systolic >= 140 || diastolic >= 90) {
      return Colors.red; // Hipertansiyon
    } else if (systolic >= 130 || diastolic >= 80) {
      return Colors.orange; // Yüksek normal
    } else if (systolic >= 120 || diastolic >= 80) {
      return Colors.yellow.shade700; // Normal üst sınır
    } else {
      return Colors.green; // Normal
    }
  }

  Map<String, double> _calculateAverages(List<BloodPressure> bloodPressures) {
    if (bloodPressures.isEmpty) return {};
    
    double totalSystolic = 0;
    double totalDiastolic = 0;
    double totalPulse = 0;
    int count = 0;
    
    for (final bp in bloodPressures) {
      if (bp.systolic != null && bp.diastolic != null && bp.pulse != null) {
        totalSystolic += bp.systolic!;
        totalDiastolic += bp.diastolic!;
        totalPulse += bp.pulse!;
        count++;
      }
    }
    
    if (count == 0) return {};
    
    return {
      'systolic': totalSystolic / count,
      'diastolic': totalDiastolic / count,
      'pulse': totalPulse / count,
    };
  }

  void _showDeleteDialog(BuildContext context, BloodPressureViewModel viewModel, BloodPressure bloodPressure) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Silme İşlemi'),
        content: const Text('Bu kan basıncı kaydını silmek istediğinizden emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                await viewModel.deleteBloodPressure(bloodPressure.id!);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Kan basıncı kaydı silindi'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Hata: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: const Text('Sil', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
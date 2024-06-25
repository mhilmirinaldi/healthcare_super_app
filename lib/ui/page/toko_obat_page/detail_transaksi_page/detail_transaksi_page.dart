import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/extension/constant.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class DetailTransaksiPage extends ConsumerStatefulWidget {
  final Transaksi transaksi;

  const DetailTransaksiPage({super.key, required this.transaksi});

  @override
  _DetailTransaksiPageState createState() => _DetailTransaksiPageState();
}

class _DetailTransaksiPageState extends ConsumerState<DetailTransaksiPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng _initialPosition = LatLng(-6.21462, 106.84513);
  static const LatLng _pickupPosition = LatLng(-6.22462, 106.84513);
  static const LatLng _destinationPosition = LatLng(-6.23462, 106.84513);
  List<LatLng> polylineCoordinates = [];
  BitmapDescriptor? _driverIcon;
  LatLng _driverPosition = _initialPosition;
  int _currentStep = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _setPolyline();
    _startSimulation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setDriverIcon();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _setDriverIcon() async {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor assetIcon = await BitmapDescriptor.asset(
      configuration,
      'assets/nomor_str.png',
    );

    setState(() {
      _driverIcon = assetIcon;
    });
  }

  void _setPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      api_map_key,
      PointLatLng(_initialPosition.latitude, _initialPosition.longitude),
      PointLatLng(_destinationPosition.latitude, _destinationPosition.longitude),
    );

    if (result.points.isNotEmpty) {
      setState(() {
        polylineCoordinates = result.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();
      });
    }
  }

  void _startSimulation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        if (_currentStep < 4) {
          _currentStep++;
          if (_currentStep == 2) {
            _driverPosition = _pickupPosition;
          } else if (_currentStep == 3) {
            _driverPosition = LatLng(
                (_pickupPosition.latitude + _destinationPosition.latitude) / 2,
                (_pickupPosition.longitude + _destinationPosition.longitude) / 2);
          } else if (_currentStep == 4) {
            _driverPosition = _destinationPosition;
          }
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
            ),
          ),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => ref.read(routerProvider).pushNamed('main'),
              ),
            ),
            elevation: 2,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Detail Pemesanan',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _initialPosition,
                zoom: 14.0,
              ),
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route'),
                  points: polylineCoordinates,
                  color: Colors.blue,
                  width: 6,
                ),
              },
              markers: _driverIcon == null ? Set() : {
                Marker(
                  markerId: const MarkerId('driver'),
                  position: _driverPosition,
                  icon: _driverIcon!,
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Stepper(
            currentStep: _currentStep - 1,
            steps: [
              Step(
                title: const Text('Pesanan Terkonfirmasi'),
                content: const Text('Pesanan Anda telah dikonfirmasi.'),
                isActive: _currentStep >= 1,
              ),
              Step(
                title: const Text('Driver Ditugaskan'),
                content: const Text('Driver telah ditugaskan untuk pesanan Anda.'),
                isActive: _currentStep >= 2,
              ),
              Step(
                title: const Text('Dalam Perjalanan'),
                content: const Text('Driver sedang dalam perjalanan.'),
                isActive: _currentStep >= 3,
              ),
              Step(
                title: const Text('Pesanan Diterima'),
                content: const Text('Pesanan telah diterima.'),
                isActive: _currentStep >= 4,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pesanan',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(widget.transaksi.toString()),
                const SizedBox(height: 16),
                const Text(
                  'Pembayaran',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text('Barang: Rp10.000'),
                const Text('Biaya Pengiriman: Rp9.000'),
                const Text('Biaya Layanan: Rp5.000'),
                const Text('Jumlah Pembayaran: Rp24.000'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

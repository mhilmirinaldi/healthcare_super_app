import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:super_app_telemedicine/domain/entity/transaksi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_app_telemedicine/ui/extension/constant.dart';
import 'package:super_app_telemedicine/ui/extension/int_extension.dart';
import 'package:super_app_telemedicine/ui/misc/colors.dart';
import 'package:super_app_telemedicine/ui/page/toko_obat_page/detail_transaksi_page/detail_transaksi_obat_card.dart';
import 'package:super_app_telemedicine/ui/provider/router/router_provider.dart';

class DetailTransaksiPage extends ConsumerStatefulWidget {
  final Transaksi transaksi;

  const DetailTransaksiPage({super.key, required this.transaksi});

  @override
  _DetailTransaksiPageState createState() => _DetailTransaksiPageState();
}

class _DetailTransaksiPageState extends ConsumerState<DetailTransaksiPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng _initialPosition = LatLng(-6.944683, 107.671837);
  static const LatLng _pickupPosition = LatLng(-6.947940, 107.676121);
  static const LatLng _destinationPosition = LatLng(-6.959329, 107.674962);
  List<LatLng> polylineCoordinates = [];
  BitmapDescriptor? _driverIcon;
  BitmapDescriptor? _pickupIcon;
  BitmapDescriptor? _destinationIcon;
  int _currentStep = 1;
  int _polylineIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _setPolyline();
    // delay to simulate driver assignment
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _currentStep = 2;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setCustomIcons();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _setCustomIcons() async {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor driverIcon = await BitmapDescriptor.fromAssetImage(
      configuration,
      'assets/alumnus.png',
    );
    BitmapDescriptor pickupIcon = await BitmapDescriptor.fromAssetImage(
      configuration,
      'assets/nomor_str.png',
    );
    BitmapDescriptor destinationIcon = await BitmapDescriptor.fromAssetImage(
      configuration,
      'assets/nomor_str.png',
    );

    setState(() {
      _driverIcon = driverIcon;
      _pickupIcon = pickupIcon;
      _destinationIcon = destinationIcon;
    });
  }

  void _setPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      api_map_key,
      PointLatLng(_initialPosition.latitude, _initialPosition.longitude),
      PointLatLng(
          _destinationPosition.latitude, _destinationPosition.longitude),
    );

    if (result.points.isNotEmpty) {
      setState(() {
        polylineCoordinates = result.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();
        _startSimulation();
      });
    }
  }

  void _startSimulation() {
    const updateInterval = Duration(milliseconds: 250);
    _timer = Timer.periodic(updateInterval, (timer) {
      if (_polylineIndex < polylineCoordinates.length - 1) {
        setState(() {
          _polylineIndex++;
          _updateDriverStep();
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _updateDriverStep() {
    LatLng currentPosition = polylineCoordinates[_polylineIndex];
    const double marginError = 50;

    if (_distanceBetween(currentPosition, _pickupPosition) < marginError) {
      setState(() {
        _currentStep = 3;
      });
    } else if (_distanceBetween(currentPosition, _destinationPosition) <
        marginError) {
      setState(() {
        _currentStep = 4;
      });
    }
  }

  LatLng get _driverPosition => _polylineIndex < polylineCoordinates.length
      ? polylineCoordinates[_polylineIndex]
      : _destinationPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0),
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
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _destinationPosition,
                zoom: 15.0,
              ),
              polylines: {
                Polyline(
                  polylineId: const PolylineId('route'),
                  points: polylineCoordinates,
                  color: primaryColor,
                  width: 5,
                ),
              },
              markers: {
                if (_driverIcon != null)
                  Marker(
                    markerId: const MarkerId('driver'),
                    position: _driverPosition,
                    icon: _driverIcon!,
                  ),
                if (_pickupIcon != null)
                  Marker(
                    markerId: const MarkerId('pickup'),
                    position: _pickupPosition,
                    icon: _pickupIcon!,
                  ),
                if (_destinationIcon != null)
                  Marker(
                    markerId: const MarkerId('destination'),
                    position: _destinationPosition,
                    icon: _destinationIcon!,
                  ),
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: true,
              compassEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              rotateGesturesEnabled: true,
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStepIndicator(1, "Pesanan \nTerkonfirmasi"),
                    _buildStepIndicator(2, "Driver \nDitugaskan"),
                    _buildStepIndicator(3, "Dalam \nPerjalanan"),
                    _buildStepIndicator(4, "Pesanan \nDiterima"),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
                const SizedBox(height: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pesanan',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: widget.transaksi.listObat!
                          .map((e) => DetailTransaksiObatCard(obat: e))
                          .toList(),
                    ),
                    const SizedBox(height: 0),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 2),
                    const Text(
                      'Pembayaran',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Biaya Barang',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          (widget.transaksi.totalHarga-15000).toIDRCurrency(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Biaya Pengiriman',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          9000.toIDRCurrency(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Biaya Layanan',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          6000.toIDRCurrency(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Jumlah Pembayaran',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          (widget.transaksi.totalHarga).toIDRCurrency(),
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: _currentStep >= step ? primaryColor : Colors.grey,
          child: Text(
            step.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        Text(title,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  double _distanceBetween(LatLng start, LatLng end) {
    return Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
  }
}

import 'package:get/get.dart';
import 'package:t_store/data/repositories/banner/banner%20repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../utils/helpers/network_manager.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;
  final RxBool isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final _bannerRepo = Get.put(BannerRepository());

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Get All Banners
  Future<void> fetchBanners() async {
    try {
      isLoading(true);
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading(false);
        TLoaders.errorSnackBar(title: "Internet Problem", message: "Check your internet connections");
        return;
      }
      final banners = await _bannerRepo.getAllBanners();
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading(false);
    }
  }
}

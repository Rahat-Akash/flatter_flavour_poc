import 'bottom_navigation_item.dart';
import 'content_rating_maturity_levels.dart';
import 'footer_item_Settings.dart';
import 'navigation_entity.dart';
import 'payment_currencies.dart';
import 'syatem_language_supported.dart';

class SettingsEntity {
  final bool? loginRequired;
  final bool? restrictVpn;
  final int? otpLength;
  final int? otpExpiryTime;
  final String? appName;
  final String? slogan;
  final String? frontendUrl;
  final String? apiUrl;
  final String? assetUrlFile;
  final String? assetUrlImage;
  final String? assetVideoUrl;
  final int? cmsMobileImgQ;
  final int? tvAppImgQ;
  final List<MaturityLevels>? contentRatingMaturityLevels;
  final bool? premiumBadgeEnabled;
  final bool? providerBadgeEnabled;
  final bool? showContentView;
  final bool? tvAppinReview;
  final List<NavigationEntity>? navigationHeader;
  final List<NavigationEntity>? navigationFooter;
  final List<NavigationEntity>? navigationBottom;
  final List<NavigationEntity>? navigationDrawer;
  final List<NavigationEntity>? navigationMusic;
  final String? analyticsGoogleTagManagerId;
  final String? matomoSiteId;
  final String? matomoUrl;
  final String? mixpanelToken;
  final String? appBGColor;
  final String? appBGImage;
  final String? appCoverImage;
  final String? appNameBN;
  final String? sloganBN;
  final String? defaultAvatar;
  final List<BottomItems> bottomNavigationItem;
  final bool? cmsContentRatingEnabled;
  final bool? premiumBadgeEnabledForEntitled;
  final String? compnayCity;
  final String? companyCountry;
  final String? companyEmail;
  final String? companyName;
  final String? companyPhone;
  final String? companyPostalCode;
  final String? companySTAddress;
  final String? fevicon;
  final String? footerCopyRight;
  final List<FooterItemSettings>? footerItems;
  final int freeUserDeviceLimit;
  final bool? freeUserDeveiceLimitEnabled;
  final int freeUserMaxResolution;
  final String? defaultLanguage;
  final List<SyatemLanguageSupported>? systemLanguageSupported;
  final String? liveTvDescription;
  final String? liveTvM3U8Url;
  final String? liveTvThumbline;
  final String? liveTvTitle;
  final String? logo;
  final String? logoInverse;
  final String? minimumAppVersionAndroid;
  final String? minimumAppVersionFireTv;
  final String? minimumAppVersionIOS;
  final String? minimumAppVersionLgTv;
  final String? minimumAppVersionRokuTv;
  final String? minimumAppVersionSamsungTv;
  final List<NavigationEntity>? navItems;
  final List<Currencies>? paymentCurrencies;
  final bool? onlinePaymentAndroid;
  final dynamic onlinePaymentAndroidVersion;
  final bool? onlinePaymentIOS;
  final dynamic onlinePaymentIOSVersion;
  final String? paymentGetwaysAppStoreLogo;
  final String? paymentgetwaysBilldeskLogo;
  final String? paymentGetwayBkashLogo;
  final String? paymentGetwaysGooglePayLogo;
  final String? paymentGetwaysNogodLogo;
  final String? paymentGetwaysPaypalLogo;
  final String? paymentGetwaysSSLCOMMERZLogo;
  final String? paymentGetwaysStripeLogo;
  final String? socialLinkAppStorShortLink;
  final String? socialLinkAppleApp;
  final String? socialLinkFacebook;
  final String? socialLinkGooglePay;
  final String? socialLinkInstagram;
  final String? socialLinkLinkdine;
  final String? socialLinkReddit;
  final String? socialLinkTiktok;
  final String? socialLinkTwitter;
  final String? socialLinkYoutube;
  final String? storeLinkAppStoreShortLink;
  final String? storeLinkAppleAppStore;
  final String? storeLinkGooglePlayStore;
  final String? appleTvStoreLink;
  final String? supportEmail;
  final String? supportPhone;
  final String? purchasePolicyDifferentPackageExtends;
  final String? purchasePolicySamePackageExtends;


  SettingsEntity({
    this.loginRequired,
    this.restrictVpn,
    this.otpLength,
    this.otpExpiryTime,
    this.appName,
    this.slogan,
    this.frontendUrl,
    this.apiUrl,
    this.assetUrlFile,
    this.assetUrlImage,
    this.assetVideoUrl,
    this.cmsMobileImgQ,
    this.tvAppImgQ,
    this.contentRatingMaturityLevels,
    this.premiumBadgeEnabled,
    this.providerBadgeEnabled,
    this.showContentView,
    this.tvAppinReview,
    this.navigationHeader,
    this.navigationFooter,
    this.navigationBottom,
    this.navigationDrawer,
    this.navigationMusic,
    this.analyticsGoogleTagManagerId,
    this.matomoSiteId,
    this.matomoUrl,
    this.mixpanelToken,
    this.appBGColor,
    this.appBGImage,
    this.appCoverImage,
    this.appNameBN,
    this.sloganBN,
    this.defaultAvatar,
    required this.bottomNavigationItem,
    this.cmsContentRatingEnabled,
    this.premiumBadgeEnabledForEntitled,
    this.compnayCity,
    this.companyCountry,
    this.companyEmail,
    this.companyName,
    this.companyPhone,
    this.companyPostalCode,
    this.companySTAddress,
    this.fevicon,
    this.footerCopyRight,
    this.footerItems,
    required this.freeUserDeviceLimit,
    this.freeUserDeveiceLimitEnabled,
    required this.freeUserMaxResolution,
    this.defaultLanguage,
    this.systemLanguageSupported,
    this.liveTvDescription,
    this.liveTvM3U8Url,
    this.liveTvThumbline,
    this.liveTvTitle,
    this.logo,
    this.logoInverse,
    this.minimumAppVersionAndroid,
    this.minimumAppVersionFireTv,
    this.minimumAppVersionIOS,
    this.minimumAppVersionLgTv,
    this.minimumAppVersionRokuTv,
    this.minimumAppVersionSamsungTv,
    this.navItems,
    this.paymentCurrencies,
    this.onlinePaymentAndroid,
    this.onlinePaymentAndroidVersion,
    this.onlinePaymentIOS,
    this.onlinePaymentIOSVersion,
    this.paymentGetwaysAppStoreLogo,
    this.paymentgetwaysBilldeskLogo,
    this.paymentGetwayBkashLogo,
    this.paymentGetwaysGooglePayLogo,
    this.paymentGetwaysNogodLogo,
    this.paymentGetwaysPaypalLogo,
    this.paymentGetwaysSSLCOMMERZLogo,
    this.paymentGetwaysStripeLogo,
    this.socialLinkAppStorShortLink,
    this.socialLinkAppleApp,
    this.socialLinkFacebook,
    this.socialLinkGooglePay,
    this.socialLinkInstagram,
    this.socialLinkLinkdine,
    this.socialLinkReddit,
    this.socialLinkTiktok,
    this.socialLinkTwitter,
    this.socialLinkYoutube,
    this.storeLinkAppStoreShortLink,
    this.storeLinkAppleAppStore,
    this.storeLinkGooglePlayStore,
    this.appleTvStoreLink,
    this.supportEmail,
    this.supportPhone,
    this.purchasePolicyDifferentPackageExtends,
    this.purchasePolicySamePackageExtends,
  });

 
}
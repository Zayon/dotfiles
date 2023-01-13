/* 0000: disable about:config warning
 * FF73-86: chrome://global/content/config.xhtml ***/
 user_pref("general.warnOnAboutConfig", false); // XHTML version
 user_pref("browser.aboutConfig.showWarning", false); // HTML version [FF71+]

/* 0101: disable default browser check
 * [SETTING] General>Startup>Always check if Firefox is your default browser ***/
user_pref("browser.shell.checkDefaultBrowser", false);

/* 0105b: disable Activity Stream Snippets
 * Runs code received from a server (aka Remote Code Execution) and sends information back to a metrics server
 * [1] https://abouthome-snippets-service.readthedocs.io/ ***/
 user_pref("browser.newtabpage.activity-stream.feeds.snippets", false); // [DEFAULT: false FF89+]
 /* 0105c: disable Activity Stream Top Stories, Pocket-based and/or sponsored content ***/
 user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
 user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
 user_pref("browser.newtabpage.activity-stream.showSponsored", false);
 user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false); // [FF66+]
/* 0105e: clear default topsites
 * [NOTE] This does not block you from adding your own ***/
user_pref("browser.newtabpage.activity-stream.default.sites", "");

/** GEOLOCATION ***/
/* 0203: use Mozilla geolocation service instead of Google when geolocation is enabled [FF74+] */
user_pref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
/* 0204: disable using the OS's geolocation service ***/
user_pref("geo.provider.ms-windows-location", false); // [WINDOWS]
user_pref("geo.provider.use_corelocation", false); // [MAC]
user_pref("geo.provider.use_gpsd", false); // [LINUX]

/* 0330: disable telemetry
 * the pref (.unified) affects the behaviour of the pref (.enabled)
 * IF unified=false then .enabled controls the telemetry module
 * IF unified=true then .enabled ONLY controls whether to record extended data
 * so make sure to have both set as false
 * [NOTE] FF58+ 'toolkit.telemetry.enabled' is now LOCKED to reflect prerelease
 * or release builds (true and false respectively) [2]
 * [1] https://firefox-source-docs.mozilla.org/toolkit/components/telemetry/telemetry/internals/preferences.html
 * [2] https://medium.com/georg-fritzsche/data-preference-changes-in-firefox-58-2d5df9c428b5 ***/
 user_pref("toolkit.telemetry.unified", false);
 user_pref("toolkit.telemetry.enabled", false); // see [NOTE]
 user_pref("toolkit.telemetry.server", "data:,");
 user_pref("toolkit.telemetry.archive.enabled", false);
 user_pref("toolkit.telemetry.newProfilePing.enabled", false); // [FF55+]
 user_pref("toolkit.telemetry.shutdownPingSender.enabled", false); // [FF55+]
 user_pref("toolkit.telemetry.updatePing.enabled", false); // [FF56+]
 user_pref("toolkit.telemetry.bhrPing.enabled", false); // [FF57+] Background Hang Reporter
 user_pref("toolkit.telemetry.firstShutdownPing.enabled", false); // [FF57+]
 /* 0331: disable Telemetry Coverage
  * [1] https://blog.mozilla.org/data/2018/08/20/effectively-measuring-search-in-firefox/ ***/
 user_pref("toolkit.telemetry.coverage.opt-out", true); // [HIDDEN PREF]
 user_pref("toolkit.coverage.opt-out", true); // [FF64+] [HIDDEN PREF]
 user_pref("toolkit.coverage.endpoint.base", "");
 /* 0340: disable Health Reports
  * [SETTING] Privacy & Security>Firefox Data Collection & Use>Allow Firefox to send technical... data ***/
 user_pref("datareporting.healthreport.uploadEnabled", false);
 /* 0341: disable new data submission, master kill switch [FF41+]
  * If disabled, no policy is shown or upload takes place, ever
  * [1] https://bugzilla.mozilla.org/1195552 ***/
 user_pref("datareporting.policy.dataSubmissionEnabled", false);
 /* 0342: disable Studies (see 0503)
  * [SETTING] Privacy & Security>Firefox Data Collection & Use>Allow Firefox to install and run studies ***/
 user_pref("app.shield.optoutstudies.enabled", false);
 /* 0343: disable personalized Extension Recommendations in about:addons and AMO [FF65+]
  * [NOTE] This pref has no effect when Health Reports (0340) are disabled
  * [SETTING] Privacy & Security>Firefox Data Collection & Use>Allow Firefox to make personalized extension recommendations
  * [1] https://support.mozilla.org/kb/personalized-extension-recommendations ***/
 user_pref("browser.discovery.enabled", false);
 /* 0350: disable Crash Reports ***/
 user_pref("breakpad.reportURL", "");
 user_pref("browser.tabs.crashReporting.sendReport", false); // [FF44+]
    // user_pref("browser.crashReports.unsubmittedCheck.enabled", false); // [FF51+] [DEFAULT: false]
 /* 0351: enforce no submission of backlogged Crash Reports [FF58+]
  * [SETTING] Privacy & Security>Firefox Data Collection & Use>Allow Firefox to send backlogged crash reports  ***/
 user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false); // [DEFAULT: false]
 /* 0390: disable Captive Portal detection
  * [1] https://www.eff.org/deeplinks/2017/08/how-captive-portals-interfere-wireless-security-and-privacy
  * [2] https://wiki.mozilla.org/Necko/CaptivePortal ***/
 user_pref("captivedetect.canonicalURL", "");
 user_pref("network.captive-portal-service.enabled", false); // [FF52+]
 /* 0391: disable Network Connectivity checks [FF65+]
  * [1] https://bugzilla.mozilla.org/1460537 ***/
 user_pref("network.connectivity-service.enabled", false);

/* 0503: disable Normandy/Shield [FF60+]
 * Shield is an telemetry system (including Heartbeat) that can also push and test "recipes"
 * [1] https://wiki.mozilla.org/Firefox/Shield
 * [2] https://github.com/mozilla/normandy ***/
 user_pref("app.normandy.enabled", false);
 user_pref("app.normandy.api_url", "");

/* 0506: disable PingCentre telemetry (used in several System Add-ons) [FF57+]
 * Currently blocked by 'datareporting.healthreport.uploadEnabled' (see 0340) ***/
user_pref("browser.ping-centre.telemetry", false);

/*** [SECTION 0600]: BLOCK IMPLICIT OUTBOUND [not explicitly asked for - e.g. clicked on] ***/
user_pref("_user.js.parrot", "0600 syntax error: the parrot's no more!");
/* 0601: disable link prefetching
 * [1] https://developer.mozilla.org/docs/Web/HTTP/Link_prefetching_FAQ ***/
user_pref("network.prefetch-next", false);
/* 0602: disable DNS prefetching
 * [1] https://developer.mozilla.org/docs/Web/HTTP/Headers/X-DNS-Prefetch-Control ***/
user_pref("network.dns.disablePrefetch", true);
   // user_pref("network.dns.disablePrefetchFromHTTPS", true); // [DEFAULT: true]
/* 0603: disable predictor / prefetching ***/
user_pref("network.predictor.enabled", false);
   // user_pref("network.predictor.enable-prefetch", false); // [FF48+] [DEFAULT: false]
/* 0605: disable link-mouseover opening connection to linked server
 * [1] https://news.slashdot.org/story/15/08/14/2321202/how-to-quash-firefoxs-silent-requests ***/
user_pref("network.http.speculative-parallel-limit", 0);
/* 0606: enforce no "Hyperlink Auditing" (click tracking)
 * [1] https://www.bleepingcomputer.com/news/software/major-browsers-to-prevent-disabling-of-click-tracking-privacy-risk/ ***/
user_pref("browser.send_pings", false); // [DEFAULT: false]

/*** [SECTION 0900]: PASSWORDS ***/
/* 0902: use a primary password
 * There are no preferences for this. It is all handled internally.
 * [SETTING] Privacy & Security>Logins and Passwords>Use a Primary Password
 * [1] https://support.mozilla.org/kb/use-primary-password-protect-stored-logins-and-pas ***/
/* 0903: set how often Firefox should ask for the primary password
 * 0=the first time (default), 1=every time it's needed, 2=every n minutes (see 0904) ***/
user_pref("security.ask_for_password", 2);
/* 0904: set how often in minutes Firefox should ask for the primary password (see 0903)
 * in minutes, default is 30 ***/
user_pref("security.password_lifetime", 30);

/* 0912: limit (or disable) HTTP authentication credentials dialogs triggered by sub-resources [FF41+]
 * hardens against potential credentials phishing
 * 0=don't allow sub-resources to open HTTP authentication credentials dialogs
 * 1=don't allow cross-origin sub-resources to open HTTP authentication credentials dialogs
 * 2=allow sub-resources to open HTTP authentication credentials dialogs (default) ***/
user_pref("network.auth.subresource-http-auth-allow", 1);

/*** [SECTION 1000]: CACHE / SESSION (RE)STORE / FAVICONS
     Cache tracking/fingerprinting techniques [1][2][3] require a cache. Disabling disk (1001)
     *and* memory (1003) caches is one solution; but that's extreme and fingerprintable. A hardened
     Temporary Containers configuration can effectively do the same thing, by isolating every tab [4].
     We consider avoiding disk cache (1001) so cache is session/memory only (like Private Browsing
     mode), and isolating cache to first party (4001) is sufficient and a good balance between
     risk and performance. ETAGs can also be neutralized by modifying response headers [5], and
     you can clear the cache manually or on a regular basis with an extension.
     [1] https://en.wikipedia.org/wiki/HTTP_ETag#Tracking_using_ETags
     [2] https://robertheaton.com/2014/01/20/cookieless-user-tracking-for-douchebags/
     [3] https://www.grepular.com/Preventing_Web_Tracking_via_the_Browser_Cache
     [4] https://medium.com/@stoically/enhance-your-privacy-in-firefox-with-temporary-containers-33925cd6cd21
     [5] https://github.com/arkenfox/user.js/wiki/4.2.4-Header-Editor
***/
/** CACHE ***/
/* 1001: disable disk cache
 * [SETUP-PERF] If you think disk cache may help (heavy tab user, high-res video),
 * or you use a hardened Temporary Containers, then feel free to override this
 * [NOTE] We also clear cache on exiting Firefox (see 2803) ***/
user_pref("browser.cache.disk.enable", false);

/*** [SECTION 1200]: HTTPS (SSL/TLS / OCSP / CERTS / HPKP / CIPHERS)
   Your cipher and other settings can be used in server side fingerprinting
   [TEST] https://www.ssllabs.com/ssltest/viewMyClient.html
   [TEST] https://browserleaks.com/ssl
   [TEST] https://ja3er.com/
   [1] https://www.securityartwork.es/2017/02/02/tls-client-fingerprinting-with-bro/
***/
/** SSL (Secure Sockets Layer) / TLS (Transport Layer Security) ***/
/* 1201: require safe negotiation
 * Blocks connections (SSL_ERROR_UNSAFE_NEGOTIATION) to servers that don't support RFC 5746 [2]
 * as they're potentially vulnerable to a MiTM attack [3]. A server without RFC 5746 can be
 * safe from the attack if it disables renegotiations but the problem is that the browser can't
 * know that. Setting this pref to true is the only way for the browser to ensure there will be
 * no unsafe renegotiations on the channel between the browser and the server.
 * [STATS] SSL Labs (Dec 2020) reports 99.0% of sites have secure renegotiation [4]
 * [1] https://wiki.mozilla.org/Security:Renegotiation
 * [2] https://tools.ietf.org/html/rfc5746
 * [3] https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-3555
 * [4] https://www.ssllabs.com/ssl-pulse/ ***/
user_pref("security.ssl.require_safe_negotiation", true);
/* 1202: control TLS versions with min and max
 * 1=TLS 1.0, 2=TLS 1.1, 3=TLS 1.2, 4=TLS 1.3
 * [WARNING] Leave these at default, otherwise you alter your TLS fingerprint.
 * [1] https://www.ssllabs.com/ssl-pulse/ ***/
   // user_pref("security.tls.version.min", 3); // [DEFAULT: 3]
   // user_pref("security.tls.version.max", 4);
/* 1203: enforce TLS 1.0 and 1.1 downgrades as session only ***/
user_pref("security.tls.version.enable-deprecated", false);


/* 1610: ALL: enable the DNT (Do Not Track) HTTP header
 * [NOTE] DNT is enforced with Enhanced Tracking Protection regardless of this pref
 * [SETTING] Privacy & Security>Enhanced Tracking Protection>Send websites a "Do Not Track" signal... ***/
user_pref("privacy.donottrackheader.enabled", true);

/*** [SECTION 2600]: MISCELLANEOUS ***/
/* 2601: prevent accessibility services from accessing your browser [RESTART]
 * [SETTING] Privacy & Security>Permissions>Prevent accessibility services from accessing your browser (FF80 or lower)
 * [1] https://support.mozilla.org/kb/accessibility-services ***/
user_pref("accessibility.force_disabled", 1);
/* 2602: disable sending additional analytics to web servers
 * [1] https://developer.mozilla.org/docs/Web/API/Navigator/sendBeacon ***/
user_pref("beacon.enabled", false);


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true); // default is false
user_pref("svg.context-properties.content.enabled", true);

/* 0803: display all parts of the url in the location bar ***/
user_pref("browser.urlbar.trimURLs", false);

// Preserve SSD
user_pref("browser.cache.disk.enable", false);

user_pref("extensions.pocket.enabled", false);

// Security
user_pref("network.IDN_show_punycode", true);

user_pref("security.certerrors.recordEventTelemetry", false);
user_pref("security.disable_button.openCertManager", false);
user_pref("security.identitypopup.recordEventElemetry", false);

user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("media.ffvpx.enabled", false);
user_pref("media.rdd-vpx.enabled", false);
user_pref("media.navigator.mediadatadecoder_vpx_enabled", true);


user_pref("widget.use-xdg-desktop-portal", true);

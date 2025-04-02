'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "ace1686dcd145c0bfd2b4e155d538337",
"/": "ace1686dcd145c0bfd2b4e155d538337",
"main.dart.js": "c48864085387a0ef5a19e4577b0af27e",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "9dd988f2a1c96766e6236be2601bed71",
"icons/Icon-192.png": "78bd3464ff8041410327eb54ebed0aa4",
"icons/Icon-maskable-192.png": "78bd3464ff8041410327eb54ebed0aa4",
"icons/Icon-maskable-512.png": "58a45704939fe0cfa02849f05d195b6d",
"icons/Icon-512.png": "58a45704939fe0cfa02849f05d195b6d",
"manifest.json": "6c2921dd496bac31a6f652f8ced600e9",
"assets/images/ngbuka.jpg": "25284ff9bf1f14927195fa39cb9aae35",
"assets/images/weather_app.png": "86851d68872a0c3700c4831ecf580757",
"assets/images/flutter_logo.png": "2bbed818bfdf1d81ecb6d0887fdec9c8",
"assets/images/clinic.jpg": "89c3caacfcfdea319c781dc0ac2d745a",
"assets/images/python.png": "d3c746b2baa87534de255e2da8d49620",
"assets/images/dj.png": "b0dae6377ba06571698026012043f122",
"assets/images/github.png": "bb04d77a846e6beca811c4be1d8e3442",
"assets/images/background.jpg": "0d1fe57f982b5a1c9871b59ea435d8b0",
"assets/images/profile_photo.jpeg": "f7c3ca07c3a08ef4cfc7249a31582106",
"assets/images/dark_background.png": "c067c5651f4e23568a70eb7f3a67b369",
"assets/images/gonana.jpg": "02678a4afc9fb5ea0fe5604a80123f87",
"assets/images/country_app.png": "de90f4e16d43d1547c1c12b5c64adbe4",
"assets/images/dart_logo.png": "9271c5feaa7176d4bc87467c11eaa8c0",
"assets/images/firebase_logo.png": "a60e9d9d151631f8f138516bf18963b9",
"assets/images/wallpaper.jpeg": "e8d6c55b48f4abfb227ddb00f8ba67a7",
"assets/images/bloom.jpg": "04f99c71166efb6ea261923790c355ce",
"assets/images/countryapp_phone.png": "11737dadfd69ef3b9bae3a677a30c717",
"assets/images/webapp_phone.png": "dbe4af15a971c9a13918e510bb6745f0",
"assets/images/android_logo.png": "ce9618e09dbf797b72f0c99487ee69d1",
"assets/images/git_logo.png": "0cd31b3dad496c1bd9d003fbc2023d62",
"assets/images/java_logo.png": "d7d65f674992c4d04e8912fb2ecfe8e3",
"assets/AssetManifest.json": "092f9d0d57527622006ea7793483e811",
"assets/NOTICES": "fea548350fce6259263a79e17b4bbb3f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "fdfc4be6745d861c7d0ff33855439912",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "319968a58eb094badb30c1de2e1b6b74",
"assets/fonts/MaterialIcons-Regular.otf": "e6e8148cdd7e38cf76b9094e7fdaf955",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

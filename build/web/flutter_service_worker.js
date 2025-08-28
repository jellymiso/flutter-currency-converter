'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "ec76af7ae89dff90cf42f0721a14d789",
"assets/AssetManifest.bin.json": "e225496eb1a2f55c06149ccfb1c71580",
"assets/AssetManifest.json": "8766dbe8202e9063e8f042a1e2b9d27f",
"assets/assets/images/aed.png": "e475d05a6c56023c85a26a9198caa8a5",
"assets/assets/images/afn.png": "ae6b815b5b492d32a78608bfbbc55174",
"assets/assets/images/all.png": "eb87b6b837b63256015ff44ec252441c",
"assets/assets/images/amd.png": "2c13bd23505f48aa589ec3ef1c2923d6",
"assets/assets/images/ang.png": "0a54da68914954c7db05dd68eebcccc4",
"assets/assets/images/aoa.png": "777b67e029edfd1eb19895851fa5c010",
"assets/assets/images/ars.png": "81bfbe0c33169f289e2961ee2887f494",
"assets/assets/images/aud.png": "3c72f2411a9dc4692bd739074ff4b7ae",
"assets/assets/images/awg.png": "2178e20e911ef41881acbe035c48e106",
"assets/assets/images/azn.png": "f411e6e5daab8bf56b964d22a6ef8046",
"assets/assets/images/background.png": "9c27092cdc053c5e8349295e721bc495",
"assets/assets/images/bam.png": "eb139c70957ef18912852a266d9f241a",
"assets/assets/images/bbd.png": "f48d30d3fd81a43a3458eb77ff6496f7",
"assets/assets/images/bdt.png": "23121ad60408d25ed012a293407d4224",
"assets/assets/images/bgn.png": "0001140242ec0d2822fbeebc54c72682",
"assets/assets/images/bhd.png": "39e88b4ad8a488dbf3f5f36c7ba35e1d",
"assets/assets/images/bif.png": "fe0fd0a9d6c17c81c322a37a57a0445e",
"assets/assets/images/bmd.png": "1719c74b19f929aebdb0fb3dd571b18c",
"assets/assets/images/bnd.png": "c38e2422dac25fe9f3d6de6d4f8bdbfe",
"assets/assets/images/bob.png": "c9aa445e5effa6dd55c1e74c3f1ab8c1",
"assets/assets/images/brl.png": "4182ceb546854bba02fbb0f115f673d7",
"assets/assets/images/bsd.png": "af6482e42750b0131f5b6c8dbec8d236",
"assets/assets/images/btn.png": "1ee2087b245a729f4e3497bf0f460d13",
"assets/assets/images/bwp.png": "29b6b9679f24d94e366d4cf3489b942d",
"assets/assets/images/byn.png": "f6988656732339e859f4d9e178ed07c3",
"assets/assets/images/bzd.png": "30bc9bc1431b7cdfb7c6e2365f9b5b0b",
"assets/assets/images/cad.png": "54dbb46172735a0cf007dd75dbc4d1fc",
"assets/assets/images/cdf.png": "5ec60a6b6101ebda09a7c31398792fce",
"assets/assets/images/chf.png": "0833f91df22ba8b4c2d75a7ea0965bee",
"assets/assets/images/clp.png": "b8985f6dba9b9152b2f7d6046d14a65d",
"assets/assets/images/cny.png": "8990b1b7cab189e38913017d3887b918",
"assets/assets/images/cop.png": "63739faa504cda2d3bb47ecf222d8709",
"assets/assets/images/crc.png": "3ca73a747535c43c74b293b141730144",
"assets/assets/images/cup.png": "1911a84092f23354f0ca9ba6097faa50",
"assets/assets/images/cve.png": "a0190d2eead6ac9261da764850c817b2",
"assets/assets/images/czk.png": "9598c52a5d36c982b3779d550c22f721",
"assets/assets/images/djf.png": "36ced681c0690166f17b5e6a156c724b",
"assets/assets/images/dkk.png": "05b2a0d7b02193fc81e2b5aede573766",
"assets/assets/images/dop.png": "89545bbca794e484891d4774f23db215",
"assets/assets/images/dzd.png": "babc590cf377d66aecf0a3b679779aca",
"assets/assets/images/egp.png": "c6400b07883c9babf1c1c061af094f19",
"assets/assets/images/empty.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/ern.png": "d78281348b86cf10e8710237b2d21ad9",
"assets/assets/images/etb.png": "9d4f0e0f5dfeaf03b357a6d32b735135",
"assets/assets/images/eur.png": "8e76e4a274e105aaeca38a9e00f76821",
"assets/assets/images/fjd.png": "614492544f194b0dfea2583556b15b16",
"assets/assets/images/fkp.png": "b1916766b95b88aa47fb0540da2d549d",
"assets/assets/images/fok.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/gbp.png": "94ba221ad0dd13bbfccdce561967eefd",
"assets/assets/images/gel.png": "b67bba50bf68793c3551757518e2a900",
"assets/assets/images/ggp.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/ghs.png": "aa77eb04d7b99cbd3e595b58d869136c",
"assets/assets/images/gip.png": "d66c47aacce90d90ab64b29091e8e343",
"assets/assets/images/gmd.png": "6644816e82a6ca2a899dfb8436812d19",
"assets/assets/images/gnf.png": "af71a7861a1c8572b8baf4ec2ccc59ff",
"assets/assets/images/gtq.png": "199fa243641f22469619883d83104e5a",
"assets/assets/images/gyd.png": "5f518ca5e89c5e95cbab29f266d10d9a",
"assets/assets/images/hkd.png": "58cc04ee4d0c96be79c6da9e5d556e0c",
"assets/assets/images/hnl.png": "5624be5d0a1f4341e1ab0681c4465ebc",
"assets/assets/images/hrk.png": "a41e56ee0ef9c540bb86bc8a1cdfcf94",
"assets/assets/images/htg.png": "2748a8a8a301893541a591a9a37296d1",
"assets/assets/images/huf.png": "5678b092ee36cd2e0e3ffafb3be00e4a",
"assets/assets/images/idr.png": "185244077293ede93ce74cf996935f15",
"assets/assets/images/ils.png": "a4a1fd1d1a97d5de56a8c1f3189d934b",
"assets/assets/images/imp.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/inr.png": "3620415fe2092bda6beb1e70019754ee",
"assets/assets/images/iqd.png": "938070269022f505ddf234af5afbf8c8",
"assets/assets/images/irr.png": "3f7195a96a870a6447a43ed4ef28013d",
"assets/assets/images/isk.png": "4fd0925c3c525cd0c68909959e4f2336",
"assets/assets/images/jep.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/jmd.png": "449a65487a9868665f16f22b2e40843f",
"assets/assets/images/jod.png": "8c11706e814f72f5aa8d78a46e45e326",
"assets/assets/images/jpy.png": "e2393bdde2c379e21d71ffbe77cc2739",
"assets/assets/images/kes.png": "b02edbe1af39da9f1f903a0437770ddf",
"assets/assets/images/kgs.png": "5cbc11133651883753711b18b830c6d6",
"assets/assets/images/khr.png": "448e2bba767c6f9c4459daa6c7404be0",
"assets/assets/images/kid.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/kmf.png": "10b7bd4aaa15f87a7ade69fbe92e205c",
"assets/assets/images/kpw.png": "55eabb5736592d558124d9e0e4ea0a34",
"assets/assets/images/krw.png": "0a5bf0b3e38e0602e0f19d7ea88aebed",
"assets/assets/images/kwd.png": "f6d996ca55eb5712c39fdbb28780f2db",
"assets/assets/images/kyd.png": "7deb48c3fe67e6f48a3b8ff56a950898",
"assets/assets/images/kzt.png": "1435d67aee20f5fe7681d2e8ebc1b4ac",
"assets/assets/images/lak.png": "d66ce5365850b032a877b5b3640e3ca4",
"assets/assets/images/lbp.png": "b834d2b743c97830a7e250aede9348c0",
"assets/assets/images/lkr.png": "5e53f8276376d9e36b9b296b5bc00aac",
"assets/assets/images/lrd.png": "818b81f119d3640b1cab2a9eb27ff5c9",
"assets/assets/images/lsl.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/ltl.png": "04aa28690758bbde26d482d88cc6ac69",
"assets/assets/images/lyd.png": "521b501ecf0a97c203f1c6aefebfcdb9",
"assets/assets/images/mad.png": "462c7b54c55d870cda1e85264eb1537b",
"assets/assets/images/mdl.png": "66cff206d75349b0a0f928a30f62e84c",
"assets/assets/images/mga.png": "89e3f7008ecc6e26e2b41620380059ca",
"assets/assets/images/mkd.png": "5f768346feb947dd69e3a74deef44427",
"assets/assets/images/mmk.png": "384080428fdad9929b3431f775732f3f",
"assets/assets/images/mnt.png": "69d986e2728f325696f5082d4abd76c0",
"assets/assets/images/mop.png": "4c0a2c065df17829d8b69b376685c98c",
"assets/assets/images/mro.png": "955a7f689d3f5e3b78a8a9e7463a2b2a",
"assets/assets/images/mru.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/mur.png": "298a7080afea53037ffcb446de952777",
"assets/assets/images/mvr.png": "f64dbc0f6c60981f18e9713ca6fc0850",
"assets/assets/images/mwk.png": "8f58fcf3dac47473ebfa15dc5f166603",
"assets/assets/images/mxn.png": "176145b26406889da830530c176bf699",
"assets/assets/images/myr.png": "0dcfb698da318c77f9b9cec0d4a0e42f",
"assets/assets/images/mzn.png": "58d64453047aed90387c27fc2556aeab",
"assets/assets/images/nad.png": "bb9b9cbeee19ca7f2dbad538d710437d",
"assets/assets/images/ngn.png": "dc970692754f5496858485ae70912a42",
"assets/assets/images/nio.png": "5a2dbf26fc67d1dea287013a511cf2ca",
"assets/assets/images/nok.png": "946ba13bde513fb12ef3d124a8840ae6",
"assets/assets/images/npr.png": "9653542444ef38fa0724761ffa93f118",
"assets/assets/images/nzd.png": "239b695efb62ffe769116ea93a5fbc92",
"assets/assets/images/omr.png": "bc281c34e984cc2b9536b0dc9d31a1c4",
"assets/assets/images/pab.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/pen.png": "59be8d2cbc82317f6f480277bf4726b9",
"assets/assets/images/pgk.png": "aaa8c91f968e5af518dcdfc4292f61d5",
"assets/assets/images/php.png": "2024a10a2caf3f3fba15cd6f7f4a2b1d",
"assets/assets/images/pkr.png": "71929b19c5079c758e1fc773ed85d943",
"assets/assets/images/pln.png": "d08e37c33d228fa28d0f272c4c8c2241",
"assets/assets/images/pyg.png": "78fb2cad54148b8f7e04a94de964fac6",
"assets/assets/images/qar.png": "d4cf3196ae8a78541f2e4f1a85d15fac",
"assets/assets/images/ron.png": "0380edbaa5e12f65220aea8ef7149950",
"assets/assets/images/rsd.png": "b350d0cdb8cfb4ac14ba575c2e1c3c92",
"assets/assets/images/rub.png": "d57b11101e774faa71cc233ca28896f9",
"assets/assets/images/rwf.png": "85ce21c848460e04462867fb135ded23",
"assets/assets/images/sar.png": "04cbf44f66d34ff75b93b28e3ed46710",
"assets/assets/images/sbd.png": "afde7dcdc26e5dc50e8de98a09f1e3c2",
"assets/assets/images/scr.png": "32edb0db22747318eaeffed7849510d3",
"assets/assets/images/sdg.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/sek.png": "96fa7a05ebfa3a87f9617c04e0a3cf67",
"assets/assets/images/sgd.png": "47aa062314971029f5747de3a1f998f4",
"assets/assets/images/shp.png": "029cb09a133b857385920af3416b239d",
"assets/assets/images/sle.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/sll.png": "385863868146dafb5479885487830866",
"assets/assets/images/sos.png": "744753be8aa8910e4517983ea644cdc7",
"assets/assets/images/srd.png": "1b9e03ee492ccb769ee71d4e6edc5a99",
"assets/assets/images/ssp.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/std.png": "e3083d2e06e45371373666b5ba9cfd3f",
"assets/assets/images/stn.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/svc.png": "4c8632ce334d809cb5a4125057eddc77",
"assets/assets/images/syp.png": "d9fb39c761ed96b0ae04bf0ff7c5f985",
"assets/assets/images/szl.png": "7ebadb6835bac7ec86ce48df5fdea522",
"assets/assets/images/thb.png": "bcc0681264d446e126a6a7d4798a7e7f",
"assets/assets/images/tjs.png": "5f4457ab2c9467b185eb20933ef43686",
"assets/assets/images/tmt.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/tnd.png": "28d61fadfbdb5437f85e8580d3834463",
"assets/assets/images/top.png": "3b7f151a254cdc52c0e7f078adbcfd3c",
"assets/assets/images/try.png": "bf08688974fe40c6467c5a8ce5164456",
"assets/assets/images/ttd.png": "3a48fd40ce537e2e77d1dd13853808fc",
"assets/assets/images/tvd.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/twd.png": "cb5914ad016174f6937237efc4716923",
"assets/assets/images/tzs.png": "ac9002a8f2c1103411b03e5c738913f0",
"assets/assets/images/uah.png": "75e2f7599e5e007055db3bd240ed30f6",
"assets/assets/images/ugx.png": "56561c7043eb2328bc3b1ded6a165205",
"assets/assets/images/usd.png": "411902f97f55701c425aeb0b1df78fed",
"assets/assets/images/uyu.png": "a9049c6669050e88883833f08fa5f794",
"assets/assets/images/uzs.png": "a1ae0b63b04725626d34ee1d4120df2c",
"assets/assets/images/vef.png": "9f648a95833b2fc4a39483921847e223",
"assets/assets/images/ves.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/vnd.png": "fbcfe7c42d7b1efc4810c9e15abea946",
"assets/assets/images/vuv.png": "9475d5b4ecbc612ac3b9acdfeadd8f98",
"assets/assets/images/wst.png": "3ddf67ea5ea995ea20ef8639f82098f0",
"assets/assets/images/xaf.png": "0f7fc942414a20e1564a69097aaf275b",
"assets/assets/images/xcd.png": "b07d90ad8a721604fc954d965ffc1446",
"assets/assets/images/xdr.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/assets/images/xof.png": "30291532ec545093cb12a29034691183",
"assets/assets/images/xpf.png": "526e6a7efd24c28a2f9bf9311c0c8bb6",
"assets/assets/images/yer.png": "9f4076d6ee1cf574d093234a50e1a5e3",
"assets/assets/images/zar.png": "9cb6f2e253a8ef335b7477030c371112",
"assets/assets/images/zmw.png": "6323c4bcb507bce39291229641ccf3c8",
"assets/assets/images/zwl.png": "db60ce2ffe98c26483e046dbe09f74ec",
"assets/FontManifest.json": "a9bda260819c257333e899a426d7018c",
"assets/fonts/MaterialIcons-Regular.otf": "1b994b059d3efb153fdeed5fc9ec2fd1",
"assets/fonts/Montserrat/Montserrat-Black.ttf": "cce7ff8c1d7999f907b6760fbe75d99d",
"assets/fonts/Montserrat/Montserrat-BlackItalic.ttf": "a67f4df02f4d73bb8bfd5bff421e4d1f",
"assets/fonts/Montserrat/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/fonts/Montserrat/Montserrat-BoldItalic.ttf": "a49032b6a945b021303f16b664f87e6c",
"assets/fonts/Montserrat/Montserrat-ExtraBold.ttf": "9e07cac927a9b4d955e2138bf6136d6a",
"assets/fonts/Montserrat/Montserrat-ExtraBoldItalic.ttf": "8a4a6844448e210672d54f8b32932ee9",
"assets/fonts/Montserrat/Montserrat-ExtraLight.ttf": "a7fe50578d9aa3966c925cb9722db03a",
"assets/fonts/Montserrat/Montserrat-ExtraLightItalic.ttf": "9c3e2f21cc8fba26dc3da67e89a9365d",
"assets/fonts/Montserrat/Montserrat-Italic.ttf": "cc53ad8bb1c801746c831bb7ce493f74",
"assets/fonts/Montserrat/Montserrat-Light.ttf": "94fbe93542f684134cad1d775947ca92",
"assets/fonts/Montserrat/Montserrat-LightItalic.ttf": "c54486c33610a1fca147afc18af3034f",
"assets/fonts/Montserrat/Montserrat-Medium.ttf": "bdb7ba651b7bdcda6ce527b3b6705334",
"assets/fonts/Montserrat/Montserrat-MediumItalic.ttf": "2ed625fc9f039d801a5aab9b6f9cd8ef",
"assets/fonts/Montserrat/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/fonts/Montserrat/Montserrat-SemiBold.ttf": "cc10461cb5e0a6f2621c7179f4d6de17",
"assets/fonts/Montserrat/Montserrat-SemiBoldItalic.ttf": "75c4176c64611f32faf01a5de7631877",
"assets/fonts/Montserrat/Montserrat-Thin.ttf": "b3638b16904211d1d24d04ce53810c4d",
"assets/fonts/Montserrat/Montserrat-ThinItalic.ttf": "ff9c45e92d16324b8964447d12d1f458",
"assets/fonts/Overpass/Overpass-Black.ttf": "a8bc253eb6f8e7b56d44198f3cad5eeb",
"assets/fonts/Overpass/Overpass-BlackItalic.ttf": "2854007c558d5fbddb3b277179d109d7",
"assets/fonts/Overpass/Overpass-Bold.ttf": "b0898efd5a06e39da269d0ad50aea8c5",
"assets/fonts/Overpass/Overpass-BoldItalic.ttf": "e625f7ad10c5415b1f703e41fb56efa6",
"assets/fonts/Overpass/Overpass-ExtraBold.ttf": "86486c5e031be81793a8b4e2b7cb867d",
"assets/fonts/Overpass/Overpass-ExtraBoldItalic.ttf": "08d66424bc35e637379dbb7c2e751279",
"assets/fonts/Overpass/Overpass-ExtraLight.ttf": "17cb35c2c7dac5c877c3fdc0c1a2ae40",
"assets/fonts/Overpass/Overpass-ExtraLightItalic.ttf": "fdb7c2a4893b78e333ab77adfc684776",
"assets/fonts/Overpass/Overpass-Italic.ttf": "0339a3c13ca7619ef4c95528123dc027",
"assets/fonts/Overpass/Overpass-Light.ttf": "21db88b4b8108780d69ccf30da4f9f84",
"assets/fonts/Overpass/Overpass-LightItalic.ttf": "4aca4aa142cfcaf436664ad6662f3de9",
"assets/fonts/Overpass/Overpass-Medium.ttf": "57a9b3c5345fdfd7442afe52c9b1af4b",
"assets/fonts/Overpass/Overpass-MediumItalic.ttf": "64211bc22d9638e2640b7f2bfb49b248",
"assets/fonts/Overpass/Overpass-Regular.ttf": "b5d14a34728f6db88302b4fa04b01ef2",
"assets/fonts/Overpass/Overpass-SemiBold.ttf": "9541367e2edc7ae665d0bbe0326886d2",
"assets/fonts/Overpass/Overpass-SemiBoldItalic.ttf": "acef67f73d4993550609a7a574b8b387",
"assets/fonts/Overpass/Overpass-Thin.ttf": "20082c11fa44b5cdcc4bb64665772692",
"assets/fonts/Overpass/Overpass-ThinItalic.ttf": "2ba335a96cc5ed55cc7833448f9dcaa1",
"assets/NOTICES": "112f6f279b831fcff0594a0c7a5c13c3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "a03b7d8bef1c979d6f261a09bef0c297",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "142d8c8163b280e27cf964b7176cdaff",
"/": "142d8c8163b280e27cf964b7176cdaff",
"main.dart.js": "ab94377f9f7385a6ea1df78067f31962",
"manifest.json": "d36217755568be221e16c9608e3cb175",
"version.json": "70830b2cfd321eac8d5063eacb942a50"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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

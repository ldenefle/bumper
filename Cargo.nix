# This file was @generated by cargo2nix 0.11.0.
# It is not intended to be manually edited.

args@{
  release ? true,
  rootFeatures ? [
    "bumper/default"
  ],
  rustPackages,
  buildRustPackages,
  hostPlatform,
  hostPlatformCpu ? null,
  hostPlatformFeatures ? [],
  target ? null,
  codegenOpts ? null,
  profileOpts ? null,
  rustcLinkFlags ? null,
  rustcBuildFlags ? null,
  mkRustCrate,
  rustLib,
  lib,
  workspaceSrc,
}:
let
  workspaceSrc = if args.workspaceSrc == null then ./. else args.workspaceSrc;
in let
  inherit (rustLib) fetchCratesIo fetchCrateLocal fetchCrateGit fetchCrateAlternativeRegistry expandFeatures decideProfile genDrvsByProfile;
  profilesByName = {
  };
  rootFeatures' = expandFeatures rootFeatures;
  overridableMkRustCrate = f:
    let
      drvs = genDrvsByProfile profilesByName ({ profile, profileName }: mkRustCrate ({ inherit release profile hostPlatformCpu hostPlatformFeatures target profileOpts codegenOpts rustcLinkFlags rustcBuildFlags; } // (f profileName)));
    in { compileMode ? null, profileName ? decideProfile compileMode release }:
      let drv = drvs.${profileName}; in if compileMode == null then drv else drv.override { inherit compileMode; };
in
{
  cargo2nixVersion = "0.11.0";
  workspace = {
    bumper = rustPackages.unknown.bumper."0.1.0";
  };
  "registry+https://github.com/rust-lang/crates.io-index".aho-corasick."0.7.18" = overridableMkRustCrate (profileName: rec {
    name = "aho-corasick";
    version = "0.7.18";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
    dependencies = {
      memchr = rustPackages."registry+https://github.com/rust-lang/crates.io-index".memchr."2.5.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".atty."0.2.13" = overridableMkRustCrate (profileName: rec {
    name = "atty";
    version = "0.2.13";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1803c647a3ec87095e7ae7acfca019e98de5ec9a7d01343f611cf3152ed71a90"; };
    dependencies = {
      ${ if hostPlatform.isUnix then "libc" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.62" { inherit profileName; };
      ${ if hostPlatform.isWindows then "winapi" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.8" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".autocfg."0.1.6" = overridableMkRustCrate (profileName: rec {
    name = "autocfg";
    version = "0.1.6";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b671c8fb71b457dd4ae18c4ba1e59aa81793daacc361d82fcd410cef0d491875"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".bitflags."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "bitflags";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3d155346769a6855b86399e9bc3814ab343cd3d62c7e985113d46a0ec3c281fd"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
  });
  
  "unknown".bumper."0.1.0" = overridableMkRustCrate (profileName: rec {
    name = "bumper";
    version = "0.1.0";
    registry = "unknown";
    src = fetchCrateLocal workspaceSrc;
    dependencies = {
      env_logger = rustPackages."registry+https://github.com/rust-lang/crates.io-index".env_logger."0.6.2" { inherit profileName; };
      git2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".git2."0.16.1" { inherit profileName; };
      log = rustPackages."registry+https://github.com/rust-lang/crates.io-index".log."0.4.8" { inherit profileName; };
      regex = rustPackages."registry+https://github.com/rust-lang/crates.io-index".regex."1.5.5" { inherit profileName; };
      semver = rustPackages."registry+https://github.com/rust-lang/crates.io-index".semver."0.9.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".cc."1.0.78" = overridableMkRustCrate (profileName: rec {
    name = "cc";
    version = "1.0.78";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "a20104e2335ce8a659d6dd92a51a767a0c062599c73b343fd152cb401e828c3d"; };
    features = builtins.concatLists [
      [ "jobserver" ]
      [ "parallel" ]
    ];
    dependencies = {
      jobserver = rustPackages."registry+https://github.com/rust-lang/crates.io-index".jobserver."0.1.25" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".cfg-if."0.1.9" = overridableMkRustCrate (profileName: rec {
    name = "cfg-if";
    version = "0.1.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b486ce3ccf7ffd79fdeb678eac06a9e6c09fc88d33836340becb8fffe87c5e33"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".env_logger."0.6.2" = overridableMkRustCrate (profileName: rec {
    name = "env_logger";
    version = "0.6.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "aafcde04e90a5226a6443b7aabdb016ba2f8307c847d524724bd9b346dd1a2d3"; };
    features = builtins.concatLists [
      [ "atty" ]
      [ "default" ]
      [ "humantime" ]
      [ "regex" ]
      [ "termcolor" ]
    ];
    dependencies = {
      atty = rustPackages."registry+https://github.com/rust-lang/crates.io-index".atty."0.2.13" { inherit profileName; };
      humantime = rustPackages."registry+https://github.com/rust-lang/crates.io-index".humantime."1.3.0" { inherit profileName; };
      log = rustPackages."registry+https://github.com/rust-lang/crates.io-index".log."0.4.8" { inherit profileName; };
      regex = rustPackages."registry+https://github.com/rust-lang/crates.io-index".regex."1.5.5" { inherit profileName; };
      termcolor = rustPackages."registry+https://github.com/rust-lang/crates.io-index".termcolor."1.0.5" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".git2."0.16.1" = overridableMkRustCrate (profileName: rec {
    name = "git2";
    version = "0.16.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ccf7f68c2995f392c49fffb4f95ae2c873297830eb25c6bc4c114ce8f4562acc"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "https" ]
      [ "openssl-probe" ]
      [ "openssl-sys" ]
      [ "ssh" ]
      [ "ssh_key_from_memory" ]
    ];
    dependencies = {
      bitflags = rustPackages."registry+https://github.com/rust-lang/crates.io-index".bitflags."1.1.0" { inherit profileName; };
      libc = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.62" { inherit profileName; };
      libgit2_sys = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libgit2-sys."0.14.2+1.5.1" { inherit profileName; };
      log = rustPackages."registry+https://github.com/rust-lang/crates.io-index".log."0.4.8" { inherit profileName; };
      ${ if hostPlatform.isUnix && !(hostPlatform.parsed.kernel.name == "darwin") then "openssl_probe" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".openssl-probe."0.1.2" { inherit profileName; };
      ${ if hostPlatform.isUnix && !(hostPlatform.parsed.kernel.name == "darwin") then "openssl_sys" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".openssl-sys."0.9.49" { inherit profileName; };
      url = rustPackages."registry+https://github.com/rust-lang/crates.io-index".url."2.1.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".humantime."1.3.0" = overridableMkRustCrate (profileName: rec {
    name = "humantime";
    version = "1.3.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "df004cfca50ef23c36850aaaa59ad52cc70d0e90243c3c7737a4dd32dc7a3c4f"; };
    dependencies = {
      quick_error = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quick-error."1.2.2" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".idna."0.2.0" = overridableMkRustCrate (profileName: rec {
    name = "idna";
    version = "0.2.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "02e2673c30ee86b5b96a9cb52ad15718aa1f966f5ab9ad54a8b95d5ca33120a9"; };
    dependencies = {
      matches = rustPackages."registry+https://github.com/rust-lang/crates.io-index".matches."0.1.8" { inherit profileName; };
      unicode_bidi = rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-bidi."0.3.4" { inherit profileName; };
      unicode_normalization = rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-normalization."0.1.8" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".jobserver."0.1.25" = overridableMkRustCrate (profileName: rec {
    name = "jobserver";
    version = "0.1.25";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "068b1ee6743e4d11fb9c6a1e6064b3693a1b600e7f5f5988047d98b3dc9fb90b"; };
    dependencies = {
      ${ if hostPlatform.isUnix then "libc" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.62" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".libc."0.2.62" = overridableMkRustCrate (profileName: rec {
    name = "libc";
    version = "0.2.62";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "34fcd2c08d2f832f376f4173a231990fa5aef4e99fb569867318a227ef4c06ba"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".libgit2-sys."0.14.2+1.5.1" = overridableMkRustCrate (profileName: rec {
    name = "libgit2-sys";
    version = "0.14.2+1.5.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "7f3d95f6b51075fe9810a7ae22c7095f12b98005ab364d8544797a825ce946a4"; };
    features = builtins.concatLists [
      [ "https" ]
      [ "libssh2-sys" ]
      [ "openssl-sys" ]
      [ "ssh" ]
      [ "ssh_key_from_memory" ]
    ];
    dependencies = {
      libc = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.62" { inherit profileName; };
      libssh2_sys = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libssh2-sys."0.2.23" { inherit profileName; };
      libz_sys = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libz-sys."1.1.8" { inherit profileName; };
      ${ if hostPlatform.isUnix then "openssl_sys" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".openssl-sys."0.9.49" { inherit profileName; };
    };
    buildDependencies = {
      cc = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".cc."1.0.78" { profileName = "__noProfile"; };
      pkg_config = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".pkg-config."0.3.15" { profileName = "__noProfile"; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".libssh2-sys."0.2.23" = overridableMkRustCrate (profileName: rec {
    name = "libssh2-sys";
    version = "0.2.23";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b094a36eb4b8b8c8a7b4b8ae43b2944502be3e59cd87687595cf6b0a71b3f4ca"; };
    dependencies = {
      libc = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.62" { inherit profileName; };
      libz_sys = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libz-sys."1.1.8" { inherit profileName; };
      ${ if hostPlatform.isUnix then "openssl_sys" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".openssl-sys."0.9.49" { inherit profileName; };
    };
    buildDependencies = {
      cc = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".cc."1.0.78" { profileName = "__noProfile"; };
      pkg_config = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".pkg-config."0.3.15" { profileName = "__noProfile"; };
      ${ if hostPlatform.parsed.abi.name == "msvc" then "vcpkg" else null } = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".vcpkg."0.2.7" { profileName = "__noProfile"; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".libz-sys."1.1.8" = overridableMkRustCrate (profileName: rec {
    name = "libz-sys";
    version = "1.1.8";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "9702761c3935f8cc2f101793272e202c72b99da8f4224a19ddcf1279a6450bbf"; };
    features = builtins.concatLists [
      [ "libc" ]
    ];
    dependencies = {
      libc = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.62" { inherit profileName; };
    };
    buildDependencies = {
      cc = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".cc."1.0.78" { profileName = "__noProfile"; };
      pkg_config = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".pkg-config."0.3.15" { profileName = "__noProfile"; };
      ${ if hostPlatform.parsed.abi.name == "msvc" then "vcpkg" else null } = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".vcpkg."0.2.7" { profileName = "__noProfile"; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".log."0.4.8" = overridableMkRustCrate (profileName: rec {
    name = "log";
    version = "0.4.8";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "14b6052be84e6b71ab17edffc2eeabf5c2c3ae1fdb464aae35ac50c67a44e1f7"; };
    features = builtins.concatLists [
      [ "std" ]
    ];
    dependencies = {
      cfg_if = rustPackages."registry+https://github.com/rust-lang/crates.io-index".cfg-if."0.1.9" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".matches."0.1.8" = overridableMkRustCrate (profileName: rec {
    name = "matches";
    version = "0.1.8";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "7ffc5c5338469d4d3ea17d269fa8ea3512ad247247c30bd2df69e68309ed0a08"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".maybe-uninit."2.0.0" = overridableMkRustCrate (profileName: rec {
    name = "maybe-uninit";
    version = "2.0.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "60302e4db3a61da70c0cb7991976248362f30319e88850c487b9b95bbf059e00"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".memchr."2.5.0" = overridableMkRustCrate (profileName: rec {
    name = "memchr";
    version = "2.5.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".openssl-probe."0.1.2" = overridableMkRustCrate (profileName: rec {
    name = "openssl-probe";
    version = "0.1.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "77af24da69f9d9341038eba93a073b1fdaaa1b788221b00a69bce9e762cb32de"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".openssl-sys."0.9.49" = overridableMkRustCrate (profileName: rec {
    name = "openssl-sys";
    version = "0.9.49";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "f4fad9e54bd23bd4cbbe48fdc08a1b8091707ac869ef8508edea2fec77dcc884"; };
    dependencies = {
      libc = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.62" { inherit profileName; };
    };
    buildDependencies = {
      autocfg = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".autocfg."0.1.6" { profileName = "__noProfile"; };
      cc = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".cc."1.0.78" { profileName = "__noProfile"; };
      pkg_config = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".pkg-config."0.3.15" { profileName = "__noProfile"; };
      ${ if hostPlatform.parsed.abi.name == "msvc" then "vcpkg" else null } = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".vcpkg."0.2.7" { profileName = "__noProfile"; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".percent-encoding."2.1.0" = overridableMkRustCrate (profileName: rec {
    name = "percent-encoding";
    version = "2.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d4fd5641d01c8f18a23da7b6fe29298ff4b55afcccdf78973b24cf3175fee32e"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".pkg-config."0.3.15" = overridableMkRustCrate (profileName: rec {
    name = "pkg-config";
    version = "0.3.15";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "a7c1d2cfa5a714db3b5f24f0915e74fcdf91d09d496ba61329705dda7774d2af"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".quick-error."1.2.2" = overridableMkRustCrate (profileName: rec {
    name = "quick-error";
    version = "1.2.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "9274b940887ce9addde99c4eee6b5c44cc494b182b97e73dc8ffdcb3397fd3f0"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".regex."1.5.5" = overridableMkRustCrate (profileName: rec {
    name = "regex";
    version = "1.5.5";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1a11647b6b25ff05a515cb92c365cec08801e83423a235b51e231e1808747286"; };
    features = builtins.concatLists [
      [ "aho-corasick" ]
      [ "default" ]
      [ "memchr" ]
      [ "perf" ]
      [ "perf-cache" ]
      [ "perf-dfa" ]
      [ "perf-inline" ]
      [ "perf-literal" ]
      [ "std" ]
      [ "unicode" ]
      [ "unicode-age" ]
      [ "unicode-bool" ]
      [ "unicode-case" ]
      [ "unicode-gencat" ]
      [ "unicode-perl" ]
      [ "unicode-script" ]
      [ "unicode-segment" ]
    ];
    dependencies = {
      aho_corasick = rustPackages."registry+https://github.com/rust-lang/crates.io-index".aho-corasick."0.7.18" { inherit profileName; };
      memchr = rustPackages."registry+https://github.com/rust-lang/crates.io-index".memchr."2.5.0" { inherit profileName; };
      regex_syntax = rustPackages."registry+https://github.com/rust-lang/crates.io-index".regex-syntax."0.6.26" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".regex-syntax."0.6.26" = overridableMkRustCrate (profileName: rec {
    name = "regex-syntax";
    version = "0.6.26";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "49b3de9ec5dc0a3417da371aab17d729997c15010e7fd24ff707773a33bddb64"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "unicode" ]
      [ "unicode-age" ]
      [ "unicode-bool" ]
      [ "unicode-case" ]
      [ "unicode-gencat" ]
      [ "unicode-perl" ]
      [ "unicode-script" ]
      [ "unicode-segment" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".semver."0.9.0" = overridableMkRustCrate (profileName: rec {
    name = "semver";
    version = "0.9.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      semver_parser = rustPackages."registry+https://github.com/rust-lang/crates.io-index".semver-parser."0.7.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".semver-parser."0.7.0" = overridableMkRustCrate (profileName: rec {
    name = "semver-parser";
    version = "0.7.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".smallvec."0.6.14" = overridableMkRustCrate (profileName: rec {
    name = "smallvec";
    version = "0.6.14";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b97fcaeba89edba30f044a10c6a3cc39df9c3f17d7cd829dd1446cab35f890e0"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
    dependencies = {
      maybe_uninit = rustPackages."registry+https://github.com/rust-lang/crates.io-index".maybe-uninit."2.0.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".termcolor."1.0.5" = overridableMkRustCrate (profileName: rec {
    name = "termcolor";
    version = "1.0.5";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "96d6098003bde162e4277c70665bd87c326f5a0c3f3fbfb285787fa482d54e6e"; };
    dependencies = {
      ${ if hostPlatform.isWindows then "wincolor" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".wincolor."1.0.2" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".unicode-bidi."0.3.4" = overridableMkRustCrate (profileName: rec {
    name = "unicode-bidi";
    version = "0.3.4";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "49f2bd0c6468a8230e1db229cff8029217cf623c767ea5d60bfbd42729ea54d5"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      matches = rustPackages."registry+https://github.com/rust-lang/crates.io-index".matches."0.1.8" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".unicode-normalization."0.1.8" = overridableMkRustCrate (profileName: rec {
    name = "unicode-normalization";
    version = "0.1.8";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "141339a08b982d942be2ca06ff8b076563cbe223d1befd5450716790d44e2426"; };
    dependencies = {
      smallvec = rustPackages."registry+https://github.com/rust-lang/crates.io-index".smallvec."0.6.14" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".url."2.1.0" = overridableMkRustCrate (profileName: rec {
    name = "url";
    version = "2.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "75b414f6c464c879d7f9babf951f23bc3743fb7313c081b2e6ca719067ea9d61"; };
    dependencies = {
      idna = rustPackages."registry+https://github.com/rust-lang/crates.io-index".idna."0.2.0" { inherit profileName; };
      matches = rustPackages."registry+https://github.com/rust-lang/crates.io-index".matches."0.1.8" { inherit profileName; };
      percent_encoding = rustPackages."registry+https://github.com/rust-lang/crates.io-index".percent-encoding."2.1.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".vcpkg."0.2.7" = overridableMkRustCrate (profileName: rec {
    name = "vcpkg";
    version = "0.2.7";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "33dd455d0f96e90a75803cfeb7f948768c08d70a6de9a8d2362461935698bf95"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.8" = overridableMkRustCrate (profileName: rec {
    name = "winapi";
    version = "0.3.8";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "8093091eeb260906a183e6ae1abdba2ef5ef2257a21801128899c3fc699229c6"; };
    features = builtins.concatLists [
      [ "consoleapi" ]
      [ "errhandlingapi" ]
      [ "fileapi" ]
      [ "minwinbase" ]
      [ "minwindef" ]
      [ "processenv" ]
      [ "std" ]
      [ "winbase" ]
      [ "wincon" ]
      [ "winerror" ]
      [ "winnt" ]
    ];
    dependencies = {
      ${ if hostPlatform.config == "i686-pc-windows-gnu" then "winapi_i686_pc_windows_gnu" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" { inherit profileName; };
      ${ if hostPlatform.config == "x86_64-pc-windows-gnu" then "winapi_x86_64_pc_windows_gnu" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi-util."0.1.2" = overridableMkRustCrate (profileName: rec {
    name = "winapi-util";
    version = "0.1.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "7168bab6e1daee33b4557efd0e95d5ca70a03706d39fa5f3fe7a236f584b03c9"; };
    dependencies = {
      ${ if hostPlatform.isWindows then "winapi" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.8" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".wincolor."1.0.2" = overridableMkRustCrate (profileName: rec {
    name = "wincolor";
    version = "1.0.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "96f5016b18804d24db43cebf3c77269e7569b8954a8464501c216cc5e070eaa9"; };
    dependencies = {
      winapi = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.8" { inherit profileName; };
      winapi_util = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-util."0.1.2" { inherit profileName; };
    };
  });
  
}
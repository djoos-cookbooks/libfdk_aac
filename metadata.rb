name             "libfdk_aac"
maintainer       "Escape Studios"
maintainer_email "dev@escapestudios.com"
license          "MIT"
description      "Installs/Configures libfdk-aac"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

supports "ubuntu"

depends "git"
depends "build-essential"
depends "yasm"
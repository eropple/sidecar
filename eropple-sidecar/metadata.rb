name             'eropple-sidecar'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures eropple-sidecar'
long_description 'Installs/Configures eropple-sidecar'
version          '0.1.0'

depends "poise-service", "~> 1.5"
depends "poise-archive", "~> 1.5"

depends "yum-epel"
depends "yum-scl"

depends "java"

depends "build-essential"
depends "firewall", "~> 2.6"
depends "postgresql", "~> 6.1"
depends "redisio", "~> 2.6"
depends "sc-mongodb", "~> 1.0.0"
depends "selinux", "~> 2.1"

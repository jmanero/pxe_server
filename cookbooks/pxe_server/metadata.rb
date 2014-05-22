name             'pxe_server'
maintainer       'John Manero'
maintainer_email 'jmanero@dyn.com'
license          'All rights reserved'
description      'Install/Configure a pxe_server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), "VERSION")) rescue "0.0.1"

depends "apt"

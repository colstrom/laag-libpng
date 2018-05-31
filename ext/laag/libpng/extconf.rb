
# -*- ruby -*-

require 'mkmf' # Ruby Standard Library

require 'laag' # MIT License
require_relative '../../../lib/laag/libpng'

LAAG::BuildEnvironment
  .new(LAAG.libpng)
  .script { default! }

create_makefile 'laag/libpng'

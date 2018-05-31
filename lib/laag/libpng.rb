
# -*- ruby -*-

require 'laag/library' # MIT License

module LAAG
  LIBPNG_GEM_ROOT = File.expand_path(File.join(__dir__, %w[.. ..]))
  LIBPNG_ORIGIN  = 'git.code.sf.net/p/libpng/code'
  LIBPNG_VERSION = (
    $LOADED_FEATURES
      .map { |f| f.match %r{/laag-libpng-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)} }
      .compact
      .map { |gem| gem['version'] }
      .uniq
      .first
  ) || (
    File
      .basename(LIBPNG_GEM_ROOT)
      .match(%r{^laag-libpng-(?<version>[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+)})['version']
  )

  def self.libpng
    @@libpng ||= Library.new(
      gem_root: LIBPNG_GEM_ROOT,
      origin:   LIBPNG_ORIGIN,
      version:  LIBPNG_VERSION
    )
  end
end

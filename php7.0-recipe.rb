class Php70Noeval < FPM::Cookery::Recipe
  name 'php7.0-noeval'
  version '0.1.0'
  revision '1'

  PHP_API_VERSION = '20151012'

  homepage 'https://gitlab.yetipress.org/lord2800/noeval'
  source "file:///#{Dir.pwd}/modules/noeval.so"

  description 'Read and set environmental variables for processes from Consul.'

  license 'Mozilla Public License'
  vendor 'HashiCorp'

  def build
  end

  def install
    lib("php/#{PHP_API_VERSION}").install 'noeval.so'
    etc('php/5.6/mods-available').install workdir('noeval.ini')
  end
end

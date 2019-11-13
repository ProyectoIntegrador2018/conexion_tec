module ApplicationHelper
  require 'openssl'

  def self.encrypt(string)
    cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
    @@key = cipher.random_key
    cipher.key = @@key
    s = cipher.update(string) + cipher.final
    s.unpack('H*')[0].upcase
  end

  def self.decrypt(string)
    cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').decrypt
    cipher.key = @@key
    s = [string].pack("H*").unpack("C*").pack("c*")
    cipher.update(s) + cipher.final
  end

  def current_edition
    Edition.last
  end
end

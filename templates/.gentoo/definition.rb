require 'net/http'
require File.dirname(__FILE__) + "/common_session.rb"
require File.dirname(__FILE__) + "/gentoo_session.rb"
require File.dirname(__FILE__) + "/architecture_session.rb"

uri = "http://distfiles.gentoo.org/releases/#{ARCHITECTURE}/autobuilds"
template_uri   = "#{uri}/latest-install-#{ARCHITECTURE}-minimal.txt"
template_build = Net::HTTP.get_response(URI.parse(template_uri)).body
template_build = /^(([^#].*)\/(.*))/.match(template_build)

case ARCHITECTURE
when "amd64"
	os_type_id = 'Gentoo_64'
when "x86"
	os_type_id = 'Gentoo'
end


session =
  GENTOO_SESSION.merge( 
  											:ssh_user 	=> "root",
  											:os_type_id => os_type_id,
  											:iso_file 	=> template_build[3],
                        :iso_src    => "#{uri}/#{template_build[1]}"
                      )

Veewee::Session.declare session

require 'smart_proxy_rhsm/version'

module Proxy
  module Rhsm
    # The Smart Proxy RHSM plugin. The goal of this plugin is to signal Katello
    # that there's a RHSM API somewhere and expose it to clients. Essentially
    # service discovery.
    class Plugin < ::Proxy::Plugin
      plugin :rhsm, Proxy::Rhsm::VERSION
      validate :rhsm_base_url, url: true
      expose_setting :rhsm_base_url
    end
  end
end

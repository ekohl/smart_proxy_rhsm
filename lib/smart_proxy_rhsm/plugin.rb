module Proxy
  module Rhsm
    class Plugin < ::Proxy::Plugin
      plugin :rhsm, Proxy::Rhsm::VERSION
      validate :rhsm_base_url, url: true
      expose_setting :rhsm_base_url
    end
  end
end

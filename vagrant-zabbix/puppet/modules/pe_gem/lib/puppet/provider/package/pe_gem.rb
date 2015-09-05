require 'puppet/provider/package'
require 'uri'

# Ruby gems support.
Puppet::Type.type(:package).provide :pe_gem, :parent => :gem do
  desc "Puppet Enterprise Ruby Gem support. If a URL is passed via `source`, then
    that URL is used as the remote gem repository; if a source is present but is
    not a valid URL, it will be interpreted as the path to a local gem file.  If
    source is not present at all, the gem will be installed from the default gem
    repositories."

  has_feature :versionable, :install_options

  commands :gemcmd => "/opt/puppet/bin/gem"

  def self.instances
    if Puppet[:version].to_f >= 4.0
      warn "DEPRECATION: As of Puppet 4.0, the pe_gem provider for the package resource has been deprecated. Please use the puppet_gem provider instead."
    end

    super
  end
end

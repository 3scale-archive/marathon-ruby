module Marathon
  autoload :Client, 'marathon/client'
  autoload :VERSION, 'marathon/version'

  def self.new(host)
    Client.new(host)
  end
end

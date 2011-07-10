Shindo.tests('Fog::Rackspace::LoadBalancer | load_balancer', ['rackspace']) do

  @lb_name = 'fog' + Time.now.to_i.to_s
  model_tests(Fog::Rackspace::LoadBalancer.new.load_balancers,
    {
      :name => @lb_name,
      :protocol => 'HTTP',
      :port => 80,
      :virtual_ips => [{ :type => 'PUBLIC'}],
      :nodes => [{ :address => '10.0.0.1', :port => 80, :condition => 'ENABLED'}]
    },
    false) do
    @instance.wait_for { ready? }
  end
end

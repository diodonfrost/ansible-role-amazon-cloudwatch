amazon_cloudwatch_package = 'amazon-cloudwatch-agent'

control 'cloudwatch-01' do
  impact 1.0
  title 'Amazon cloudwatch agent install'
  desc 'Amazon cloudwatch agent should be installed'
  describe package(amazon_cloudwatch_package) do
    it { should be_installed }
  end
end


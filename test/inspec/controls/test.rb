# Read from output file
file_name = "output.json"
json_file = inspec.profile.file(file_name)
attributes = JSON.parse(json_file)

id = attributes['id']
mock_alb = attributes['mock_alb']
mock_nlb = attributes['mock_nlb']
mock_apigatewayv2 = attributes['mock_apigatewayv2']
monitors = attributes['monitors']
empty_monitors = attributes['empty_monitors']

#--------------------------------------
control 'datadog_catalog' do
    impact 1.0
    title 'Test catalog outputs'

    describe empty_monitors.empty? do
        it { should cmp true }
    end

    describe monitors["#{id}/alb/httpcode_elb_5xx"] do
        its("name") { should cmp "HTTPCode_elb_5XX: #{mock_alb}" }
    end    
end  
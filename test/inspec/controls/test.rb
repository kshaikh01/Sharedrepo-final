# Read from output file
file_name = "output.json"
json_file = inspec.profile.file(file_name)
attributes = JSON.parse(json_file)
attributes_struct = JSON.parse(json_file, object_class: OpenStruct)

id = attributes['id']
mock_alb = attributes['mock_alb']
mock_nlb = attributes['mock_nlb']
mock_apigatewayv2 = attributes['mock_apigatewayv2']
monitors = attributes_struct.monitors
empty_monitors = attributes['empty_monitors']

#--------------------------------------
control 'datadog_catalog' do
    impact 1.0
    title 'Test catalog outputs'

    describe empty_monitors.empty? do
        it { should cmp true }
    end

    describe monitors do
        its("\"#{id}/alb/httpcode_elb_5xx\".name") { should cmp "HTTPCode_elb_5XX: #{id}" }
    end    
end  
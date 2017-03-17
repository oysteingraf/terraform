resource "datadog_monitor" "Test1 monitor" {
#	id 					= 1689562
	type 				= "query alert"
	name 				= "CPU is very high - test2"
	message 			= "@og@basefarm.com\n\nHost: {{host.name}}\nIP-adress: {{host.ip}}\nRegion: {{host.region}} \nEnvironment: {{host.environment}} \nAutoscaling group: {{host.autoscaling_group}} \nOwner: {{host.owner}}"
	escalation_message 	= "Escalation message"
	
	query = "avg(last_5m):avg:aws.ec2.cpuutilization{host:i-020abbcb9c20ce373} by {host} >= 90"
	
	thresholds {
			critical = 90
			warning  = 80
	}
	
	notify_no_data 	  = false
	renotify_interval = 0
	
	notify_audit = true
	locked 		 = false
	timeout_h 	 = 0
	
	require_full_window = false
	new_host_delay 		= 120
		
	evaluation_delay  = 900
	no_data_timeframe = 2
	
	tags = ["test"]
}
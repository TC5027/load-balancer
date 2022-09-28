#!/usr/bin/env python3

import os
import re

stream = os.popen("sudo docker ps")
output = stream.readlines()

map_name_last_digit_ip = {}

for container_data in output[1:]:
	splitted_container_data = container_data.split()
	container_id = splitted_container_data[0]
	container_name = splitted_container_data[-1]
	stream = os.popen("sudo docker inspect "+container_id+" | grep IPAddress\\\"")
	output = stream.readlines()
	for ip_result in output:
		ip = ip_result.split(":")[1]
		if len(ip)>5:
			ip = ip.strip()
			ip = ip.replace('\"','')
			ip = ip.replace(',','')
			map_name_last_digit_ip[container_name] = ip.split('.')[-1]


print(map_name_last_digit_ip)
with open('../lb-from-scratch/xdp_lb_kern.c') as c_file:
	with open('../lb-from-scratch/xdp_lb_kern.c.tmp', 'w') as new_c_file:
		for line in c_file:
			if line.startswith("#define"):
				if line.split()[1] in map_name_last_digit_ip:
					new_c_file.write(re.sub("\d", map_name_last_digit_ip[line.split()[1]], line))
				else:
					new_c_file.write(line)
			else:
				new_c_file.write(line)


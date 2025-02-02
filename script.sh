# Script to automate the creation of EC2 using LaunchTemplate

#!/bin/bash
I=1
sgids='sg-02e48f2d6a67dae12'
for subnet in 'subnet-058b72354f7ba061d' 'subnet-01e7ac3025886d8a0'
do
    echo "Creating EC2 Instance in $subnet ..."
    aws ec2 run-instances --instance-type t2.nano --launch-template LaunchTemplateId=lt-0ac526ed3ad2a0625 --security-group-ids $sgids --subnet-id $subnet --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=AWSB28-Server-'${I}'}]' >> /dev/null 2>&1
    echo "Created EC2 Machine with the name Testserver-${I}"
    I=$((I+1))
done

#!/bin/bash
yum update -y
amazon-linux-extras install nginx1.12 -y
service nginx start
systemctl enable nginx
echo "<h1>$(cat /etc/hostname)</h1>" >>
/usr/share/nginx/html/index.html
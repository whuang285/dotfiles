# .bash_profile

source ~/.bashrc

# export JAVA_HOME=$(/usr/libexec/java_home -v 2.8)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/
export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec

cofproxy on

alias casedb="rm ~/.ssh/known_hosts; ssh -L 5435:casemgmt-db.cloud.capitalone.com:5432 card-bastion-pl.cloud.capitalone.com -N"

alias token0="~/Documents/SecurityTokenScript-MacOS-1.3.0 --gen-config" 
alias token1="~/Documents/SecurityTokenScript-MacOS-1.3.0"
alias token2="vim ~/.aws/credentials"
alias awsdev="aws --profile GR_GG_COF_AWS_Card_Dev_Developer ec2 describe-instances --region us-east-1"
alias awscom="aws --profile GR_GG_COF_AWS_Card_Common_QA_Developer ec2 describe-instances --region us-east-1"

if [ -f /usr/local/cof/bin/cofproxy ]                                 #source_cofproxy
  then source /usr/local/cof/bin/cofproxy > /dev/null 2>&1            #source_cofproxy
fi                                                                    #source_cofproxy

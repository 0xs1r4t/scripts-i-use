# changing our network namespace's rules doesn't impact the host! a demo.
ssh $USER@$IP -i $KEY.pem

cat /etc/issue # machine used in tutorial is Ubuntu 16.04.5 LTS

# add a network namespace
sudo ip netns add sample1

# list out network namespaces
sudo ip netns list

# install a simple networking command and try it out
sudo apt-get install iptables
sudo iptables -L

# execute this command within a network namespace
sudo ip netns exec sample1 iptables -L # should work!

# execute bash within this network namespace
sudo ip netns exec sample1 bash # should open the network namespace as the root user
iptables -L # should work without sudo

# add a new rule within the network namespace
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT # port 80 is HTTP
iptables -L # check if the rule has been applied
exit

# check out whether the rule has been applied outside the namespace
iptables -L # it shouldn't have applied

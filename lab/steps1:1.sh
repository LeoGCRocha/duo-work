# Pass this script to the minifab command to execute the steps
curl -o minifab -sL https://tinyurl.com/yxa2q6yr 
chmod +x minifab
sudo mv minifab /usr/local/bin
git clone https://github.com/ct-blockchain/minifabric
cd minifabric
docker build -t hyperledgerlabs/minifab:latest .
cd ../

##
# site A
##
cd site_A
minifab up -o orgA.com -e 7050  -n samplecc -p ''

##
# site B
##
cd ../site_B
minifab netup -o orgB.com -e 7060

cp vars/JoinRequest_orgB-com.json ../site_A/vars/NewOrgJoinRequest.json

##
# site A
##
# 
cd ../site_A
minifab orgjoin

cp vars/profiles/endpoints.yaml ../site_B/vars/


##
# site B
##
cd ../site_B
minifab nodeimport,join -c mychannel

### steps with error
# siteB
# minifab install,approve -n samplecc
# siteA
# minifab approve,discover,commit
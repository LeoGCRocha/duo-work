# site X
cd site_X/
minifab up -e 7100 -o orgX.com -n samplecc
# site Y
cd ../site_Y/
minifab netup -e 7120 -o orgY.com
# site Z
cd ../site_Z/
minifab netup -e 7140 -o orgZ.com
# Works to install first chaincode but break to others
cd ../site_Y/
cp vars/JoinRequest_orgY-com.json ../site_X/vars/NewOrgJoinRequest.json
# site X
cd ../site_X/
minifab orgjoin
cp vars/profiles/endpoints.yaml ../site_Y/vars/
# site Y
cd ../site_Y/
minifab nodeimport,join
# Verifying channel configuration
# minifab channelquery
# Installing chaincode at site Y
minifab install,approve -n samplecc
# site X
cd ../site_X/
minifab approve,discover,commit -n samplecc
# Successful installed chaincode
# site Z
cd ../site_Z/
cp vars/JoinRequest_orgZ-com.json ../site_X/vars/NewOrgJoinRequest.json
# site X
cd ../site_X/
# Still can approve because have majority
minifab channelquery,configmerge,channelsign,channelupdate
cp vars/profiles/endpoints.yaml ../site_Z/vars/
# site Z
cd ../site_Z/
minifab nodeimport,join
# Istalling chaincode
minifab install,approve -n samplecc
# site Y
cd ../site_Y/
minifab approve 
# 3 to 1 majority
cd ../site_X/
minifab approve,discover,commit -n samplecc
# Successful installed chaincode samplecc
# Try to install chaincode simple
# site X
cd ../site_X/ 
minifab install,approve -n simple
# site Y
cd ../site_Y/
minifab approve -n simple
# site Z
cd ../site_Z/
minifab approve -n simple
# site X
cd ../site_X/
minifab discover,commit
# Dicover error (empty)
#   The task includes an option with an undefined variable. The error was: 'dict object' has no attribute 'Layouts'
#   The error appears to be in '/home/playbooks/common/peerselection.yaml': line 25, column 5, but may
#   be elsewhere in the file depending on the exact syntax problem.
#   The offending line appears to be:
#     - name: Select a random endorser group
#       ^ here

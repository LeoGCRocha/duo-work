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

###
#### add site C
####

##
# site C
##
cd ../site_C
minifab netup -o orgC.com -e 7070

cp vars/JoinRequest_orgC-com.json ../site_A/vars/NewOrgJoinRequest.json


##
# site A
##
# 
cd ../site_A
minifab channelquery,configmerge,channelsign

sudo cp vars/mychannel_update_envelope.pb ../site_B/vars/


##
# site B
##
cd ../site_B
minifab channelsignenvelope

sudo cp vars/mychannel_update_envelope.pb ../site_A/vars/


##
# site A
##
# 
cd ../site_A
minifab channelupdate

cp vars/profiles/endpoints.yaml ../site_C/vars/


##
# site C
##
cd ../site_C
minifab nodeimport,join -c mychannel



###
#### add site D
####

##
# site D
##
cd ../site_D
minifab netup -o orgD.com -e 7080

cp vars/JoinRequest_orgD-com.json ../site_A/vars/NewOrgJoinRequest.json


##
# site A
##
# 
cd ../site_A
minifab channelquery,configmerge,channelsign

sudo cp vars/mychannel_update_envelope.pb ../site_B/vars/


##
# site B
##
cd ../site_B
minifab channelsignenvelope

sudo cp vars/mychannel_update_envelope.pb ../site_C/vars/

##
# site C
##
cd ../site_C
minifab channelsignenvelope

sudo cp vars/mychannel_update_envelope.pb ../site_A/vars/


##
# site A
##
# 
cd ../site_A
minifab channelupdate

cp vars/profiles/endpoints.yaml ../site_D/vars/


##
# site D
##
cd ../site_D
minifab nodeimport,join -c mychannel
@echo on

REM collect the params
set /p token=Openshift Login Token:
set /p ns=Openshift Namespace:
set /p projectname=Project Name:

oc3 login https://console.pathfinder.gov.bc.ca:8443 --token=%token%

REM create all the dirs
mkdir %projectname%-export
cd %projectname%-export
mkdir %projectname%-tools
mkdir %projectname%-dev
mkdir %projectname%-test
mkdir %projectname%-prod

REM ##### TOOLS ######
cd %projectname%-tools
oc3 project %ns%-tools

REM Get the legacy main object backup (RAW)
oc3 get -o yaml --export all > %projectname%-rawbackup.yaml

oc3 get services --export > services

REM Backup discrete kubernetes templates by object type
oc3 export pods --as-template=%projectname%-pods > %projectname%-pods.yaml
oc3 export replicationcontrollers --as-template=%projectname%-replicationcontrollers > %projectname%-replicationcontrollers.yaml
oc3 export services --as-template=%projectname%-services > %projectname%-services.yaml
oc3 export deploymentconfigs --as-template=%projectname%-deploymentconfigs > %projectname%-deploymentconfigs.yaml
oc3 export buildconfigs --as-template=%projectname%-buildconfigs > %projectname%-buildconfigs.yaml
oc3 export builds --as-template=%projectname%-builds > %projectname%-builds.yaml
oc3 export imagestreams --as-template=%projectname%-imagestreams > %projectname%-imagestreams.yaml
oc3 export routes --as-template=%projectname%-routes > %projectname%-routes.yaml
oc3 export rolebindings --as-template=%projectname%-rolebindings > %projectname%-rolebindings.yaml
oc3 export serviceaccounts --as-template=%projectname%-serviceaccounts > %projectname%-serviceaccounts.yaml
oc3 export secrets --as-template=%projectname%-secrets > %projectname%-secrets.yaml
oc3 export imagestreamtags --as-template=%projectname%-imagestreamtags > %projectname%-imagestreamtags.yaml
oc3 export cm --as-template=%projectname%-cm > %projectname%-cm.yaml
oc3 export egressnetworkpolicies --as-template=%projectname%-egressnetworkpolicies > %projectname%-egressnetworkpolicies.yaml
oc3 export rolebindingrestrictions --as-template=%projectname%-rolebindingrestrictions > %projectname%-rolebindingrestrictions.yaml
oc3 export limitranges --as-template=%projectname%-limitranges > %projectname%-limitranges.yaml
oc3 export resourcequotas --as-template=%projectname%-resourcequotas > %projectname%-resourcequotas.yaml
oc3 export pvc --as-template=%projectname%-pvc > %projectname%-pvc.yaml
oc3 export templates --as-template=%projectname%-templates > %projectname%-templates.yaml
oc3 export cronjobs --as-template=%projectname%-cronjobs > %projectname%-cronjobs.yaml
oc3 export statefulsets --as-template=%projectname%-statefulsets > %projectname%-statefulsets.yaml
oc3 export hpa --as-template=%projectname%-hpa > %projectname%-hpa.yaml
oc3 export deployments --as-template=%projectname%-deployments > %projectname%-deployments.yaml
oc3 export replicasets --as-template=%projectname%-replicasets > %projectname%-replicasets.yaml
oc3 export poddisruptionbudget --as-template=%projectname%-poddisruptionbudget > %projectname%-poddisruptionbudget.yaml
oc3 export endpoints --as-template=%projectname%-endpoints > %projectname%-endpoints.yaml

REM Get back to parent directory for next stage
cd ..

REM ##### DEV ######
cd %projectname%-dev
oc3 project %ns%-dev

REM Get the legacy main object backup (RAW)
oc3 get -o yaml --export all > %projectname%-rawbackup.yaml

REM Backup discrete kubernetes templates by object type
oc3 export pods --as-template=%projectname%-pods > %projectname%-pods.yaml
oc3 export replicationcontrollers --as-template=%projectname%-replicationcontrollers > %projectname%-replicationcontrollers.yaml
oc3 export services --as-template=%projectname%-services > %projectname%-services.yaml
oc3 export deploymentconfigs --as-template=%projectname%-deploymentconfigs > %projectname%-deploymentconfigs.yaml
oc3 export buildconfigs --as-template=%projectname%-buildconfigs > %projectname%-buildconfigs.yaml
oc3 export builds --as-template=%projectname%-builds > %projectname%-builds.yaml
oc3 export imagestreams --as-template=%projectname%-imagestreams > %projectname%-imagestreams.yaml
oc3 export routes --as-template=%projectname%-routes > %projectname%-routes.yaml
oc3 export rolebindings --as-template=%projectname%-rolebindings > %projectname%-rolebindings.yaml
oc3 export serviceaccounts --as-template=%projectname%-serviceaccounts > %projectname%-serviceaccounts.yaml
oc3 export secrets --as-template=%projectname%-secrets > %projectname%-secrets.yaml
oc3 export imagestreamtags --as-template=%projectname%-imagestreamtags > %projectname%-imagestreamtags.yaml
oc3 export cm --as-template=%projectname%-cm > %projectname%-cm.yaml
oc3 export egressnetworkpolicies --as-template=%projectname%-egressnetworkpolicies > %projectname%-egressnetworkpolicies.yaml
oc3 export rolebindingrestrictions --as-template=%projectname%-rolebindingrestrictions > %projectname%-rolebindingrestrictions.yaml
oc3 export limitranges --as-template=%projectname%-limitranges > %projectname%-limitranges.yaml
oc3 export resourcequotas --as-template=%projectname%-resourcequotas > %projectname%-resourcequotas.yaml
oc3 export pvc --as-template=%projectname%-pvc > %projectname%-pvc.yaml
oc3 export templates --as-template=%projectname%-templates > %projectname%-templates.yaml
oc3 export cronjobs --as-template=%projectname%-cronjobs > %projectname%-cronjobs.yaml
oc3 export statefulsets --as-template=%projectname%-statefulsets > %projectname%-statefulsets.yaml
oc3 export hpa --as-template=%projectname%-hpa > %projectname%-hpa.yaml
oc3 export deployments --as-template=%projectname%-deployments > %projectname%-deployments.yaml
oc3 export replicasets --as-template=%projectname%-replicasets > %projectname%-replicasets.yaml
oc3 export poddisruptionbudget --as-template=%projectname%-poddisruptionbudget > %projectname%-poddisruptionbudget.yaml
oc3 export endpoints --as-template=%projectname%-endpoints > %projectname%-endpoints.yaml

REM Get back to parent directory for next stage
cd ..

REM ##### TEST ######
cd %projectname%-test
oc3 project %ns%-test

REM Get the legacy main object backup (RAW)
oc3 get -o yaml --export all > %projectname%-rawbackup.yaml

REM Backup discrete kubernetes templates by object type
oc3 export pods --as-template=%projectname%-pods > %projectname%-pods.yaml
oc3 export replicationcontrollers --as-template=%projectname%-replicationcontrollers > %projectname%-replicationcontrollers.yaml
oc3 export services --as-template=%projectname%-services > %projectname%-services.yaml
oc3 export deploymentconfigs --as-template=%projectname%-deploymentconfigs > %projectname%-deploymentconfigs.yaml
oc3 export buildconfigs --as-template=%projectname%-buildconfigs > %projectname%-buildconfigs.yaml
oc3 export builds --as-template=%projectname%-builds > %projectname%-builds.yaml
oc3 export imagestreams --as-template=%projectname%-imagestreams > %projectname%-imagestreams.yaml
oc3 export routes --as-template=%projectname%-routes > %projectname%-routes.yaml
oc3 export rolebindings --as-template=%projectname%-rolebindings > %projectname%-rolebindings.yaml
oc3 export serviceaccounts --as-template=%projectname%-serviceaccounts > %projectname%-serviceaccounts.yaml
oc3 export secrets --as-template=%projectname%-secrets > %projectname%-secrets.yaml
oc3 export imagestreamtags --as-template=%projectname%-imagestreamtags > %projectname%-imagestreamtags.yaml
oc3 export cm --as-template=%projectname%-cm > %projectname%-cm.yaml
oc3 export egressnetworkpolicies --as-template=%projectname%-egressnetworkpolicies > %projectname%-egressnetworkpolicies.yaml
oc3 export rolebindingrestrictions --as-template=%projectname%-rolebindingrestrictions > %projectname%-rolebindingrestrictions.yaml
oc3 export limitranges --as-template=%projectname%-limitranges > %projectname%-limitranges.yaml
oc3 export resourcequotas --as-template=%projectname%-resourcequotas > %projectname%-resourcequotas.yaml
oc3 export pvc --as-template=%projectname%-pvc > %projectname%-pvc.yaml
oc3 export templates --as-template=%projectname%-templates > %projectname%-templates.yaml
oc3 export cronjobs --as-template=%projectname%-cronjobs > %projectname%-cronjobs.yaml
oc3 export statefulsets --as-template=%projectname%-statefulsets > %projectname%-statefulsets.yaml
oc3 export hpa --as-template=%projectname%-hpa > %projectname%-hpa.yaml
oc3 export deployments --as-template=%projectname%-deployments > %projectname%-deployments.yaml
oc3 export replicasets --as-template=%projectname%-replicasets > %projectname%-replicasets.yaml
oc3 export poddisruptionbudget --as-template=%projectname%-poddisruptionbudget > %projectname%-poddisruptionbudget.yaml
oc3 export endpoints --as-template=%projectname%-endpoints > %projectname%-endpoints.yaml

REM Get back to parent directory for next stage
cd ..

REM ##### prod ######
cd %projectname%-prod
oc3 project %ns%-prod

REM Get the legacy main object backup (RAW)
oc3 get -o yaml --export all > %projectname%-rawbackup.yaml

REM Backup discrete kubernetes templates by object type
oc3 export pods --as-template=%projectname%-pods > %projectname%-pods.yaml
oc3 export replicationcontrollers --as-template=%projectname%-replicationcontrollers > %projectname%-replicationcontrollers.yaml
oc3 export services --as-template=%projectname%-services > %projectname%-services.yaml
oc3 export deploymentconfigs --as-template=%projectname%-deploymentconfigs > %projectname%-deploymentconfigs.yaml
oc3 export buildconfigs --as-template=%projectname%-buildconfigs > %projectname%-buildconfigs.yaml
oc3 export builds --as-template=%projectname%-builds > %projectname%-builds.yaml
oc3 export imagestreams --as-template=%projectname%-imagestreams > %projectname%-imagestreams.yaml
oc3 export routes --as-template=%projectname%-routes > %projectname%-routes.yaml
oc3 export rolebindings --as-template=%projectname%-rolebindings > %projectname%-rolebindings.yaml
oc3 export serviceaccounts --as-template=%projectname%-serviceaccounts > %projectname%-serviceaccounts.yaml
oc3 export secrets --as-template=%projectname%-secrets > %projectname%-secrets.yaml
oc3 export imagestreamtags --as-template=%projectname%-imagestreamtags > %projectname%-imagestreamtags.yaml
oc3 export cm --as-template=%projectname%-cm > %projectname%-cm.yaml
oc3 export egressnetworkpolicies --as-template=%projectname%-egressnetworkpolicies > %projectname%-egressnetworkpolicies.yaml
oc3 export rolebindingrestrictions --as-template=%projectname%-rolebindingrestrictions > %projectname%-rolebindingrestrictions.yaml
oc3 export limitranges --as-template=%projectname%-limitranges > %projectname%-limitranges.yaml
oc3 export resourcequotas --as-template=%projectname%-resourcequotas > %projectname%-resourcequotas.yaml
oc3 export pvc --as-template=%projectname%-pvc > %projectname%-pvc.yaml
oc3 export templates --as-template=%projectname%-templates > %projectname%-templates.yaml
oc3 export cronjobs --as-template=%projectname%-cronjobs > %projectname%-cronjobs.yaml
oc3 export statefulsets --as-template=%projectname%-statefulsets > %projectname%-statefulsets.yaml
oc3 export hpa --as-template=%projectname%-hpa > %projectname%-hpa.yaml
oc3 export deployments --as-template=%projectname%-deployments > %projectname%-deployments.yaml
oc3 export replicasets --as-template=%projectname%-replicasets > %projectname%-replicasets.yaml
oc3 export poddisruptionbudget --as-template=%projectname%-poddisruptionbudget > %projectname%-poddisruptionbudget.yaml
oc3 export endpoints --as-template=%projectname%-endpoints > %projectname%-endpoints.yaml

cd ..
cd ..
REM Operation Complete! Press enter to exit
pause
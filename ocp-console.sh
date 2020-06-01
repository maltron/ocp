ssh root@bastion -o StrictHostKeyChecking=no "sudo find /root/ -iname ".openshift_install.log" -exec tail -1 {} \; " | awk '/password: /{ print $11 }'  | sed 's-"--g' | pbcopy
open $(oc get route/console --namespace openshift-console --output jsonpath='{.spec.port.targetPort}://{.spec.host}')

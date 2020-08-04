ssh bastion "find /root/ -iname '.openshift_install.log' -exec tail -8 {} \; | head -n 1" | awk '{ print $12 }' | sed 's-\\"--g' | sed 's-"--g' | pbcopy
open $(oc get route/console --namespace openshift-console --output jsonpath='{.spec.port.targetPort}://{.spec.host}')

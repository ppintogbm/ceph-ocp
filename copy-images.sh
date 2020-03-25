#!/bin/bash

REGISTRY=${1:-registry.ocp43.localdomain:5000}

#Auth to local registry
podman login ${REGISTRY}

if [ $? -ne 0 ]
then
  echo "Invalid login... leaving"
fi

echo "Copying images to local registry"

skopeo copy --format oci docker://quay.io/cephcsi/cephcsi:canary docker://${REGISTRY}/cephcsi/cephcsi:canary
skopeo copy --format oci docker://quay.io/k8scsi/csi-attacher:v2.1.0 docker://${REGISTRY}/k8scsi/csi-attacher:v2.1.0
skopeo copy --format oci docker://quay.io/k8scsi/csi-node-driver-registrar:v1.2.0 docker://${REGISTRY}/k8scsi/csi-node-driver-registrar:v1.2.0
skopeo copy --format oci docker://quay.io/k8scsi/csi-provisioner:v1.4.0 docker://${REGISTRY}/k8scsi/csi-provisioner:v1.4.0
skopeo copy --format oci docker://quay.io/k8scsi/csi-resizer:v0.4.0 docker://${REGISTRY}/k8scsi/csi-resizer:v0.4.0
skopeo copy --format oci docker://quay.io/k8scsi/csi-snapshotter:v1.2.2 docker://${REGISTRY}/k8scsi/csi-snapshotter:v1.2.2

echo "Replacing image from manifests"
sed -i "s/image: \(.*\)\/\(.*\)\/\(.*\)/image: $REGISTRY\/\2\/\3/g" */*.yaml

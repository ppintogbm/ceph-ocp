          skopeo copy --format oci docker://quay.io/cephcsi/cephcsi:canary docker://registry.ocp4.localdomain.net:5000/cephcsi/cephcsi:canary
          skopeo copy --format oci docker://quay.io/k8scsi/csi-attacher:v2.1.0 docker://registry.ocp4.localdomain.net:5000/k8scsi/csi-attacher:v2.1.0
          skopeo copy --format oci docker://quay.io/k8scsi/csi-node-driver-registrar:v1.2.0 docker://registry.ocp4.localdomain.net:5000/k8scsi/csi-node-driver-registrar:v1.2.0
          skopeo copy --format oci docker://quay.io/k8scsi/csi-provisioner:v1.4.0 docker://registry.ocp4.localdomain.net:5000/k8scsi/csi-provisioner:v1.4.0
          skopeo copy --format oci docker://quay.io/k8scsi/csi-resizer:v0.4.0 docker://registry.ocp4.localdomain.net:5000/k8scsi/csi-resizer:v0.4.0
          skopeo copy --format oci docker://quay.io/k8scsi/csi-snapshotter:v1.2.2 docker://registry.ocp4.localdomain.net:5000/k8scsi/csi-snapshotter:v1.2.2

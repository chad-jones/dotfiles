function remove_volumeattachment_finalizer
    set -l volume_name $argv[1]

    if test -z "$volume_name"
        echo "Usage: remove_volumeattachment_finalizer_by_volume <volume-name>"
        return 1
    end

    # Get the VolumeAttachment associated with the volume
    set -l volume_attachment (kubectl get volumeattachment -o json | jq -r --arg volume "$volume_name" '.items[] | select(.spec.source.persistentVolumeName == $volume) | .metadata.name')

    if test -z "$volume_attachment"
        echo "No VolumeAttachment found for volume $volume_name."
        return 1
    end

    # Patch the VolumeAttachment to remove the finalizers
    kubectl patch volumeattachment $volume_attachment --type=json -p '[{"op": "remove", "path": "/metadata/finalizers"}]'

    if test $status -eq 0
        echo "Successfully removed finalizers from VolumeAttachment $volume_attachment."
    else
        echo "Failed to remove finalizers from VolumeAttachment $volume_attachment."
        return 1
    end
end

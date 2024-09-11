function delete_volumeattachment
    set -l volume_name $argv[1]

    if test -z "$volume_name"
        echo "Usage: delete_volumeattachment_by_volume <volume-name>"
        return 1
    end

    # Get the VolumeAttachment associated with the volume
    set -l volume_attachment (kubectl get volumeattachment -o json | jq -r --arg volume "$volume_name" '.items[] | select(.spec.source.persistentVolumeName == $volume) | .metadata.name')

    if test -z "$volume_attachment"
        echo "No VolumeAttachment found for volume $volume_name."
        return 1
    end

    # Delete the VolumeAttachment
    kubectl delete volumeattachment $volume_attachment

    if test $status -eq 0
        echo "Successfully deleted VolumeAttachment $volume_attachment."
    else
        echo "Failed to delete VolumeAttachment $volume_attachment."
        return 1
    end
end

function aw
      open "https://argo-workflows.uniscale.zone/workflows/argo-events-pipelines?phase=Error&phase=Pending&phase=Running&phase=Succeeded&phase=Failed&label=commit%3D$(git rev-parse HEAD)"
end

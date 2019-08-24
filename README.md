# Add plugins to custom managed master image with new plugin manager

This approach uses the [Plugin Installation Manager Tool](https://github.com/jenkinsci/plugin-installation-manager-tool)

1. Build this image and push it to a registry
2. Go into Operations Center and add this as a custom master docker image
3. Create a MM via the UI, but ensure that you include `-Djenkins.install.runSetupWizard=false` as a java option.

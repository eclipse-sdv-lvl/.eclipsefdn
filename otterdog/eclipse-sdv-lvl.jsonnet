local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.sdv-lvl', 'eclipse-sdv-lvl') {
  settings+: {
    description: "",
    name: "Eclipse SDV-LVL",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
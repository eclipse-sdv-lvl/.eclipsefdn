local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.sdv-lvl', 'eclipse-sdv-lvl') {
  settings+: {
    description: "",
    name: "Eclipse SDV-LVL",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
}

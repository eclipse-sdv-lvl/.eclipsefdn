local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.sdv-lvl', 'eclipse-sdv-lvl') {
  settings+: {
    description: "",
    name: "Eclipse SDV-LVL",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
    },
    orgs.newRepo('sdv-lvl') {
      allow_merge_commit: true,
      allow_update_branch: false,
      // code_scanning_default_setup_enabled: true,
      // code_scanning_default_languages+: [
      //   "python"
      // ],
      description: "Main repository of the SDV Level project.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "main",
      gh_pages_source_path: "/",
      has_discussions: true,
      homepage: "https://eclipse-sdv-lvl.github.io/sdv-lvl/",
      topics+: [
        "sdv-levels",
        "software-defined-vehicle",
      ],
      rulesets: [
        orgs.newRepoRuleset('main') {
          include_refs+: [
            "refs/heads/main"
          ],
          required_pull_request+: {
            dismisses_stale_reviews: true,
            required_approving_review_count: 1,
            requires_code_owner_review: true,
          },
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}

# relay-actions-fixture

A tiny public repository for testing Relay's GitHub Actions check runner (`runner: {github_actions: relay-checks.yml}`).

- `greeting.txt` is the "code".
- `check.sh` is the one check: `greeting.txt` must start with `hello`. It writes JUnit to `relay-results/junit/`.
- `.github/workflows/relay-checks.yml` runs `sh check.sh` on `workflow_dispatch` and uploads `relay-results`.
- `.relay/blueprint.yaml` tells Relay to run its checks there.

Nothing here deploys or publishes anything.

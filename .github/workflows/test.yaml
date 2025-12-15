name: Trigger build on GHA

on:
  issue_comment:
    types: [created, edited]
  # schedule:
  #   - cron: '0 * * * *'
  workflow_dispatch:

permissions:
  issues: write
  contents: write

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:

  ppc64le-sync:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout your fork
        uses: actions/checkout@v4
        with:
          persist-credentials: true
          fetch-depth: 0

      - name: Set Git identity
        run: |
          git config --global user.name "github-actions[bot]"
          git config --global user.email "github-actions[bot]@users.noreply.github.com"
          git config core.editor true
      - name: Add upstream repo
        run: |
          git remote add upstream https://github.com/dotnet/runtime.git
          git fetch upstream
      - name: Merge upstream and push
        run: |
          git checkout main
          git merge upstream/main --no-edit
          # git merge upstream/main
          # git push https://${{ github.actor }}:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }} main
      
      - name: Push changes
        env:
          PAT: ${{ secrets.PAT }}
        run: |
          git push https://x-access-token:${PAT}@github.com/${{ github.repository }} main
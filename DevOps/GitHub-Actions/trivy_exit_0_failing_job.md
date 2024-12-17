Failing the Job with Trivy Report Critical
----------------------------------------------
```yaml
name: Failing job for trivy critical reports

on: push

jobs:
  build-and-scan:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Build Docker Image
        run: |
          docker build -t my-image:latest .

      - name: Run Trivy Scan
        id: trivy-scan
        run: |
          docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --exit-code 1 --severity CRITICAL my-image:latest
        continue-on-error: true

      # Fail workflow if critical vulnerabilities are found
      - name: Check Trivy Results
        if: steps.trivy-scan.outcome == 'failure'
        run: |
          echo "Critical vulnerabilities found in the Docker image. Stopping workflow."
          exit 1

      # Steps after Trivy scan that should be skipped if vulnerabilities are found
      - name: Deploy Application
        if: success()  # Only runs if previous steps are successful
        run: |
          echo "Deploying application..."

```
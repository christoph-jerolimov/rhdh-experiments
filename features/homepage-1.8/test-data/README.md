# Some additional test data

## Test a custom homepage

```yaml
proxy:
  endpoints:
    # Custom Data
    '/developer-hub':
      target: https://raw.githubusercontent.com
      pathRewrite:
        '^/api/proxy/developer-hub': /christoph-jerolimov/rhdh-experiments/main/test-data/homepage.json
      changeOrigin: true
      secure: true
```

or:

```yaml
proxy:
  endpoints:
    # Custom Data
    '/developer-hub':
      target: https://raw.githubusercontent.com
      pathRewrite:
        '^/api/proxy/developer-hub$': /christoph-jerolimov/rhdh-experiments/main/test-data/homepage.json
        '^/api/proxy/developer-hub/backstage$': /christoph-jerolimov/rhdh-experiments/main/test-data/homepage-backstage-only.json
        '^/api/proxy/developer-hub/rhdh$': /christoph-jerolimov/rhdh-experiments/main/test-data/homepage-rhdh-only.json
      changeOrigin: true
      secure: true
```

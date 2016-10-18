# Manifest template processing [![wercker status](https://app.wercker.com/status/bb81f5937ad7a2ec5c7f86b82ffb1476/m "wercker status")](https://app.wercker.com/project/bykey/bb81f5937ad7a2ec5c7f86b82ffb1476)

This step uses the [`expenv`][expenv] tool to parse template files
and stores the generated file for future usage with like the [`kubectl`][kubectl] step.

## Example

```yml
deploy:
  steps:
  - blendle/expenv:
    template: template.yml              # required, must contain valid template
    output: deployment.yml              # optional, defaults to kubernetes.yml
    parameters: REPLICA_COUNT=2 KEY=foo # optional, regular parameters
    version: 1.2.0                      # optional, expenv version to download
    debug: true                         # optional, print debug information
```

## License

The step is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[expenv]: https://github.com/blang/expenv
[kubectl]: https://github.com/wercker/step-kubectl

# Kubernetes manifest template processing [![wercker status](https://app.wercker.com/status/4d5c28e27c11b1180b2d31bcd24db2a2/s/master "wercker status")](https://app.wercker.com/project/bykey/4d5c28e27c11b1180b2d31bcd24db2a2)

This step uses the [`ktmpl`][ktmpl] tool to parse [Kubernetes template files][tpl]
and stores the generated file for future usage with like the [`kubectl`][kubectl] step.

## Example

```yml
deploy:
  steps:
  - blendle/ktmpl:
    template: template.yml              # required, must contain valid template
    output: deployment.yml              # optional, defaults to kubernetes.yml
    parameters: REPLICA_COUNT=2 KEY=foo # optional, regular parameters
    base64_parameters: SECRET=$secret   # optional, will be base64 encoded
    version: 0.3.0                      # optional, ktmpl version to download
    debug: true                         # optional, print debug information
```

## License

The step is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[ktmpl]: https://github.com/InQuicker/ktmpl
[tpl]: https://github.com/kubernetes/kubernetes/blob/master/docs/proposals/templates.md
[kubectl]: https://github.com/wercker/step-kubectl

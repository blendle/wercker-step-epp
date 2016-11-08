# Manifest template processing [![wercker status](https://app.wercker.com/status/0023b4bdc6d5ebe2d8faf87037464d3b/s "wercker status")](https://app.wercker.com/project/bykey/0023b4bdc6d5ebe2d8faf87037464d3b)

This step uses the [`epp`][epp] tool to parse template files
and stores the generated file for future usage with like the [`kubectl`][kubectl] step.

## Example

```yml
deploy:
  steps:
  - blendle/epp:
    template: template.yml              # required, must contain valid template
    output: deployment.yml              # optional, defaults to kubernetes.yml
```

## License

The step is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[epp]: https://github.com/soudy/epp
[kubectl]: https://github.com/wercker/step-kubectl

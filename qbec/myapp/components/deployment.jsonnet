local p = import '../params.libsonnet';
local params = p.components.deploy;

[
  {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
      name: params.prefix + 'myapp',
    },
    spec: {
      replicas: params.replicas,
      selector: {
        matchLabels: {
          app: params.prefix + 'myapp',
        },
      },
      template: {
        metadata: {
          labels: {
            app: params.prefix + 'myapp',
          },
        },
        spec: {
          containers: [
            {
              image: 'cr.yandex/crp4hhqt6ub8aeidjgsk/myapp:' + params.tag,
              imagePullPolicy: 'Always',
              name: params.prefix + 'myapp',
            },
          ],
        },
      },
    },
  },
]
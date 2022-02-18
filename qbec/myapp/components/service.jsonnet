local p = import '../params.libsonnet';
local params = p.components.deploy;
[
  {
    apiVersion: 'v1',
    kind: 'Service',
    metadata: {
      name: params.prefix + 'myapp-service',
    },
    spec: {
      ports: [
        {
          name: 'http',
          port: 80,
          protocol: 'TCP',
          targetPort: 80,
        },
      ],
      selector: {
        app: params.prefix + 'myapp',
      },
      type: 'LoadBalancer',
    },
  },
]
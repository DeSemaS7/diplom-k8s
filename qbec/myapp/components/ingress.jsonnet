local p = import '../params.libsonnet';
local params = p.components.deploy;
[
  {
  apiVersion: 'networking.k8s.io/v1',
  kind: 'Ingress',
  metadata: {
    name: params.prefix + 'myapp-ingress',
    namespace: 'default',
    annotations: {
      "kubernetes.io/ingress.class": "nginx",
      "nginx.ingress.kubernetes.io/ssl-redirect": "false",
      "nginx.ingress.kubernetes.io/rewrite-target": "/$1"
    }
  },
  spec: {
    rules: [
     {
        host: "myapp.itsupp24.ru",
        http: {
          paths: [
            {
              path: "/",
              pathType: "Prefix",
              backend: {
                service: {
                  name: params.prefix + 'myapp-service',
                  port: {
                    number: 80
                  }
                }
              }
            },
          ]
        }
      }
    ]
  }
}
]
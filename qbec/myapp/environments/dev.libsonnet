
// this file has the param overrides for the default environment
local base = import './base.libsonnet';

base {
  components +: {
  deploy +: {
      replicas: 1,
      prefix: 'dev-',
      tag: '1.0.0',

    },
  }
}

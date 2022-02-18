
// this file has the param overrides for the default environment
local base = import './base.libsonnet';

base {
  components +: {
  deploy +: {
      replicas: 3,
      prefix: 'stage-',
      tag: '1.1.0',
    },
  }
}

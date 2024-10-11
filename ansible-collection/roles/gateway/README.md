casino.server.gateway
=========

Deploy tomcat instances for all of the Casino integration gateways

## Deploys and Configures
* AamsModulesService-{{ aams_version }}.war
* cs-{{ cs_version }}.war
* cs-jpf-{{ cs_jpf_version }}.war
* service-gw-{{ cs_servicegw_version }}.war
* egtgateway-{{ egtgateway_version }}.war
* mgsgateway-{{ mgsgateway_version }}.war
* playtechlivedealergateway-{{ playtechlivedealergateway_version }}.war
* pragmaticlivegateway-{{ pragmaticlivegateway_version }}.war
* sgdogsgateway-{{ sgdogsgateway_version }}.war"
* vendorservicegateway-{{ vendorservicegateway_version }}.war

## gateway_vendors
The example `gateway_vendors` set as the default is displayed below, these will be overwritten at the environment level. Information to build the `vendor_gateways` yaml can be found here:
[QA](https://confluence.pyrsoftware.ca/confluence/display/CAOPS/Casino+Gateway+Integrations+-+QA)
[Production](https://confluence.pyrsoftware.ca/confluence/display/CAOPS/Casino+Gateway+Integrations)

```yaml
gateway_vendors:
  - name: Playngo
    aams:
      username: playngo
      password: REDACTED
    app: cs
    cidrs:
      - 127.0.0.1/32
    id: 12
    seckeys: REDACTED
    shortname: png
    servicegw:
      url: http://172.29.32.73:15000/pokerstars/finalizegame
  - name: Skywind
    aams:
      username: skywind
      password: REDACTED
    app: cs
    cidrs:
      - 127.0.0.1/32
    id: 19
    seckeys: REDACTED
    shortname: skywind
    servicegw:
      url: https://skywind-ps-eu.sw420101.com/pokerstars-session-web/finalizegame
```

`AamsModulesService` and `service-gw` will only be configured for vendors where the relevant keys exist `aams:` and `servicegw:`, not all vendors use these services.

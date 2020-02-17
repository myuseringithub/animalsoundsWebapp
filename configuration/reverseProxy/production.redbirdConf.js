// This file would be required in Redbird reverseProxy. 
// USAGE: 

module.exports = function reverseProxy(proxy) {

    let domain = 'webapp.run'
    let subdomain = 'animalsounds'
    let containerGroupName = 'animalsoundswebapp'

    let proxyConfig = [
        {
            domain: domain,
            subdomain: subdomain,
            containerRoute: `http://${containerGroupName}_nodejs:80`,
            ssl: true            
        },
    ]

    return proxyConfig
}

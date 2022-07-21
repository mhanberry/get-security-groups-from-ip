const fs = require("fs")

const pattern = new RegExp(process.argv[2])
const securityGroups = JSON.parse(fs.readFileSync('security-groups.json', 'ascii')).SecurityGroups
const filteredSGs = securityGroups.filter(sg => pattern.test(JSON.stringify(sg)))

filteredSGs.forEach(sg => console.log(sg.GroupName))

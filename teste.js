const { users: User } = require('./models');

async function create () {
    const user = await User.create({
        name:"Seto",
        lastnName: "Kaiba",
        password: "Kaibarulestheworld",
        email: "seto@kaibainterprise.com",
        role:"ADMIN"
    })
    console.log(user)
}

create()
Employee subclass: Salaried [ 
    |weeklySalary|
    <comment:'This is the Salaried Employee class'>
    init: fn lname: ln salary: sal [
        <category:'Initialization'>
        super init: fn lname: ln.
        weeklySalary := sal.
    ]

    setSalary: amt [
        <category:'Sets the weekly salary'>
        weeklySalary := amt
    ]

    getEarning [
        <category:'Calculates the weekly earning'>
        ^weeklySalary
    ]

    getInfo [
        | firstLine secondLine thirdLine earning |
        <category:'Everything'>
        earning := ((self getEarning asFloat) asScaledDecimal:2) asString.
        firstLine := 'Salaried employee:', ' ', (self getFirstName), ' ', (self getLastName).
        secondLine := 'weekly salary: ', ((weeklySalary asFloat) asScaledDecimal:2) asString.
        thirdLine := 'earned: $', earning.
        firstLine displayNl.
        secondLine displayNl.
        thirdLine displayNl.
        '' displayNl
    ]



]
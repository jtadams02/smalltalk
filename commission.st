Employee subclass: Commission [ 
    |minimumSalary commissionRate sales|
    <comment:'This is the Commissiom Employee class'>
    init: fn lname: ln minimumSal: msal comRate: rate sales: s[
        <category:'Initialization'>
        super init: fn lname: ln.
        minimumSalary := msal.
        commissionRate := rate.
        sales := s.
    ]
    getEarning [
        |comission final|
        comission := (sales * commissionRate).
        (minimumSalary > comission)
            ifTrue: [
                final := minimumSalary
            ]
            ifFalse: [
                final := comission
            ].
        ^final
    ]
    getInfo [
        | firstLine secondLine thirdLine earning |
        <category:'Everything'>
        earning := (((self getEarning) asFloat) asScaledDecimal:2) asString.
        firstLine := 'Commission employee:', ' ', (self getFirstName), ' ', (self getLastName).
        secondLine := 'minimum salary: ', ((minimumSalary asFloat) asScaledDecimal:2) asString, ', sales amount: ', ((sales asFloat) asScaledDecimal:2) asString, ', commission rate: ', (((commissionRate * 100) asFloat) asScaledDecimal:2) asString , '%'.
        thirdLine := 'earned: $', earning.
        firstLine displayNl.
        secondLine displayNl.
        thirdLine displayNl.
        '' displayNl
    ]



]
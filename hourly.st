Employee subclass: Hourly [ 
    |hours pay|
    <comment:'This is the Salaried Employee class'>
    init: fn lname: ln pay: p hours: h[
        <category:'Initialization'>
        super init: fn lname: ln.
        hours := h asNumber.
        pay := p asNumber.
    ]
    getEarning [
        | final offset|
        <category:'Calculates the weekly earning'>
        (hours > 40)
            ifTrue: [
                (hours > 50)
                    ifTrue: [
                        final := (pay*40.0).
                        final := final + (pay asNumber * 10 * 1.5).
                        final := final + (pay asNumber * (hours asNumber -50) * 2.0).
                    ]
                    ifFalse: [
                        final := (pay*40.0).
                        final := final + (pay asNumber * (hours asNumber -40)*1.5).
                    ].
            ]
            ifFalse: [
                final := (pay asNumber * hours).
            ].
        ^final
    ]

    getPay [
        ^pay
    ]

    getHours [
        ^hours
    ]

    getInfo [
        | firstLine secondLine thirdLine earning |
        <category:'Everything'>
        earning := (((self getEarning) asFloat) asScaledDecimal:2) asString.
        firstLine := 'Hourly employee:', ' ', (self getFirstName), ' ', (self getLastName).
        secondLine := 'hours worked:', ' ', ((hours) asFloat) asString, ', hourly rate: ', (((pay) asFloat) asScaledDecimal:2) asString.
        thirdLine := 'earned: $', earning.
        firstLine displayNl.
        secondLine displayNl.
        thirdLine displayNl.
        '' displayNl

    ]



]
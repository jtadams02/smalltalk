"main.st"
"Create our Global variables"
employees := OrderedCollection new.
employeeCount := 0.

argc := Smalltalk arguments size.
filePath := ''.
fileWorks := true.

(argc = 2) 
    ifTrue: [
        "Inside the 2 arguemnt program here"
        "Setup our variables"
        filePath := Smalltalk arguments at: 1.
        action := Smalltalk arguments at: 2.

        "Determine if we can open the file"
        file := FileStream open: filePath mode: #read.

        b := file nextLine.
        [file atEnd] whileFalse:
            [
                substrs := b subStrings.
                employeeCount := employeeCount + 1.
                ((substrs at: 1) = 'hourly')
                    ifTrue: [
                        employees add: (Hourly new init: (substrs at: 2) lname: (substrs at: 3) pay: (substrs at: 5) asNumber hours: (substrs at: 4) asNumber).
                    ] ifFalse: [
                        ((substrs at: 1) = 'commission')
                            ifTrue: [
                                employees add: (Commission new init: (substrs at: 2) lname: (substrs at: 3) minimumSal: (substrs at: 4) asNumber comRate: (substrs at: 6) asNumber sales: (substrs at: 5) asNumber).
                            ] ifFalse: [
                                "Has to be hourly"
                                employees add: (Salaried new init: (substrs at: 2) lname: (substrs at: 3) salary: (substrs at:4 ) asNumber )
                            ]
                    ].
                b := file nextLine.
            ].
        (action='print')
            ifTrue:[
                employees do: [:employee | employee getInfo].
            ].
        (action='total')
            ifTrue:[
                t2 := 0.
                employees do: [:employee | t2 := t2 + (employee getEarning) ].
                out := 'Total payment is $', (((t2 asFloat) asScaledDecimal:2) asString).
                out displayNl.
            ].
        (action='count')
            ifTrue: [
                out := 'There are ', employeeCount asString, ' employees'.
                out displayNl.
            ].
        (action='min')
            ifTrue: [
                min := 99999999.
                minEmp := Employee new init: 'TEMP' lname: 'TEMP'.
                employees do: [:employee | t := employee getEarning. (t < min) ifTrue:[min := t. minEmp := employee].].
                minEmp getInfo.
            ].
        (action='max')
            ifTrue: [
                max := -1.
                maxEmp := Employee new init: 'TEMP' lname: 'TEMP'.
                employees do: [:employee | t := employee getEarning. (t > max) ifTrue:[max := t. maxEmp := employee].].
                maxEmp getInfo.
            ].
        (action='avg')
            ifTrue:[
                t2 := 0.
                employees do: [:employee | t2 := t2 + (employee getEarning) ].
                out := 'Average payment per employee is $', (((t2 / employeeCount) asFloat)asScaledDecimal:2) asString.
                out displayNl.
            ].
    ] ifFalse: [
        (argc=4) 
            ifTrue: [
                'crash' displayNl.

            ]
            ifFalse: [
            "Terminate program"
            'Usage: gst employee.st salaried.st hourly.st commission.st -f main.st datafile action' displayNl.
            'or' displayNl.
            'Usage: gst employee.st salaried.st hourly.st commission.st -f main.st datafile action operator threshold' displayNl.
            '' displayNl.
            'Valid actions: count print min max total avg' displayNl.
            'Valid operators: eq ne gt ge lt le' displayNl.].
    ].


" sal := Salaried new init: 'JT' lname:'Adams' salary: ('1000' asNumber).
sal getInfo.

hr := Hourly new init: 'TJ' lname:'Triggered' pay: ('1' asNumber) hours: ('55' asNumber).
hr getInfo.

cm := Commission new init: 'Rose' lname: 'Harvey' minimumSal: ('300.0' asNumber) comRate: ('0.15' asNumber) sales: ('15000.00' asNumber).
cm getInfo  "
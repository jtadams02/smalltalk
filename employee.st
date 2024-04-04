"This class will hold the code to setup the generic class Employee"
Object subclass: Employee [
    | firstname lastname |
    <comment: 'This is the default employee class'>
    "Initalize"
    init: fn lname: ln [
        <category: 'initialization'>
        firstname := fn.
        lastname := ln.
    ]

    getFirstName [
        <category:'getter'>
        ^firstname
    ]

    getLastName [
        <category:'getter'>
        ^lastname
    ]

    setFirstName: name [
        <category:'setter'>
        firstname := name.
    ]

    setLastName: name [
        <category:'setter'>
        lastname := name.
    ]

    getInfo [
        |final space|
        <category:'Everything'>
        space := ' '.
        final := (self getFirstName), space, (self getLastName).
        ^final
    ]

]
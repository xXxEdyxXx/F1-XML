<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f1="http://FormulaTeamsStua05.com/F1">
    <ns prefix="f1" uri="http://FormulaTeamsStua05.com/F1"/>

    
    <pattern id="CheckTeamDriversCount">
        <title>Check if each team has two drivers</title>
        <rule context="f1:Team">
            <assert test="count(f1:Drivers/f1:Driver) = 2">Each team must have exactly two drivers.</assert>
        </rule>
    </pattern>
    
    <pattern id="PrincipalDirector">
        <title>Check if technical director and team principal is not the same person</title>
        <rule context="f1:Team">
            <assert test="not(f1:TechnicalDirector/f1:LastName = f1:TeamPrincipal/f1:LastName and f1:TechnicalDirector/f1:FirstName = f1:TeamPrincipal/f1:FirstName)">Technical director and team principal cannot be the same person</assert>
        </rule>
    </pattern>
    
    <pattern id="CheckDriverAge">
        <title>Check if the driver is over 18 years old</title>
        <rule context="f1:Driver">
            <let name="CurrentYear" value="xs:integer(substring(xs:string(current-date()), 1, 4))"/>
            <let name="BirthYear" value="xs:integer(f1:DateOfBirth)"/>
            <assert test="$CurrentYear - $BirthYear >= 18">Driver must be over 18 years old.</assert>
        </rule>
    </pattern>
    

    
</schema>

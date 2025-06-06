#!/usr/bin/ruby

# modgen.rb

# Top Level test/demo

#   require 'yaml'
require 'erb'
#   
require './genericFunctions.rb'
#   require './extendString.rb'
require './customFile.rb'
#   require './csvFile.rb'
#   require './font.rb'
#   require './diagram.rb'
#   require './bitmap.rb'
#   require './bitmapFunctions.rb'
#   require './registerYamlFile.rb'
#   require './universalConstructor.rb'
#   require './binaryFile.rb'
#   require './svgImage.rb'


# SPECIFIC FOR REGISTER MAP OF PROJECT ( YAML )
#require './careAbouts.rb'


BEGIN { print "\nINFO: Start of ",$PROGRAM_NAME }

    moduleName = parseArguments
    
    print "\nINFO: moduleName = ",moduleName
    
    outputFileName = moduleName + ".scad"
    
    print "\nINFO: outputFileName = ",outputFileName
    
    outputFile = CustomFile.new(outputFileName,"OpenSCAD module block")
    
    outputFile.create
    
    

           
    template = ERB.new %q{
    
module <%=moduleName%>A()\{

    translate([0,0,0]) cube([30,40,50]); // dummy shape

\}


module <%=moduleName%>()\{

    difference()\{
    
        <%=moduleName%>A();
        
        translate([5,5,5]) cube([20,30,50]); // dummy shape
        
    \}

\}


<%=moduleName%>A();

}



            
    outputString = template.result(binding)

    
    outputFile.append(outputString)


END { print "\nINFO: End of ",$PROGRAM_NAME,"\n\n" }












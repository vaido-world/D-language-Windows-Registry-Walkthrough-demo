// To launch this example use:
// rdmd registry_example.d
// dmd -run registry_example.d

import std.stdio; 
import std.windows.registry;


void main(){

	// To generate D documentation from std.windows.registry:
	// dmd -lib -D "C:\D\dmd2\src\phobos\std\windows\registry.d"



	// The Key constructor is not made for use. (The constuctor is a private class)
	// example.d(8): Error: class `std.windows.registry.Key` constructor `this` is not accessible
	//
	// import core.sys.windows.winreg;
	// Key addAwesomeKey = new Key(HKEY_CURRENT_USER, "SomeAwesomeKeyName", true); //Not made to use this way
	
	
	
	// New GitHub Repository: D-Language-Resources
    //auto class_members = [__traits(derivedMembers, Registry)];
    // writeln(class_members); 
	
	
	
	writeln("Windows Registry Hives supported by D std.windows.registry: ");
	foreach (class_member; __traits(derivedMembers, Registry))
       // writeln(typeid(typeof(t)));
	   if (class_member[0] != '_'){
			writeln("* " ~ class_member);
	   }
       writeln();
	   
	writeln("Windows Registry Value Types supported by D std.windows.registry: ");
	foreach (class_member; __traits(derivedMembers, REG_VALUE_TYPE))
       // writeln(typeid(typeof(t)));
	   if (class_member[0] != '_'){
			writeln("* " ~ class_member);
	   }
       writeln();

	
	writeln("A Walkthrough of Windows Registry");
	writeln("Since there were no documentation, I though that a 
quick walkthrough might help out once in a while.");
	
	writeln("");
	writeln("[1.Listing Registry Hives of the Windows Registry]");
	writeln("To do anything, the first step is selecting a key.");
	writeln("Here is a list of standard keys existing in Windows Registry:\n");
	writeln("________Main__________");
	writeln( Registry.classesRoot().name  );
	writeln( Registry.currentUser().name  );
	writeln( Registry.localMachine().name );
	writeln( Registry.users().name        );
	
	writeln("_______Other__________");
	
	writeln(Registry.performanceData().name);
	writeln(Registry.currentConfig().name);
	writeln(Registry.dynData().name);
	
	writeln();
	writeln(" The Main Keys are predefined and did not change through Windows operating system history.");
	writeln(" Protip: All the listed keys above are known as Windows Registry Hives.");
	writeln(" Note: The Windows Registry Hives are simply predefined macros in the win32 platform and do not belong to an array.");
	writeln(" They are like immutable variables that were set long time ago by Windows Developers and never changed, even today.");
	writeln(" New Registry Hives were almost never added even after all these decades since Windows Registry became a thing.");
		
	writeln("");
	writeln("[2 Selecting a key in the Windows Registry]");
	
	writeln("Now selecting the Keys is simple. Choose one of the Windows Hives mentioned before 
	and use .getKey method of the Key class to get to the subkey that exist. ");
	write("Example: ");
	writeln(Registry.localMachine().getKey("System\\CurrentControlSet\\Control\\Session Manager\\Environment").name);
	writeln(Registry.localMachine().getKey("System\\CurrentControlSet\\Control\\Session Manager\\Environment").getValue("Path").type);
	writeln(Registry.localMachine().getKey("System\\CurrentControlSet\\Control\\Session Manager\\Environment").getValue("Path").value_SZ);
	
	Key environment = Registry.localMachine().getKey("System\\CurrentControlSet\\Control\\Session Manager\\Environment");
	Value path = environment.getValue("Path");
	
	writeln("---------------");
	//writeln(path.type);
	
	// Implement Final with all the Reg values or:
	// Remove the final attribute and add Default: for the switch  	 default: writeln("None has matched");
	 final switch (path.type){
	 
		case REG_VALUE_TYPE.REG_SZ: 
			writeln(path.value_SZ); 
			break;
			
		case REG_VALUE_TYPE.REG_EXPAND_SZ: 
			writeln(path.value_SZ); 
			break;
			

	}
	writeln("---------------");

	


	
	
	writeln("..");
	//writeln("Now it is possible to do some manipulation on the Windows Registry Hives ");

	writeln("");
	writeln("[3.Opening a subkey]");

	
	
	writeln("---------------");
	
	writeln(Registry.localMachine().name);
	writeln(Registry.localMachine().getKey("System\\CurrentControlSet\\Control\\Session Manager\\Environment").name);
	writeln(Registry.localMachine().getKey("System").keyCount);
	writeln(Registry.localMachine().getKey("System").valueCount);
	writeln(Registry.localMachine().getKey("System\\CurrentControlSet\\Control\\Session Manager\\Environment").valueCount);
	write(Registry.localMachine().getKey("System\\CurrentControlSet\\Control\\Session Manager\\Environment").getValue("Path").value_EXPAND_SZ);
	
	
	
	write("sdf");
}

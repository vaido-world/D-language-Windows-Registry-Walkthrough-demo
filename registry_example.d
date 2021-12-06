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

	writeln("");
	writeln("[2 Selecting a key in the Windows Registry]");
	writeln("..");
	writeln("Now it is possible to do some manipulation on the Windows Registry Hives ");

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
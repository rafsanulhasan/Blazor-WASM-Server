# Blazor: Easily switch between client side and server side execution


Blazor as part of ASP.Net Core 3.0 will be shipping in approximately a month. As a generally available release Blazor is supported with server side execution. Even though client side execution is possible, it will remain in a preview state for at least the remainder of the year. Even if the intent for your project is to target server side there are some useful aspects to host your project in wasm on the client. Notably, the ability to use the browser development tools to understand just what your carefully crafted css is actually doing is priceless.



The source code for this project is available on GitHub. This post will just highlight the key aspects of making the switch easy.


## Solution configurations


There are four configurations in the solution. Using the Visual Studio configuration manager you can choose between debug and release and also between client side &amp; server side execution. The key differences in each configuration is the definition of either ClientSideExecution or ServerSideExecution and DEBUG or RELEASE defined constants.



## Solution projects</h3>



The names of the projects may seem a bit odd; Just understand that this project was pared down from a very large project 'in progress' and in the large project the names make sense. The solution is architected in an MVVM style. Most of what appears in the demo project is simply the view components.



##### GeneralComponents



This project is a Net Standard 2.0 Razor Class Library which implemen the UI and backing logic. GeneralComponents contains the usual Blazor suspects of MainLayout.razor, NavMenu.razor, and the _Imports.razor files as well as other useful components. This project does not change with the server or client side execution.



##### Optimiser.Blazor



This project is a Net Standard 2.0 Blazor client app defined by program.cs &amp; startup.cs with the packages of "Microsoft.AspNetCore.Blazor" and "Microsoft.AspNetCore.Blazor.Build". It is only invoked for a client side execution, it is totally ignored for server side execution.



##### Optimiser.Web



This project is an ASP.Net Core 3.0 server. It uses the defined constants to determine if it is going to host the Blazor project on the server or to simply act as a launch pad for the client side assets. In real life the server presents a REST api for use by the client in either mode. The key to the switch is in startup.cs where the methods Startup and Configure are customized via the defined constants.
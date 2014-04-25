ShinobiEssentials: Customising the Pull to Action (Objective-C)
=====================

A ShinobiEssentials demo app showing how to customise the ShinobiEssentials Pull to Action control. 

![Screenshot](Screenshot.png?raw=true)

There's a [blog post](http://www.shinobicontrols.com/blog) to accompany this project.

Building the project
------------------

In order to build this project you'll need a copy of ShinobiEssentials (at least version 2.6.0). If you don't have it yet, you can download a free trial from the [ShinobiEssentials website](http://www.shinobicontrols.com/shinobiessentials/price-plans/shinobiessentials/shinobiessentials-trial-form/).

Once you've downloaded and unzipped ShinobiEssentials, open up the project in Xcode, and drag ShinobiEssentials.embeddedframework from the finder into Xcode's 'frameworks' group, and Xcode will sort out all the header and linker paths for you.

If you’re using the trial version you’ll need to add your license key. To do so, open up BooksShelfAppDelegate.m, import <ShinobiEssentials/SEssentials.h>, and set the license key inside application:didFinishLaunchingWithOptions: as follows:

    #import <ShinobiEssentials/SEssentials.h>

    @implementation BookShelfAppDelegate

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {
        [SEssentials setLicenseKey:@"your license key"];
        …
    }

Contributing
------------

We'd love to see your contributions to this project - please go ahead and fork it and send us a pull request when you're done! Or if you have a new project you think we should include here, email info@shinobicontrols.com to tell us about it.

License
-------

The [Apache License, Version 2.0](license.txt) applies to everything in this repository, and will apply to any user contributions.

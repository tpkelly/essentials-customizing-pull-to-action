ShinobiEssentials: Customizing the Pull to Action (Objective-C)
=====================

A ShinobiEssentials demo app showing how to customize the ShinobiEssentials Pull to Action control. 

![Screenshot](Screenshot.png?raw=true)

There's a [blog post](http://www.shinobicontrols.com/blog/posts/2014/04/30/customizing-the-pull-to-action) to accompany this project.

Building the project
------------------

In order to build this project you'll need a copy of ShinobiEssentials (at least version 2.6.0). If you don't have it yet, you can download a free trial from the [ShinobiEssentials website](http://www.shinobicontrols.com/shinobiessentials/price-plans/shinobiessentials/shinobiessentials-trial-form/).

If you've used the installer to install ShinobiEssentials, the project should just work. If you haven't, then once you've downloaded and unzipped ShinobiEssentials, open up the project in Xcode, and drag ShinobiEssentials.embeddedframework from the finder into Xcode's 'frameworks' group, and Xcode will sort out all the header and linker paths for you.

If you’re using the trial version you’ll need to add your license key. To do so, open up AppDelegate.m, import <ShinobiEssentials/SEssentials.h>, and set the license key inside application:didFinishLaunchingWithOptions: as follows:

    #import <ShinobiEssentials/SEssentials.h>

    @implementation AppDelegate

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

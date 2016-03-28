BUILDING NOTES FOR BLOG POSTING ABOUT USING RSPEC

The following is the first posting in a series of posts where I will dive into RSpec, starting with the basics and working our way forward.  I've found many of blog postings, articles and other sources that I felt assumed that I already knew RSpec.  I felt that I was missing something - the basics.

I've decided to not jump right in and create a Rails project.  I want to start from scratch.  To assist us on our journey, we will be building robots.  Let's get started.  Navigate to a directory where you like to create your project.  Then create a directory and some core files as indicated below:

```
➜  RoR mkdir robot_testing
➜  RoR cd robot_testing
➜  robot_testing touch Gemfile
➜  robot_testing touch .ruby-version
```


Edit the .ruby-version file to include the following:
```
2.3.0
```

You can substite the above with your preferred version of ruby, but for this example, we will be using 2.3.0


```
➜  robot_testing cd ..
➜  RoR
➜  RoR cd robot_testing
➜  robot_testing ruby -v
ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin14]
➜  robot_testing ls -la
total 16
drwxr-xr-x   4 jfhogarty  staff   136 Mar 28 09:31 .
drwxr-xr-x  60 jfhogarty  staff  2040 Mar 28 09:29 ..
-rw-r--r--   1 jfhogarty  staff     6 Mar 28 09:31 .ruby-version
-rw-r--r--   1 jfhogarty  staff    56 Mar 28 09:31 Gemfile
➜  robot_testing
```


Edit the Gemfile to include the following:
```
source 'https://rubygems.org'

gem 'rspec', '~> 3.4.0'
```

If you are starting with a fresh version of Ruby, you may need to install the bundler gem before trying to run bundle.

```
➜  robot_testing gem install bundle
Fetching: bundler-1.11.2.gem (100%)
Successfully installed bundler-1.11.2
Fetching: bundle-0.0.1.gem (100%)
Successfully installed bundle-0.0.1
2 gems installed
➜  robot_testing
```

Now you should be able to run bundle to get rspec and its' dependencies installed:

```
➜  robot_testing bundle
Fetching gem metadata from https://rubygems.org/...........
Fetching version metadata from https://rubygems.org/..
Resolving dependencies...
Installing diff-lcs 1.2.5
Installing rspec-support 3.4.1
Using bundler 1.11.2
Installing rspec-core 3.4.4
Installing rspec-expectations 3.4.0
Installing rspec-mocks 3.4.1
Installing rspec 3.4.0
Bundle complete! 1 Gemfile dependency, 7 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
➜  robot_testing
```


We are almost done with our basic setup.  Next we will run the following command to build our basic structure:

```
➜  robot_testing rspec --init
  create   .rspec
  create   spec/spec_helper.rb
➜  robot_testing
```

I like to add the following configuration setting to my .rspec files:
```
--format documentation
```

You can run rspec -h to see the other options.  I find it helpful to include the format documentation setting so I get more descriptive output when running my tests.

At this point, we can now try out RSpec and make sure things are working:
```
➜  robot_testing rspec
No examples found.

Finished in 0.00025 seconds (files took 0.0937 seconds to load)
0 examples, 0 failures

➜  robot_testing
```

Time to write our first test.  As the directory name hints at, we will be using robots as our theme.  First we will create a spec file to compose our test in:
```
touch spec/robot_spec.rb
```

Next, we will edit that file and include the following:
```
describe "A robot double" do
  it "returns canned response from the methods named in the provided hash" do
    tobor = double("A Robot", :name => 'six_of_nine', :model => 'asiv_mark_two')
    expect(tobor.name).to eq('six_of_nine')
    expect(tobor.model).to eq('asiv_mark_two')
  end
end
```

Ok, time for a quick review.  If you have been following along and completed each step, you should see a directory structure like the one below:
```
➜  robot_testing tree
.
├── Gemfile
├── Gemfile.lock
├── README.md
└── spec
    ├── robot_spec.rb
    └── spec_helper.rb

1 directory, 5 files
➜  robot_testing

```

Let's run rspec again and then we can discuss what we added to the robot_spec.rb file:
```
➜  robot_testing rspec

A robot double
  returns canned response from the methods named in the provided hash

Finished in 0.00086 seconds (files took 0.08194 seconds to load)
1 example, 0 failures

➜  robot_testing
```

NOTE:  This is what you would see had you not added the --format documentation flag:
```
➜  robot_testing rspec
.

Finished in 0.0008 seconds (files took 0.07866 seconds to load)
1 example, 0 failures

➜  robot_testing
```

To wrap up this initial posting, let's take a look at that test:
```
describe "A robot double" do
  it "returns canned response from the methods named in the provided hash" do
    tobor = double("A Robot", :name => 'six_of_nine', :model => 'asiv_mark_two')
    expect(tobor.name).to eq('six_of_nine')
    expect(tobor.model).to eq('asiv_mark_two')
  end
end
```

We first start with describe and then a string that describes our test.  In our example we are creating a double.  Next we use it with a string to describe the expected behavior.  As seen above, we are expecting a response
from the methods name and model.

Inside the it block we do our setup and expectations.  We use the built-in double method from RSpec to create "A Robot" as well as two methods, name and model.  We define the values for those methods - six_of_nine and asiv_mark_two respectfully.

The newly created "double" is assigned to the variable tobor.  Get it?  Lastly, we setup our expectations.  We expect that when we call the name and model methods on the tobor object then we will get the responses of six_of_nine and asiv_mark_two.

This wraps up our first installment.  Next time we will drive out and build a robot class.

Learn Something New Everyday


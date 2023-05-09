I typed this up for a friend that was really confused about what a lot of programming buzzwords were in the hopes that it could function as a sort of guide 'em akin to towns/hubs in an open-world video game.

Something to know is that, with any layer of abstraction, we lose some semblance of fine-grained control. It is a necessary sacrifice to get some things done in a meaningful way in an efficient manner.

It's similar to how a cook *could* meticulously break every single vegetable by hand, feeling each individual fiber bend and snap, but there is little need to do so unless they intend to modify something fundamental about the process that does not yet have tools built for it. Here, the "abstraction" would be a kitchen knife. It is an abstraction for the process of cutting, which would otherwise require *significant* amounts of effort.

In terms of programming, abstraction does have a drawback - and that is usually the speed at which a program is able to execute *if it is optimized as best as it can be*. As languages become more abstracted, it is up to the previous "level" of abstraction to supply ways to be as fast as possible - and with endless developments in different varieties of processing power, chip speed, featureset, etc, it is often simply not worth it unless someone is a hobbyist who wishes to experiment and learn *or* needs something to be blazingly fast specifically for their job.

So it starts here, and ends at the bottom. The top here is, ironically, the lowest level, getting higher as we go down. It is meant to explain the progression in a way that feels natural - so here goes!

- *STARTING WITH HARDWARE*
- raw data
	- is modified by
- electrical signals 
	- which are controlled by 
- logic gates
	- the larger of which are abstracted by various
- chips
	- *ENTERING SOFTWARE*
	- which use 1s and 0s set by standards according to the chip manufacturer in the form of
- assembly instructions
	- which are made easier to write by
- preprocessors of various kinds
	- which come in the form of
- lower level languages, such as C, Fortran
	- the bits and bytes of which come in standard forms of interpretation defined as
		- types
			- int
			- char
			- byte
			- short
			- long
			- double
			- float
			- etc
	- these languages can also be abstracted with those that build upon them
-  C++ is an abstraction of C, the compiler of which effectively forms its own standardized way to lay out classes in memory
	- but even writing this can be cumbersome, so
- we use preprocessor elements, such as the introduction of `template`
	- but some people don't want to deal with the nitty gritty like "types" or "memory management" and just expect their stuff to work, so we have
- scripting languages, and Domain-Specific Languages (DSLs)
	- Scripting languages can be thought of as instructions/commands for virtual machines.
		- these virtual machines *really are* similar to miniature CPUs you create using a similar sort of logical structure that engineers use when developing hardware CPUs, such as ways to store and retrieve data, keep track of what instruction they're on, and so forth depending on the needs of said scripting language.
	- DSLs are more specific
		- these are closer to a direct list or "standard" of instructions that are optimized for a specific use case with it being harder to make something that's more generalized. Sometimes features are cut just because it would be cumbersome to use them and are considered redundant to consider in the use case it is designed for
	- regardless, no CPU truly knows how to directly interpret a scripting language or DSL because they don't get translated to the assembly without help from a language that *does*, hence why they're considered a "higher level." They are *interpreted* by whatever language the *interpreter* is written in - oftentimes one of the lower level languages
		- this is why it's important to try and see if there are any "standard library" functions available to the higher level scripting language from the lower level language, espeically when trying to optimize for speed rather than ease of writing said logic. 
			- JIT (Just In Time) compilation is a technique where the lower level language observes what the scripting language is doing at certain points, and attempts to compile them down into assembly directly. This *does* help, but it can still take time for the JIT compiler process to know that it's sure it can do that, thus slowing things down at first.
- Scripting languages are almost the highest from a vocabulary of "high level," but sometimes writing code can be repetitive. 
	- this can be automated with
- preprocessors and things that *generate* code in a different language that said different language can then interpret or compile. These are called *transpilers*.
	- some examples of these are `babel` in javascript, which tries to add in missing features with javascript "polyfills" for web browsers that are old and don't otherwise support a feature (because some fundamental things *do* need to be in the C/C++/Rust interpreter for said scripting languages for them to work
	- sometimes these scripting languages allow for someone to be very messy and disorganized with their code, making it hard to read and modify later - thus along comes, in a *relatively* recent venture:
	- some type systems for scripting languages. These are often used by *the code editor itself* in the form of *metadata*
		- metadata is data that is not directly related to the execution of code itself, but can be used by tools to do various things
	- this metadata can do things like provide autocompletion support, or help you document code with tools
	- but learning to code is hard
- so along comes AI generation
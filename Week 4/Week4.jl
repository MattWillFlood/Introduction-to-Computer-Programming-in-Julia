### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 1cd6f911-7cca-4e14-9a0e-0885902df8d1
using Dates, Statistics, Plots

# ╔═╡ 2b77c301-778a-4e7d-b176-194362ebec5e
begin     
	import DarkMode
    DarkMode.enable()
    # OR DarkMode.Toolbox(theme="default")
end 

# ╔═╡ 1f0fa82f-fae6-4887-905a-7f0e7faa3e93
plotly()

# ╔═╡ 487fc300-e3a2-40ed-aa37-d19ae5ab96f7
md""" #### Let's start by looking at the methods of some funky functions"""

# ╔═╡ d64b24bf-34ca-4f36-8ab4-ed41b4f1d503
methods(chomp) # Here we seee that chomp has two methods
# Both methods are ways of removing a trailing newline from a string

# ╔═╡ c14d4afc-1473-4e1e-ac37-ef0277877843
methods(sum)
#= You can see and understand why the sum() function has a lot more methods.
The sum function can be applied to various collection and object types.
For each type of object passed to sum(), it must have a method to deal with it =#

# ╔═╡ d2854616-0a18-4206-bebb-db0d813d223e
+(11,46,25,23,3,64,34,32,44)

# ╔═╡ 8a294070-022e-4557-8529-cdb513806b79
methods(rand)

# ╔═╡ 3379a14c-ae9b-4d18-8552-ef38652ff65f
begin
	a = rand()
	println(a)
	
	b = rand(1)
	println(b)
	
	c = rand(5)
	println(c)
	
	d = rand(200:230)
	println(d)
	
	e = rand(333:4:999,9)
	println(e)
	
	f = rand("The quick brown fox jumps over the lazy dog", 9)
	println(f)
	
end

# ╔═╡ 3500e107-8d92-45bb-88a9-0893cfd1d20a
floor(pi)

# ╔═╡ f29bbca3-97db-45fe-905d-8eee56c66e15
begin
	some_randies = rand(7)*100
	floor_randies = floor.(some_randies)
end

# ╔═╡ 3ec62a36-45eb-49b5-b453-c2fa3125b137
some_randies

# ╔═╡ 5c734298-2c6f-444e-b906-05e50a554fcf
Duke_Bday = DateTime(1955, 4, 16, 16, 4, 55, 35)

# ╔═╡ 7c3ae9d3-482e-4ca9-a267-e2471f9beec3
# The typeof function tells you the type of object you are using.
# Here it is a DateTime object from the Dates package.
typeof(Duke_Bday)

# ╔═╡ 9b6bd558-5217-4e42-82a4-407d4c355aca
floor(Duke_Bday, Dates.Hour)
#= When using Date objects, we need to provide 2 input arguments.
1. the object to be floored
2. the precision of the 'flooring', i.e. the nearest day/month/year/hour, etc. =#

# ╔═╡ dc526d28-126d-43fb-bbab-52583a4065cd
floor(Duke_Bday, Dates.Year) 
#= Notice here that when you use a DateTime object, floor has two required arguments
 The first is the date/time to be 'floored', and the second is the precision of flooring =#

# ╔═╡ 3f1e5da7-49a2-41bf-9941-daaa79ed5436
ceil(Duke_Bday, Dates.Month)

# ╔═╡ 1c51ee9d-6539-4d77-92a3-e746159c7940
md""" #### Let's start writing some funky functions"""

# ╔═╡ 7679cb94-d070-400a-8e3d-552b23c1ca2b
RadiusEquations(r) = 4*pi*(r^2), 2*pi*r, (4/3)*pi*(r^3)


# ╔═╡ 1f7a5ea5-bea1-40ee-a6c0-e304391893c4
area, circ, volume = RadiusEquations(3.8)

# ╔═╡ 74108ce5-d338-4b2e-ab82-eed6f6662851
circ

# ╔═╡ 37fe188e-ba7e-460b-935b-8fe4260514c9
# This funcion answers the user based on their age.

function How_Old(Age)
	if Age < 20
		println("TikTok! TikTok TikTok TikTok TikTok...  👶")
	elseif Age < 40
		println("If I buy an Ipad, can I pay rent this month? 😢")
	elseif Age < 60
		println("Apparently Sandra next door lets her children use TikTok 😐")
	else
		println("How can I TikTok my Ipad? 👵👴")
	end
end		

# ╔═╡ 279ad946-71a8-47a7-ab7a-3fc49a14d64d
How_Old("37")

# ╔═╡ f605f994-0e0e-4986-b996-128a322b3c42
# Here, we will specify that the input 'Age' must be an integer.

function How_Old_Again(Age::Int)
	if Age < 20
		println("TikTok! TikTok TikTok TikTok TikTok...  👶")
	elseif Age < 40
		println("If I buy an Ipad, can I pay rent this month? 😢")
	elseif Age < 60
		println("Apparently Sandra next door lets her children use TikTok 😐")
	else
		println("How can I TikTok my Ipad? 👵👴")
	end
end		

# ╔═╡ 2c8c9df5-92f3-47e0-852b-21fd0b190244
How_Old_Again(44.4)
# This error let's the user know that the'closest version' of the function uses an integer input.

# ╔═╡ a394e3c2-ecbe-4de7-a5f8-f04112c3cbd2
How_Old_Again(44)

# ╔═╡ 671c4153-78af-4155-9184-ca8ac6e35ad2
# Creat a function to returns the roots of a quadratic equation
# x = -b ± √b² - 4ac / 2a

function Roots(a, b, c)
	
	root1 = (-b + sqrt((b^2) - 4*a*c)) / (2*a)
	root2 = (-b - sqrt((b^2) - 4*a*c)) / (2*a)
		
	return root1, root2
end

# If we didn't include the return of root 1 and root 2, only root 2 would be passed to the user because it was the last  variable created in the function.

# ╔═╡ 6b8da1ae-3ab7-456a-bcb4-44b1f1cb38f0
# So if we have a quadratic equation:
#  13x² + 7x - 2.4

roots = Roots(13, 7, -2.4)

# ╔═╡ a19f457c-c005-4827-afaf-ffb93c0f6297
#= Let's write a function that takes another function as an argument

In this example, we create a function that will normalise a sequence of numbers.
We can pass many types of functions such as std(), var(), mean(), sum(), etc.
=#

function Normalise(Data, Le_Funk)
	
	return Data./Le_Funk(Data)
	
end
	

# ╔═╡ cebaef4b-6fb9-42d2-b92e-f7c65ed95a75
begin
	X = rand(1:22, 100)
	Norm_X = Normalise(X, std)
	#NOTE: Do not use ( and ) when passing a function to another function.
	plot(X)
	plot!(Norm_X)
end

# ╔═╡ 7870d752-cd1f-4b34-8ca7-772b5955d6bc
?s

# ╔═╡ 8341198f-124c-409d-b1ad-c8ab65062fdc
begin
	Norm_X_Again = Normalise(X, mean)
	plot!(Norm_X_Again)
end

# ╔═╡ d7698573-a978-46ab-b452-2410866b8e64
Normalise(rand(100), 5)	# Someone might want to normalise by dividing by 5, but....

# ╔═╡ 3ee0956d-4af6-47b4-bb89-6e2a08d27a7c
function Re_Normalise(Data, Le_Funk::Function)
	
	return Data./Le_Funk(Data)
	
end

# ╔═╡ 59ae2104-d7b6-4a6c-98d4-29b27089e862
Re_Normalise(rand(100), 5)		
# This tells the user that the second argument must be a function

# ╔═╡ c7c2a3bb-2573-458a-b5a7-b3139d2f9015
# After your required arguments, place a semicolon to separate required and keyword arguments.

function CarTax(price, age; enginesize::Float64=2.4)
		
	rate = (price/pi)^(age/10)
	taxcost = rate * enginesize * 0.8
	 
	return  taxcost
end
 

# ╔═╡ fba5ab51-f2eb-4910-bd8d-ec6f29e147bc
CarTax(30000, 3)

# ╔═╡ 8c7c17a1-9d0d-4c3a-9c6f-34af887eb4f0
CarTax(30000, 3, enginesize=1.6)

# ╔═╡ 1baf09d6-a1e4-4582-8a33-c48e57d7f2a6
CarTax(30000, enginesize= 3, 1.6)

# ╔═╡ 895bf114-bde7-4a26-867d-c3c762552b33
function MaxDose💊(Age::Real; SleepyTime::Float64 = 5.0, Allergy::Bool = false)
	
	if Allergy
		println("Don't give them drugs if they have allergies!")
	else
		Prescribe = Age/(SleepyTime + 1)^2
		return Prescribe
	end
		
end

# ╔═╡ ecab2739-c2e5-4244-9734-d6c4348ea903
MaxDose💊(76)

# ╔═╡ 4d88cba1-1ad0-47c1-a58f-0aa1793a41cf
MaxDose💊(33, Allergy=false, SleepyTime=3.0)

# ╔═╡ ab143edb-8df2-4967-9c75-749674fd393c
md""" #### Composing composite types 😝

We'll start by creating a composite type for a subject in an experiment.
The info we want included - Name, Age, Height, Weight, Phone number, Group, etc.

"""

# ╔═╡ a5646478-3733-42a7-9fb3-f993bef197da
struct Study_Subject
	Name::String
	Age::Int64
	Height::Float64
	Weight::Float64
	☎::String
	Group::Char
end

# ╔═╡ c8c226ab-0956-4205-9be7-9863fb76186f
Subject_72 = Study_Subject("Jimmy McGee", 88, 1.62, 72.11, "+352 7237914972", 'A')

# ╔═╡ 51fb20c5-42cc-4f9e-9b28-60c0e3c506c8
typeof(Subject_72)

# ╔═╡ aaa5a02e-4472-493e-986d-5d66f07040e8
fieldnames(Study_Subject)

# ╔═╡ 8fcd9dae-edeb-4fbb-ac35-e7a1607c6bb2
Subject_72.Name

# ╔═╡ 23768c4c-287e-4fc4-9969-ca3977079755
Subject_72.☎

# ╔═╡ 84a9a8e6-b8fd-4ead-84a5-7e4f5faff3da
Subject_72.Height * Subject_72.Weight

# ╔═╡ 3a2ccfe7-0789-4021-b6c6-4d016ad0d115
Subject.Age  = 84

# ╔═╡ bf2a15b5-d261-4848-948b-34f7ca6e7e87
mutable struct Study_Contact
	Name::String
	Age::Int64
	Height::Float64
	Weight::Float64
	☎::String
	Group::Char
end

# ╔═╡ 07721d59-255e-41c6-a21b-ae16bae501ef
Contact_007 = Study_Contact("James Bond", 35, 1.82, 88.8, "unknown", '0')

# ╔═╡ 51bac541-cf8c-4c72-abd8-b6f24b2cc542
Contact_007.Age

# ╔═╡ 24e7c7f6-27c6-4096-aa12-2dcad57df24c
Contact_007.Age += 4

# ╔═╡ 5f60c4f4-de19-4f46-a2ab-ffc6ee658cf4
# This example demonstrates how we can perform operations in functions with just a struct as an input.

mutable struct kitchen
	Tiled::Bool
	Dishwasher::Bool
	Extra_Cost::Float64
	Area::Float64
	Oven_Brand::String
	Fridge_Brand::String		
end

# ╔═╡ 7c1a9f39-b5ef-4c4d-bb24-0fab95129f01
fieldnames(kitchen)

# ╔═╡ c61bdc64-7551-4fe1-a8ba-7ec36172ed12
DreamHouse = kitchen(true, false, 1000.00, 21.2, "Samsung", "Bosch")

# ╔═╡ ba8a975b-ad5f-464e-8de2-32cb2b58670f
DreamHouse.Extra_Cost = 645

# ╔═╡ 662b9ed1-c105-4c60-8438-8f7f2c20bdeb
typeof(DreamHouse)

# ╔═╡ 612cfcfc-3ca3-435e-a94b-c32b329c819d
function Decision(info::kitchen)
	
	if (info.Tiled || info.Dishwasher) && info.Area > 30
		println("Buy. It. Now!")
	elseif info.Oven_Brand == "Samsung" && info.Extra_Cost < 1000
		println("Maaaybe...")
	elseif info.Tiled && info.Fridge_Brand=="Bosch" && info.Area > 776
		println("Haggle the seller down")
	else 
		println("Dream on!")
	end	
	
end

# ╔═╡ 70c7ad91-84fd-4505-99d5-7b437304c085
Decision(DreamHouse)

# ╔═╡ 265093d1-3cf3-4bb6-aaad-d4a6b746c1e1
Decision(888)

# ╔═╡ 622355eb-56eb-42fa-99c2-6c89cdd0ea76
begin 
	DreamHouse.Area = 40
	Decision(DreamHouse)
end

# ╔═╡ Cell order:
# ╠═2b77c301-778a-4e7d-b176-194362ebec5e
# ╠═1cd6f911-7cca-4e14-9a0e-0885902df8d1
# ╠═1f0fa82f-fae6-4887-905a-7f0e7faa3e93
# ╠═487fc300-e3a2-40ed-aa37-d19ae5ab96f7
# ╠═d64b24bf-34ca-4f36-8ab4-ed41b4f1d503
# ╠═c14d4afc-1473-4e1e-ac37-ef0277877843
# ╠═d2854616-0a18-4206-bebb-db0d813d223e
# ╠═8a294070-022e-4557-8529-cdb513806b79
# ╠═3379a14c-ae9b-4d18-8552-ef38652ff65f
# ╠═3500e107-8d92-45bb-88a9-0893cfd1d20a
# ╠═f29bbca3-97db-45fe-905d-8eee56c66e15
# ╠═3ec62a36-45eb-49b5-b453-c2fa3125b137
# ╠═5c734298-2c6f-444e-b906-05e50a554fcf
# ╠═7c3ae9d3-482e-4ca9-a267-e2471f9beec3
# ╠═9b6bd558-5217-4e42-82a4-407d4c355aca
# ╠═dc526d28-126d-43fb-bbab-52583a4065cd
# ╠═3f1e5da7-49a2-41bf-9941-daaa79ed5436
# ╠═1c51ee9d-6539-4d77-92a3-e746159c7940
# ╠═7679cb94-d070-400a-8e3d-552b23c1ca2b
# ╠═1f7a5ea5-bea1-40ee-a6c0-e304391893c4
# ╠═74108ce5-d338-4b2e-ab82-eed6f6662851
# ╠═37fe188e-ba7e-460b-935b-8fe4260514c9
# ╠═279ad946-71a8-47a7-ab7a-3fc49a14d64d
# ╠═f605f994-0e0e-4986-b996-128a322b3c42
# ╠═2c8c9df5-92f3-47e0-852b-21fd0b190244
# ╠═a394e3c2-ecbe-4de7-a5f8-f04112c3cbd2
# ╠═671c4153-78af-4155-9184-ca8ac6e35ad2
# ╠═6b8da1ae-3ab7-456a-bcb4-44b1f1cb38f0
# ╠═a19f457c-c005-4827-afaf-ffb93c0f6297
# ╠═cebaef4b-6fb9-42d2-b92e-f7c65ed95a75
# ╠═7870d752-cd1f-4b34-8ca7-772b5955d6bc
# ╠═8341198f-124c-409d-b1ad-c8ab65062fdc
# ╠═d7698573-a978-46ab-b452-2410866b8e64
# ╠═3ee0956d-4af6-47b4-bb89-6e2a08d27a7c
# ╠═59ae2104-d7b6-4a6c-98d4-29b27089e862
# ╠═c7c2a3bb-2573-458a-b5a7-b3139d2f9015
# ╠═fba5ab51-f2eb-4910-bd8d-ec6f29e147bc
# ╠═8c7c17a1-9d0d-4c3a-9c6f-34af887eb4f0
# ╠═1baf09d6-a1e4-4582-8a33-c48e57d7f2a6
# ╠═895bf114-bde7-4a26-867d-c3c762552b33
# ╠═ecab2739-c2e5-4244-9734-d6c4348ea903
# ╠═4d88cba1-1ad0-47c1-a58f-0aa1793a41cf
# ╠═ab143edb-8df2-4967-9c75-749674fd393c
# ╠═a5646478-3733-42a7-9fb3-f993bef197da
# ╠═c8c226ab-0956-4205-9be7-9863fb76186f
# ╠═51fb20c5-42cc-4f9e-9b28-60c0e3c506c8
# ╠═aaa5a02e-4472-493e-986d-5d66f07040e8
# ╠═8fcd9dae-edeb-4fbb-ac35-e7a1607c6bb2
# ╠═23768c4c-287e-4fc4-9969-ca3977079755
# ╠═84a9a8e6-b8fd-4ead-84a5-7e4f5faff3da
# ╠═3a2ccfe7-0789-4021-b6c6-4d016ad0d115
# ╠═bf2a15b5-d261-4848-948b-34f7ca6e7e87
# ╠═07721d59-255e-41c6-a21b-ae16bae501ef
# ╠═51bac541-cf8c-4c72-abd8-b6f24b2cc542
# ╠═24e7c7f6-27c6-4096-aa12-2dcad57df24c
# ╠═5f60c4f4-de19-4f46-a2ab-ffc6ee658cf4
# ╠═7c1a9f39-b5ef-4c4d-bb24-0fab95129f01
# ╠═c61bdc64-7551-4fe1-a8ba-7ec36172ed12
# ╠═ba8a975b-ad5f-464e-8de2-32cb2b58670f
# ╠═662b9ed1-c105-4c60-8438-8f7f2c20bdeb
# ╠═612cfcfc-3ca3-435e-a94b-c32b329c819d
# ╠═70c7ad91-84fd-4505-99d5-7b437304c085
# ╠═265093d1-3cf3-4bb6-aaad-d4a6b746c1e1
# ╠═622355eb-56eb-42fa-99c2-6c89cdd0ea76

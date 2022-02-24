### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 658bb8e0-935d-11ec-275b-096090b02bbf
#= Because it can take a while for Plots to load, we will import it here and change the plotting backend to plotly =#

using Plots

# ╔═╡ a953e437-4f83-4285-b2b7-bcc35824b25d
include("Example.jl")
#= The output from this file should be printed in the REPL =#

# ╔═╡ 2bf981fa-e554-440d-a173-0b7945e0ff53
plotly()

# ╔═╡ 9b6cc264-12c1-4ada-b302-b77f616ba1fe
#= We'll revisit plotting toward the end of the worksheet.
Now, let's go back over the material covered in class :) 


1. Download the julia file "Example.jl" from the lecture notes folder and save it in the same directory as the current file.
2. We will include the contents of that file in the current workspace by including it.
=#

# ╔═╡ 07d2e9c3-488a-4767-99a7-10171017eb37
#= Note that the current Pluto workbook is also a julia file (Week2.jl) =#

# ╔═╡ b09e3090-8456-44e1-93be-b0754f158fac
#= In the following cells, we we look at various data types.
In julia, to find out what the type of an object (variable) is, we use the 'typeof()' function as follows =#

# ╔═╡ a6364c3a-da57-4607-84fe-5839bc1d7db2
typeof(1)

# ╔═╡ a22c0947-4f1d-4243-85eb-32a38442ebb0
typeof(1.0)

# ╔═╡ 3ad44281-3523-4253-b462-c86e57296b41
typeof('1')

# ╔═╡ eb0dcf49-2327-442f-adb1-489fb70285a9
typeof("1")

# ╔═╡ 47479f44-8049-4fdb-844e-6582b6ea267b
"1"*"2"

# ╔═╡ 12c3ec5d-60dd-4b46-9107-ae6466f2b716
begin
	x = 45
	typeof(x)
end

# ╔═╡ cb24aa88-da6e-4b13-953c-44c318c92325
begin
	x_Int64 = 45
	x_Int8 = convert(Int8, 45)
	typeof(x_Int8)
end

# ╔═╡ c96099ed-5e70-4379-ac08-70c27d770a75
begin
	y_Int64 = 9177
	y_Int8 = convert(Int8, 9177)
end

# ╔═╡ a47d421e-ea43-4b5b-b6fd-79da51a9d4f3
begin 
	a = 10   # This is an Int
	b = 3.4  # This is a Float
	typeof(a*b) # The product will be promoted to a Float
end


# ╔═╡ 779fdc46-1d0c-4478-83c5-50985927cd83
typeof(x_Int64*x_Int8) # The result is promoted to Int64

# ╔═╡ f50d8754-17af-4025-84cf-9b03b595055d
# We can also deal with complex numbers in Julia:

begin
	z = 4 + 7im
	typeof(z)
end

# Note that we use 'im' to specify the imaginary part of the complex number.


# ╔═╡ f13368d9-1c95-430b-96b5-10c3da3ead7e
isa(99,Number)

# ╔═╡ cbb7b755-47c4-40ee-b606-6251f139a2f3
isa(99,Real)

# ╔═╡ 62d309db-36d7-4f11-a830-f4a644638b7f
isa(99,Int)

# ╔═╡ fd9a5e10-dc79-428d-94ce-b43573a60a9b
isa(99.00,Int)

# ╔═╡ 146e52a2-d442-4d92-bbdf-6a0ce24c94b0
typeof('#')

# ╔═╡ 92099130-6a26-4e97-9fe0-4a7c9e59fb5e
notachar = 'hello'

# ╔═╡ d21b91e9-c3ae-49b9-9fc8-295370d6c3fa
begin
	sayhi = "Hello world"
	typeof(sayhi)
end

# ╔═╡ 9c9ff5a3-98f7-4600-9a22-dde4c2e7ed7b
MyName = "Matt"

# ╔═╡ 01546fcc-3b53-4401-aa8c-b573faa6f139
"$MyName is the best person in the world"  # See here how we can insert string variables into other strings

# ╔═╡ 5c971337-d03a-4ec1-b699-882ae9fa6761
Age = 88  # This is an Int

# ╔═╡ 144684ce-1a00-4497-a9cc-099664f3d45f
"I am $Age years old."  # Julia converts numbers to strings automatically

# ╔═╡ 4256694d-1af8-439f-b275-2f39ac58508f
typeof(true)

# ╔═╡ 1558a5e1-659c-48e4-a422-05efca55f75b
typeof(false)

# ╔═╡ 68d87c9b-b38f-47f5-a637-c3c304864027
true+false

# ╔═╡ 94bff3e4-e4ca-429e-b785-a3c3deaad8ad
typeof(true+false)

# ╔═╡ 67aa7fd0-1533-41ec-8598-fed00151a359
false*true

# ╔═╡ c67a7ad7-9bbf-4254-8e83-62210d73bfc1
typeof(false*true)

# ╔═╡ 86226a97-2df7-4863-84ae-51159edc9847
round(pi)


# ╔═╡ c7088dba-2f33-4b49-87ce-896228b0e99d
ceil(pi)

# ╔═╡ d7804428-1b77-4a0f-b51a-8c440ca710ea
floor(5*pi)

# ╔═╡ f3d4b113-e482-4374-8e28-7858ec7b72f7
#= Let's use some of the easter eggs that julia offers by creating variables with special non-ASCII characters.

Remember, to create these characters, type \ then the keyword and tab.

For a list of keywords, see:  https://docs.julialang.org/en/v1/manual/unicode-input/ 
=#

# ╔═╡ 996615f4-27ad-4361-b659-62d3406dcc75
π  #\pi + tab

# ╔═╡ 111788c1-95bb-4ab8-b9df-dda6c81b417a
LineEquation = "Y = αx + β"

# ╔═╡ 1cb11c4a-de79-44db-af87-42a1b6887ce4
🍄🌵🌈🌋 = "mushroom, cactus, rainbow, volcano"

# ╔═╡ 2fcc1da1-73d4-421e-a2f8-7842c86565b1
Song = """I know that I've imagined love before
And how it could be with you

Really hurt me, baby, really cut me, baby
How can you have a day without a night?
You're the book that I have opened
And now I've got to know much more

The curiousness of your potential kiss
Has got my mind and body aching

Really hurt me, baby, really cut me, baby
How can you have a day without a night?
You're the book that I have opened
And now I've got to know much more

Like a soul without a mind
In a body without a heart
I'm missing every part
Like a soul without a mind
In a body without a heart
I'm missing every part
Like a soul without a mind
In a body without a heart
I'm missing every part
Like a soul without a mind
In a body without a heart
I'm missing every part"""


# ╔═╡ 58d59473-2474-4944-9557-9b8685cfaa01
swap_know = replace(Song, "know" => "think")

# ╔═╡ f284534d-866a-4a5e-ad0b-f602d1b340b2
length(Song)

# ╔═╡ cd16eb58-5908-42e3-baed-a81d1867c176
split_you = split(Song, "you")

# ╔═╡ 83a812de-f36d-410a-9b73-e7fe30e967d8
occursin("love", Song)

# ╔═╡ fbd6f67f-c9e7-40b5-a629-a677bad68d6b
occursin("hate", Song)

# ╔═╡ 52010f4b-c29d-4063-999c-de5c4092bff9
# The speech string variable here uses triple quotation marks to cover multiple lines

Speech = """I have a dream that one day on the red hills of Georgia, the sons of former slaves and the sons of former slave owners will be able to sit down together at the table of brotherhood.

I have a dream that one day even the state of Mississippi, a state sweltering with the heat of injustice, sweltering with the heat of oppression will be transformed into an oasis of freedom and justice.

I have a dream that my four little children will one day live in a nation where they will not be judged by the color of their skin but by the content of their character. I have a dream today.

I have a dream that one day down in Alabama with its vicious racists, with its governor having his lips dripping with the words of interposition and nullification, one day right down in Alabama little Black boys and Black girls will be able to join hands with little white boys and white girls as sisters and brothers. I have a dream today."""

# ╔═╡ 0a63ec88-a9cd-4c1f-8470-527713735293
swapsons = replace(Speech, "sons" => "daughters")

# ╔═╡ f2d0281b-c4ad-4157-8327-7d7ca8d287ac
length(Speech) # Count the number of characters in the string

# ╔═╡ 671f1678-e611-4e28-8c54-24107bc3d4bb
splitwill = split(Speech, "will")

# ╔═╡ 7ce1189a-68ab-4057-a84f-76726de2f678
print(splitwill)

# ╔═╡ a1bdba47-e7d2-4a06-b3ed-8358512cdbed
occursin("Alabama", Speech)

# ╔═╡ 329c3dd5-99ef-49b9-a9da-1a09d9a8e495
occursin("Luxembourg", Speech)

# ╔═╡ a358f726-78b8-4fbf-b564-e8105d492e5f
repeat("I love Julia programming, ", 6)

# ╔═╡ 9263d4b0-6764-4545-906a-f9dc1d4bb753
println("There should be a tab between here \t and here")

# ╔═╡ 8f9976bb-bcfb-4690-8202-8663ca92e36c
println("There should be a new line \n starting now")

# ╔═╡ ca890609-7b59-4a7b-97c7-0cd61da8925d
ExampleTuple = ('a', "simple tuple with", 3, "items")

# ╔═╡ 2c889aa1-acc4-48d5-aac2-4aa65f110978
typeof(ExampleTuple)

# ╔═╡ 5bfae0a2-3e7d-4a77-b89e-1d8568c2cccf
length(ExampleTuple)

# ╔═╡ dd97cd03-aaef-4327-9151-5dcd34ade513
ExampleTuple[1]

# ╔═╡ 4af009af-826e-4d70-91b3-66bd0fe5ef3a
ExampleTuple[4]

# ╔═╡ 8d4c8e41-b882-4a29-9be1-6c59c7527207
ExampleTuple2 = (1, 44.505, 3-π*im, '€')

# ╔═╡ 02d1f3d3-8e85-4a6c-80cf-6f32611fdd68
typeof(ExampleTuple2)

# ╔═╡ 3d87ffe4-82cb-42d0-98d4-f25764af3143
(ExampleTuple, ExampleTuple2)

# ╔═╡ acd73e34-63d6-4159-9b9b-3030e7192673
(ExampleTuple..., ExampleTuple2) # This is called splatting

# ╔═╡ 16557cb4-51a7-4e8e-bbc4-3fd4555ca626
(ExampleTuple..., ExampleTuple2...)

# ╔═╡ a461b047-2d7c-46b7-850e-c6f1d9830801
MedDetails = ('o', "Jane Doe", 42, false)   # Tuples can be useful for storing info that shouldn't be changed. Here we see an example of a persons medical info (blood type, name, age, organ donor (T/f))

# ╔═╡ 5dc55a09-1a39-4d39-97d2-a170e1d2dfaf
# Now let's compare the above tuple to a dictionary
MedDict = Dict("Blood Type"=>'o', "Name"=>"Jane Doe", "Age"=>42, "Organ donor?"=>false)

# ╔═╡ b5931467-e9d3-4bcd-b088-f4ff40b93848
MedDict["Name"]

# ╔═╡ 30872a7d-5a35-4cd4-bd7b-20d9a591191a
MedDict["Organ donor?"]

# ╔═╡ 5feb77a1-b893-429b-ad08-2a7ee7ab4689
keys[MedDict]

# ╔═╡ 15e285f0-46b2-45d8-b14f-c8750b258d87
values(MedDict)

# ╔═╡ 155496b2-9507-4a0e-a152-9050cece9772
begin
	patient1 = Dict("Name"=>"John Dorian", "Age"=>35, "Condition"=>"Covid19")
	patient2 = Dict("Name"=>"Elliot Reid", "Age"=>35, "Condition"=>"Tonsilitis")
	patient3 = Dict("Name"=>"Chris Turk", "Age"=>34, "Condition"=>"Diabetes")
	PatientRegister = Dict('1'=>patient1, '2'=>patient2, '3'=> patient3)
end

# ╔═╡ d8984c4f-537a-4990-b8fd-0bca377751b3
PatientRegister['2']

# ╔═╡ 5983bb51-7798-4239-bd21-466c68e58f5e
PatientRegister[2]

# ╔═╡ ae7e4d5e-c007-4f98-9bd1-732e03b4f666
EmergencyDept = [patient1, patient2, patient3, "empty bed"]

# ╔═╡ 6fdb177b-664a-4f04-b113-da492ccf19a5
Ward1 = ["Emmanuel Macron" "Angela Merkel"; "Ursula Von Der Leyen" nothing] # note the absernce of commas between array items

# ╔═╡ d75a4870-ad7c-4c4b-a9cd-e5562b8488cb
Ward2 = ["Emmanuel Macron" nothing "Angela Merkel"; nothing "Ursula Von Der Leyen" nothing]

# ╔═╡ 0ec24049-ea6b-473d-b57f-f8ca4a84c41e
objectid(Ward1)

# ╔═╡ 9638f0c5-8132-4c67-8073-df29e0e48115
objectid(Ward2)

# ╔═╡ acb0c471-a713-4b02-b27e-b6182ba79550
carweight = [222, 233, 188, 345, 332, 267, 254, 199]

# ╔═╡ aee7db07-5040-476b-8cf3-9cfb71ce7875
maxspeed = [188, 155, 122, 120, 111, 116, 154, 137]

# ╔═╡ a3711066-b3da-4e38-9476-56c9b77774a5
plot(carweight,maxspeed)

# ╔═╡ ee70149b-8d60-4009-a398-a4b4b9e724d9
plot(carweight,maxspeed,seriestype = :scatter)

# ╔═╡ 0597b23d-ef8c-441d-81c0-b5499a7f9f9b
adjustedspeed = [199, 135, 129, 100, 131, 106, 150, 140]

# ╔═╡ 6d914725-e9a2-403a-9bde-5de40184d4db
plot!(carweight,adjustedspeed,seriestype = :scatter)

# ╔═╡ c1e1ce03-abe5-4106-9de6-79ca53fdb1ab
xlabel!("Car weight (Kg)")

# ╔═╡ 188be3d9-6e83-48c1-a4ae-36a4e58f20ce
ylabel!("Speed (Km/H)")

# ╔═╡ 992259b8-6c86-4bc0-9b89-b6d69e764533
plot(rand(30),rand(30),title="Random Scatter", xlabel="series 1", ylabel="series 2", seriestype=:scatter, markershape=:star5)

# ╔═╡ Cell order:
# ╠═658bb8e0-935d-11ec-275b-096090b02bbf
# ╠═2bf981fa-e554-440d-a173-0b7945e0ff53
# ╠═9b6cc264-12c1-4ada-b302-b77f616ba1fe
# ╠═a953e437-4f83-4285-b2b7-bcc35824b25d
# ╠═07d2e9c3-488a-4767-99a7-10171017eb37
# ╠═b09e3090-8456-44e1-93be-b0754f158fac
# ╠═a6364c3a-da57-4607-84fe-5839bc1d7db2
# ╠═a22c0947-4f1d-4243-85eb-32a38442ebb0
# ╠═3ad44281-3523-4253-b462-c86e57296b41
# ╠═eb0dcf49-2327-442f-adb1-489fb70285a9
# ╠═47479f44-8049-4fdb-844e-6582b6ea267b
# ╠═12c3ec5d-60dd-4b46-9107-ae6466f2b716
# ╠═cb24aa88-da6e-4b13-953c-44c318c92325
# ╠═c96099ed-5e70-4379-ac08-70c27d770a75
# ╠═a47d421e-ea43-4b5b-b6fd-79da51a9d4f3
# ╠═779fdc46-1d0c-4478-83c5-50985927cd83
# ╠═f50d8754-17af-4025-84cf-9b03b595055d
# ╠═f13368d9-1c95-430b-96b5-10c3da3ead7e
# ╠═cbb7b755-47c4-40ee-b606-6251f139a2f3
# ╠═62d309db-36d7-4f11-a830-f4a644638b7f
# ╠═fd9a5e10-dc79-428d-94ce-b43573a60a9b
# ╠═146e52a2-d442-4d92-bbdf-6a0ce24c94b0
# ╠═92099130-6a26-4e97-9fe0-4a7c9e59fb5e
# ╠═d21b91e9-c3ae-49b9-9fc8-295370d6c3fa
# ╠═9c9ff5a3-98f7-4600-9a22-dde4c2e7ed7b
# ╠═01546fcc-3b53-4401-aa8c-b573faa6f139
# ╠═5c971337-d03a-4ec1-b699-882ae9fa6761
# ╠═144684ce-1a00-4497-a9cc-099664f3d45f
# ╠═4256694d-1af8-439f-b275-2f39ac58508f
# ╠═1558a5e1-659c-48e4-a422-05efca55f75b
# ╠═68d87c9b-b38f-47f5-a637-c3c304864027
# ╠═94bff3e4-e4ca-429e-b785-a3c3deaad8ad
# ╠═67aa7fd0-1533-41ec-8598-fed00151a359
# ╠═c67a7ad7-9bbf-4254-8e83-62210d73bfc1
# ╠═86226a97-2df7-4863-84ae-51159edc9847
# ╠═c7088dba-2f33-4b49-87ce-896228b0e99d
# ╠═d7804428-1b77-4a0f-b51a-8c440ca710ea
# ╠═f3d4b113-e482-4374-8e28-7858ec7b72f7
# ╠═996615f4-27ad-4361-b659-62d3406dcc75
# ╠═111788c1-95bb-4ab8-b9df-dda6c81b417a
# ╠═1cb11c4a-de79-44db-af87-42a1b6887ce4
# ╠═2fcc1da1-73d4-421e-a2f8-7842c86565b1
# ╠═58d59473-2474-4944-9557-9b8685cfaa01
# ╠═f284534d-866a-4a5e-ad0b-f602d1b340b2
# ╠═cd16eb58-5908-42e3-baed-a81d1867c176
# ╠═83a812de-f36d-410a-9b73-e7fe30e967d8
# ╠═fbd6f67f-c9e7-40b5-a629-a677bad68d6b
# ╠═52010f4b-c29d-4063-999c-de5c4092bff9
# ╠═0a63ec88-a9cd-4c1f-8470-527713735293
# ╠═f2d0281b-c4ad-4157-8327-7d7ca8d287ac
# ╠═671f1678-e611-4e28-8c54-24107bc3d4bb
# ╠═7ce1189a-68ab-4057-a84f-76726de2f678
# ╠═a1bdba47-e7d2-4a06-b3ed-8358512cdbed
# ╠═329c3dd5-99ef-49b9-a9da-1a09d9a8e495
# ╠═a358f726-78b8-4fbf-b564-e8105d492e5f
# ╠═9263d4b0-6764-4545-906a-f9dc1d4bb753
# ╠═8f9976bb-bcfb-4690-8202-8663ca92e36c
# ╠═ca890609-7b59-4a7b-97c7-0cd61da8925d
# ╠═2c889aa1-acc4-48d5-aac2-4aa65f110978
# ╠═5bfae0a2-3e7d-4a77-b89e-1d8568c2cccf
# ╠═dd97cd03-aaef-4327-9151-5dcd34ade513
# ╠═4af009af-826e-4d70-91b3-66bd0fe5ef3a
# ╠═8d4c8e41-b882-4a29-9be1-6c59c7527207
# ╠═02d1f3d3-8e85-4a6c-80cf-6f32611fdd68
# ╠═3d87ffe4-82cb-42d0-98d4-f25764af3143
# ╠═acd73e34-63d6-4159-9b9b-3030e7192673
# ╠═16557cb4-51a7-4e8e-bbc4-3fd4555ca626
# ╠═a461b047-2d7c-46b7-850e-c6f1d9830801
# ╠═5dc55a09-1a39-4d39-97d2-a170e1d2dfaf
# ╠═b5931467-e9d3-4bcd-b088-f4ff40b93848
# ╠═30872a7d-5a35-4cd4-bd7b-20d9a591191a
# ╠═5feb77a1-b893-429b-ad08-2a7ee7ab4689
# ╠═15e285f0-46b2-45d8-b14f-c8750b258d87
# ╠═155496b2-9507-4a0e-a152-9050cece9772
# ╠═d8984c4f-537a-4990-b8fd-0bca377751b3
# ╠═5983bb51-7798-4239-bd21-466c68e58f5e
# ╠═ae7e4d5e-c007-4f98-9bd1-732e03b4f666
# ╠═6fdb177b-664a-4f04-b113-da492ccf19a5
# ╠═d75a4870-ad7c-4c4b-a9cd-e5562b8488cb
# ╠═0ec24049-ea6b-473d-b57f-f8ca4a84c41e
# ╠═9638f0c5-8132-4c67-8073-df29e0e48115
# ╠═acb0c471-a713-4b02-b27e-b6182ba79550
# ╠═aee7db07-5040-476b-8cf3-9cfb71ce7875
# ╠═a3711066-b3da-4e38-9476-56c9b77774a5
# ╠═ee70149b-8d60-4009-a398-a4b4b9e724d9
# ╠═0597b23d-ef8c-441d-81c0-b5499a7f9f9b
# ╠═6d914725-e9a2-403a-9bde-5de40184d4db
# ╠═c1e1ce03-abe5-4106-9de6-79ca53fdb1ab
# ╠═188be3d9-6e83-48c1-a4ae-36a4e58f20ce
# ╠═992259b8-6c86-4bc0-9b89-b6d69e764533

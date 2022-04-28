### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ a2b02030-ba59-11ec-3354-4700f9b3ab91
# Import the packages needed
using Plots, StatsPlots, Statistics, StatsBase, DelimitedFiles, CSV, Dates,DataFrames, LinearAlgebra

# ╔═╡ d4b4864d-a0fb-479e-95fd-5c23e21415c2
# Open up the Plotly backend for plotting figures with interactivity
plotly()

# ╔═╡ c811085d-7fb2-46ef-92ef-511eb00cffec
md"""
# Task 1:

This dataset Olympics.txt is a tab delimited file containing the number of medals won by countries at the summer and winter Olympic games. The columns correspond to:

1. Country Code
2. Number of summer Olympics attended
3. Number of summer Olympic gold medals
4. Number of summer Olympic silver medals
5. Number of summer Olympic bronze medals
6. Total number of summer Olympic medals
7. Number of winter Olympic attended
8. Number of winter Olympic gold medals
9. Number of winter Olympic silver medals
10. Number of winter Olympic bronze medals
"""

# ╔═╡ 67e75526-e0ca-4eae-bd2a-e6f56b3bd07b
md"""### Step 1. 

Import the dataset *Olympics.txt*. """

# ╔═╡ a5c947e9-c00a-4d6c-8ef4-f0ec6c580ec8
# This imports the dataset as an array called 'Olympics'
# Use '\t' because it's a tab delimited file.
# header = true because the file has headers.
# Using the underscore as the second output name ignores this variable.

Olympics, _ = readdlm("Olympics.txt", '\t', header=true)

# ╔═╡ 0506363f-fcf7-4952-aba9-893824a17cbd
md"""
### Step 2.      

Write a function called *MedalScore* using the simple, single line format.
MedalScore should accept 4 required arguments: *Games, Gold, Silver* and *Bronze*.
MedalScore should return weighted average of medals won, i.e.
𝑀𝑒𝑑𝑎𝑙𝑆𝑐𝑜𝑟𝑒 = (3∗𝐺𝑜𝑙𝑑 + 2∗𝑆𝑖𝑙𝑣𝑒𝑟 + 𝐵𝑟𝑜𝑛𝑧𝑒) / (6∗𝐺𝑎𝑚𝑒𝑠)
"""

# ╔═╡ 4ec8186a-978d-427a-80b0-5e502572dece
# A simple format function with 4 integer inputs (::Int).
MedalScore(Games::Int, Gold::Int, Silver::Int, Bronze::Int) = (3*Gold + 2*Silver + Bronze)/(6*Games)

# ╔═╡ 6f224760-36f9-4703-b6cf-738e314b4f2e
md"""
### Step 3.

Write a for loop that iterates through each row of the Olympics dataset.

For each iterated row, calculate the *MedalScore* for summer and winter games, and
compare them using an __if-else__ statement.

If summer > winter, print to the REPL: “Country prefer the heat”

If summer < winter, print to the REPL: “Country prefer the snow”

Otherwise, print to the REPL: “Country don’t have a preference”

where Country is the corresponding country code in the dataset,
e.g. __*LUX prefer the snow*__

"""

# ╔═╡ b65efa29-ef18-4631-a7c4-e8920742f064
# Iterate through each row of Olympics. 
# k will become a row vector for each loop iteration.
for k in eachrow(Olympics)
	# The indices of k correspond to the games/gold/silver/bronze elements.
	Summer = MedalScore(k[2],k[3],k[4],k[5])  # Calculate Summer medal score
	Winter = MedalScore(k[7],k[8],k[9],k[10])  # Calculate Winter medal score
	
	# A simple if-else statement to compare summer and winter scores.
	if Summer > Winter
		println(k[1]*" prefer the heat")
	elseif Summer < Winter
		println(k[1]*" prefer the snow")
	else
		println(k[1]*" don't have a preference")
	end
	
end

# ╔═╡ b8b928d7-2565-4e16-9eb9-0c64a82ce30a
md"""  # Task 2: 

The file *Chris_Actors.txt* contains comma delimited time series of the relative google search
term popularity for the actors: Chris Pine, Chris Hemsworth, Chris Evans, Chris Pratt
"""

# ╔═╡ f70b6713-56e0-4571-bf3f-9ad32c9f8929
md""" ### Step 1. 

Import the dataset *Chris_Actors.txt*. """

# ╔═╡ 479c17a8-2990-4074-9d1a-6cf84a7cfcb7
# This imports the dataset as an array called 'Chris'
# Use ',' because it's a comma delimited file.
# header = true because the file has headers.
Chris, Names = readdlm("Chris_Actors.txt",',',header=true)

# ╔═╡ 7c615714-75c2-4a03-8480-350b52a7da8a
md""" ### Step 2. 

Using the *Dates.jl* package (installed by default with Julia), create a new variable
called **WeekX**, which is the data in the first column of the dataset, converted into a
DateTime object.

*e.g. WeekX = DateTime.( ... ).* 


### Step 3.

Create a second variable called Popularity which contains the remaining columns of
the dataset converted into an array of integers.

"""

# ╔═╡ 5aac17b7-1a1b-4d11-b41d-153d67f63b8d
# First create a vector of dates by converting the first column to a datetime type.
# Second, convert the rest of the Chris array from Any to Integer in a new variable called Popularity.
begin
	WeekX = DateTime.(Chris[:,1])
	Popularity = Int.(Chris[:,2:end])
end

# ╔═╡ b90f8fd0-3b30-483e-a767-7dc8ae89deb7
md""" ### Step 4. 

Calculate the standard deviation of the popularity of each Chris.
"""

# ╔═╡ a0c2d7c5-e305-405e-b302-c378d438751d
# Use the dims keyword argument to tell julia to calculate the standard deviation along each column.
Chris_STD = std(Popularity, dims=1)

# ╔═╡ 401a236e-a421-4e06-b7c5-b0b169ac263c
md""" ### Step 5. 

Plot **Weekx** against **Popularity**. Include a title, x-axis label and y-axis label.
Specify a line thickness of 3pt. It should look similar to this:
"""

# ╔═╡ 46dcef07-e1cd-4636-a67b-5be10f94aa8c
# Plot the popularity against the weeks.
# Because Weekx is the same length as Popularity, julia knows to plot each row of Popularity against Weekx.
# Add a title, xlabel, ylabel within the function call.
plot(WeekX, Popularity, linewidth = 3, title="Chris Popularity", xlabel="Week", ylabel="Popularity")

# ╔═╡ 01d69767-495a-47ee-b7df-00e5a421cb2a
md"""  # Task 3: 

The file *Population.csv* contains **semi-colon** delimited array of European countries and their projected populations between 2025 and 2100.
"""

# ╔═╡ 736ce0cd-25a4-4eae-adc1-7755f48180c6
md""" ### Step 1. 

Using *readdlm()*, import the dataset *Population.csv*.

The data should be imported as a variable called **Population** and the headers should
be imported as a variable called **Years**. """

# ╔═╡ 7b8a8acd-1893-4003-9c6f-e141d60c1d5a
Population, Years = readdlm("Population.csv", ';', header=true)

# ╔═╡ 2f181064-7004-4dcd-9dc3-196c4bde52d2
md""" ### Step 2. 

Create a new variable called **PopNumbers** from all but the first column of **Population** (the numeric data). 

Convert the values of PopNumbers to integers by:

1. splitting each string element by empty spaces into substrings [split()]
2. rejoining the substrings [join()]
3. parsing the rejoined string elements into integers [parse()]

__*Bonus points if you do all these steps in a single line of code*__.
"""

# ╔═╡ 2790384f-01ec-4d8c-8f6f-1c96923885e4
# Use the dot notation here to do things very efficiently.
# Here, each numeric element in converted to an integer by splitting - split(), joining - join() and then parsing - parse()
PopNumbers = parse.(Int, join.(split.(Population[:,2:end])))

# ╔═╡ 0434c495-897b-4cc9-9912-add2b2a6a798
md""" ### Step 3. 

Create a new variable, **PopNorm**, that is **PopNumbers** normalised by dividing the
population of each country (Popx) by its _mean_ over all years (N).

𝑃̂𝑜𝑝𝑋 =  𝑃𝑜𝑝𝑋 / (Σ 𝑃𝑜𝑝𝑋/𝑁)

"""

# ╔═╡ e20bf88a-5d16-4101-bc51-f9b4d5acaa50
# For efficiency, we use the mean function and specify the dims keyword to average across rows.
# With the dot notation, this divides each row by the mean population for that row.
PopNorm = PopNumbers./mean(PopNumbers,dims=2)

# ╔═╡ 0a9d63a2-aeac-4f57-a6d7-ab1dccba7f7b
md""" ### Step 4. 

Recreate (as much as you can) the plot below with the **PopNorm** data, where the
black line represents the mean of all countries.


__*Hints: adjoint(), plot!(), label=reshape(... , 1, 34), linewidth=3, colour= :black*__

"""

# ╔═╡ 878e34ce-b6de-4e48-95d0-36c62d42dbba
begin
# Use adjoint to rotate (Transpose) Popnorm so that the rows are plotted, and not the columns.
# Reshape the column of countries into a vector to use as a label
# Use the range notation to specify the xtick values
	plot(adjoint(PopNorm), label = reshape(Population[:,1],1,34), xtick=2020:5:2100)
	
# Overlay the previous figure (plot!) with the overall average from all countries (normalised).
# Again, use the dims keyword from mean to get the average by column.
# Add labels, title and specify the linewidth	
	plot!(mean(adjoint(PopNorm),dims=2), color=:black, linewidth = 4,
	xlabel="Years (2020-2100)", ylabel="Normalised Population", 
	title = "European Population Projections")
	
end

# ╔═╡ 9b55f72e-0092-4807-991b-2d68100f391c
md""" ### Step 5. 
Find the year where the variance of all normalised populations reaches a minimum.
"""

# ╔═╡ fb033e21-4d7b-4242-862a-7842150b5cd4
# Use the dims keyword to get variance by column (year)
# Use the argmin function to find to location of the minimum
# Ignore the first element of Year (which is the country header)
Years[2:end][argmin(var(PopNorm, dims=2))]

# ╔═╡ 0b9ea4f2-fcc8-498b-827e-dbc5d7385b39
md"""  # Task 4: 

The file *Mercury_Prize_Winners.csv* contains the track listings for each Mercury Prize winning albums from 2014-2021.
"""

# ╔═╡ d514eb10-bf05-4869-a585-d45a06914c1d
md""" ### Step 1. 

Using **CSV**, import Mercury_Prize_Winners.csv as a dataframe object called **Mercury**.
"""

# ╔═╡ 69798e1e-1017-464c-af1c-fdd37f5f726c
# Don't forget to use the DataFrame keyword!
Mercury = CSV.read("Mercury_Prize_Winners.csv", DataFrame)

# ╔═╡ 1bedb0f3-4191-4929-aba4-024574b838d5
md""" ### Step 2. 

Group *Mercury* into sub-dataframes __*by album name [groupby()]*__
"""

# ╔═╡ c077087b-d6ac-48a1-a085-2c3b626e2c31
# Fairly straightforward...
X = groupby(Mercury,:Album)

# ╔═╡ d2c4d41f-d5d8-4b5f-b402-a672214a5962
md""" ### Step 3.

Create a composite type (struct) called **Hit** with 4 fields:

* NumTracks an integer, representing the number of songs in the album
* Artist a string, representing the name of the artist
* MinLength a Time object, representing the shortest song length
* MaxLength a Time object, representing the longest song length

"""

# ╔═╡ 88219c19-9ff8-4e89-803a-77ebc6f02a7a
struct Hit  # Specify the name of the struct (Hit)
	NumTracks::Int   # NumTracks must be an integer
	Artist::String  # Artist must be a string
	MinLength::Time  # MinLength and MaxLength must be a time object
	MaxLength::Time
end

# ╔═╡ b60825d4-0c86-4a05-b5a8-c24a5f1e8571
# Test it to see if it works...
# Look at the DataFrames cheat sheet for the function names
Hit(nrow(X[1]), X[1].Artist[1], minimum(X[1].Length), maximum(X[1].Length))

# ╔═╡ a2bff5e1-d677-4996-bb52-1af8f7ea1244
md""" ### Step 4.

Write a function called **HitMaker** that takes in a sub-dataframe from step 2 (required argument), and __*a second keyword string argument*__. 

Hitmaker should check to see if the keyword string argument appears in any of the song titles of the album. If it does, then a message should be printed to the REPL to say that *word ___ appears in song ___ by artist ___*.

For example: 

__*“Bullet appears in ‘Just Another Bullet’ by Young Fathers”*__

**Bonus points if you use the single line if-else statement here.**

Include a try-catch statement in your function to catch if a user passes a non-string type as the keyword argument.

"""

# ╔═╡ 09051cc8-359e-4f18-85f3-8452319b57d9
# SubDF is specified as a SubDataFrame type.
# Kword is given a default value = "hello"
function Hitmaker(SubDF::SubDataFrame, Kword="hello")
	
	try lowercase(Kword) # Try to see if you can do string operations in kword
	catch   # If kword is not a string, throw this error message
		error("Keyword argument must be a string")
	end
	
	for n in SubDF.Song	# For each song in SubDF, check to see if Kword occurs in the title	
		occursin(Kword, n) ? println(Kword*" appears in "*n*" by "*SubDF.Artist[1]) : nothing		
		
	end		
end

# ╔═╡ 46c64e3b-21e4-44b8-b5ab-e83005977593
# Test it to see if it works 😊
Hitmaker(X[1],"Boy")

# ╔═╡ 14a2cff8-0117-4d71-ab20-e894ee6ec73b
# Test it to see if it works 😊
# Notice that the error message here is the message we specify in the function! 😎
Hitmaker(X[4], 5)

# ╔═╡ Cell order:
# ╠═a2b02030-ba59-11ec-3354-4700f9b3ab91
# ╠═d4b4864d-a0fb-479e-95fd-5c23e21415c2
# ╠═c811085d-7fb2-46ef-92ef-511eb00cffec
# ╠═67e75526-e0ca-4eae-bd2a-e6f56b3bd07b
# ╠═a5c947e9-c00a-4d6c-8ef4-f0ec6c580ec8
# ╠═0506363f-fcf7-4952-aba9-893824a17cbd
# ╠═4ec8186a-978d-427a-80b0-5e502572dece
# ╠═6f224760-36f9-4703-b6cf-738e314b4f2e
# ╠═b65efa29-ef18-4631-a7c4-e8920742f064
# ╠═b8b928d7-2565-4e16-9eb9-0c64a82ce30a
# ╠═f70b6713-56e0-4571-bf3f-9ad32c9f8929
# ╠═479c17a8-2990-4074-9d1a-6cf84a7cfcb7
# ╠═7c615714-75c2-4a03-8480-350b52a7da8a
# ╠═5aac17b7-1a1b-4d11-b41d-153d67f63b8d
# ╠═b90f8fd0-3b30-483e-a767-7dc8ae89deb7
# ╠═a0c2d7c5-e305-405e-b302-c378d438751d
# ╠═401a236e-a421-4e06-b7c5-b0b169ac263c
# ╠═46dcef07-e1cd-4636-a67b-5be10f94aa8c
# ╠═01d69767-495a-47ee-b7df-00e5a421cb2a
# ╠═736ce0cd-25a4-4eae-adc1-7755f48180c6
# ╠═7b8a8acd-1893-4003-9c6f-e141d60c1d5a
# ╠═2f181064-7004-4dcd-9dc3-196c4bde52d2
# ╠═2790384f-01ec-4d8c-8f6f-1c96923885e4
# ╠═0434c495-897b-4cc9-9912-add2b2a6a798
# ╠═e20bf88a-5d16-4101-bc51-f9b4d5acaa50
# ╠═0a9d63a2-aeac-4f57-a6d7-ab1dccba7f7b
# ╠═878e34ce-b6de-4e48-95d0-36c62d42dbba
# ╠═9b55f72e-0092-4807-991b-2d68100f391c
# ╠═fb033e21-4d7b-4242-862a-7842150b5cd4
# ╠═0b9ea4f2-fcc8-498b-827e-dbc5d7385b39
# ╠═d514eb10-bf05-4869-a585-d45a06914c1d
# ╠═69798e1e-1017-464c-af1c-fdd37f5f726c
# ╠═1bedb0f3-4191-4929-aba4-024574b838d5
# ╠═c077087b-d6ac-48a1-a085-2c3b626e2c31
# ╠═d2c4d41f-d5d8-4b5f-b402-a672214a5962
# ╠═88219c19-9ff8-4e89-803a-77ebc6f02a7a
# ╠═b60825d4-0c86-4a05-b5a8-c24a5f1e8571
# ╠═a2bff5e1-d677-4996-bb52-1af8f7ea1244
# ╠═09051cc8-359e-4f18-85f3-8452319b57d9
# ╠═46c64e3b-21e4-44b8-b5ab-e83005977593
# ╠═14a2cff8-0117-4d71-ab20-e894ee6ec73b

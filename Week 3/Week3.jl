### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 6957aa70-95cd-11ec-3fa2-ed38d0d958be
# Create a for loop that sums the numbers 1:n in each iteration, where n is a value from 1 to 20

for x = 1:20
	println(sum(1:x))
end

# ╔═╡ d553f3b1-83f5-4234-9dda-f156c1b80e7b
# Create a for loop that sums the numbers 1:n in each iteration, where n is a vlaue in the range 1, 3, 5, ..., 17, 19

for x = 1:2:19
	println(sum(1:x))
end

# ╔═╡ 0715faa1-4f68-4507-8d41-5b8cb5112c55
# Create a for loop that prints out each character in a string

for letters in "A simple string of characters"
	println(letters)
end

# ╔═╡ 4834b47c-27d9-488e-b55d-2419d739c5b0
# Update the phone numbers in a dictionary to include the international calling code for Luxembourg and removing the '0' at the start of each number.

Phonebook = Dict("John"=>"014 588 588 33", "Mary"=>"044 124 128 44", "David"=>"014 667 682 09", "Angela"=>"071 333 999 66")

# ╔═╡ 5d7531d2-e7c6-452c-8bc0-f8289602654e
for x in keys(Phonebook)
	
	Remove_0 = chop(Phonebook[x], head=1, tail=0)
	Phonebook[x] = "+352 "*Remove_0	
	
end

# ╔═╡ 40dc758a-f983-45af-9e41-a0a577939aa0
Phonebook

# ╔═╡ cb7e798e-d235-4c21-9365-9a79cbc1a5f4
begin
	n = 1
	while n < 50
		println(sum(1:n))
		n += 1   # increases the value of n by 1 for each loop iteration
				 # this is the same as writing: n = n+1	
	end
end

# ╔═╡ 3d6382a4-4388-4ade-9632-9ad6c88f41d4
begin
	m = rand(1:3000)
	while m%7 != 0
		println("Number = $m.  We still haven't found a multiple of 7")
		m = rand(1:3000)   # assigns a new random integer value to m.
	end
	println("Finished!")
end

# ╔═╡ 4ef29867-e1f2-498b-a660-5e0b2b93fc39
Files = ("File1.jl", "File2.jl", "File3.jl", "File4.jl")

# ╔═╡ a0bac16e-c21c-4358-ac32-1e1e7fd8d637
for filename in Files
	try include(filename)
	catch
		println("Could not find the file called $filename...")
	end
end

# ╔═╡ 7d7b38de-2b91-4c48-98de-e8ca21e0b51e
CountryList = """The countries in South America are: 
Brazil, 
Colombia, 
Argentina,
Peru,
Venezuela,
Chile,
Ecuador,
Bolivia,
Paraguay,
Uruguay"""

# ╔═╡ 86702166-9018-452a-9651-973475683ade
if occursin("Chile", CountryList)
	println("Yes, Chile is in South America")
else
	println("I don't know where Chile is... I'm just a robot...")
end
	

# ╔═╡ f68b4e03-82f4-4d00-9ae6-0e187099221b
if "Paul" in keys(Phonebook) 
	println(Phonebook["Paul"])
elseif "Paula" in keys(Phonebook) 
	println(Phonebook["Paula"])	
elseif "Pauline" in keys(Phonebook) 
	println(Phonebook["Pauline"])
else
	println("There is nobody called Paul, Paula or Pauline in the phonebook")
end

# ╔═╡ b2749c59-3993-4552-b023-a26af5175401
for x in 1:30
	
	if x%3 == 0 
		println(string(x)*"= Fizz")
		
	elseif x%5 == 0
		println(string(x)*"= Buzz")
	
	elseif (x%3==0) && (x%5==0)
		println(string(x)*"= Fizzbuzz")
	end
	
end

# ╔═╡ 10da6ca2-9f07-496a-8e89-35f56438b9bd
for x in 1:30
	
	if (x%3==0) && (x%5==0)
		println(string(x)*"= Fizzbuzz")
	
	elseif x%3 == 0 
		println(string(x)*"= Fizz")
	
	elseif x%5 == 0
		println(string(x)*"= Buzz")
	
	end
end

# ╔═╡ 2b182e66-79b9-476a-88ed-d73d6109254f
FamilyMembers = ["Mam", "Dad", "Brother1", "Sister1", "Sister2", "Brother2", "Cat"]

# ╔═╡ 21545a59-c156-4f09-8302-33636e7fe4e9
"Granny" in FamilyMembers ? nothing : push!(FamilyMembers, "Granny")

# ╔═╡ 39e2c9b7-085d-4d9f-8bae-33072e0d4d7c
begin
	println("Tell me who you want to search for in the phonebook 😃")
	NameCheck = readline()
	
	NameCheck in Phonebook ? nothing : println("I can't find that person in the phonebook... 😕")
	
end

# ╔═╡ Cell order:
# ╠═6957aa70-95cd-11ec-3fa2-ed38d0d958be
# ╠═d553f3b1-83f5-4234-9dda-f156c1b80e7b
# ╠═0715faa1-4f68-4507-8d41-5b8cb5112c55
# ╠═4834b47c-27d9-488e-b55d-2419d739c5b0
# ╠═5d7531d2-e7c6-452c-8bc0-f8289602654e
# ╠═40dc758a-f983-45af-9e41-a0a577939aa0
# ╠═cb7e798e-d235-4c21-9365-9a79cbc1a5f4
# ╠═3d6382a4-4388-4ade-9632-9ad6c88f41d4
# ╠═4ef29867-e1f2-498b-a660-5e0b2b93fc39
# ╠═a0bac16e-c21c-4358-ac32-1e1e7fd8d637
# ╠═7d7b38de-2b91-4c48-98de-e8ca21e0b51e
# ╠═86702166-9018-452a-9651-973475683ade
# ╠═f68b4e03-82f4-4d00-9ae6-0e187099221b
# ╠═b2749c59-3993-4552-b023-a26af5175401
# ╠═10da6ca2-9f07-496a-8e89-35f56438b9bd
# ╠═2b182e66-79b9-476a-88ed-d73d6109254f
# ╠═21545a59-c156-4f09-8302-33636e7fe4e9
# ╠═39e2c9b7-085d-4d9f-8bae-33072e0d4d7c

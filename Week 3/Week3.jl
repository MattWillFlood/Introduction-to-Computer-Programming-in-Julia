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

# ╔═╡ a936be12-a1ff-4961-9404-ace010407d85
# Create a for loop that sums the numbers 1:n in each iteration, where n is a vlaue in the range 1, 3, 5, ..., 17, 19

for x = 1:2:19
	println(sum(1:x))
end

# ╔═╡ Cell order:
# ╠═6957aa70-95cd-11ec-3fa2-ed38d0d958be
# ╠═d553f3b1-83f5-4234-9dda-f156c1b80e7b
# ╠═0715faa1-4f68-4507-8d41-5b8cb5112c55
# ╠═a936be12-a1ff-4961-9404-ace010407d85

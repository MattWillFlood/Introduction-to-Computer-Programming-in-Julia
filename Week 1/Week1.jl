### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ c6150ed9-66c1-40e9-86b4-24f58238e290
#= Commenting your code
......................................

When writing code, it is soooo important that you
write comments throughout to explain to others
what your code does (or should do).

Comments are not executed like normal commands.
There are purely for interpreting other peoples code.

To create multiline comments like this one, start and end with #= and =#
For single line comments, just type # (see below).

=#



# ╔═╡ 4772f380-885b-11ec-383f-0f3524f16e01
1 + 2   # Add two numbers

# ╔═╡ fb74cbee-a0f1-4de8-908f-068f324bcd5c
7 - 8   # Subtract two numbers

# ╔═╡ c36fcd58-a607-4e6b-ba30-ffb66359c752
3 * 4   # Multiply two numbers

# ╔═╡ 91797522-ee6d-49f6-b320-8b18dd4bbe4e
6 / 5   # Divide two numbers

# ╔═╡ 5a01d315-5248-45cf-b35b-b6986bb809f0
11 % 9  # Calculate the remainder

# ╔═╡ 085de7a2-6854-4e2d-80c3-ebc87b5ac4d1
x = (5*3)-4  # Create a variable called x

# ╔═╡ 5da47503-ee11-47e6-9f08-7afba89d63fd
y = (21%6)/1.34  # create a variable called y

# ╔═╡ eeaac1fb-7bfd-458b-b9f3-bcbe541ee8d6
z = round(x^y)   # Calculate z as x raised to the power of y

# ╔═╡ 1f7cbccf-1336-4a6e-a508-11fb36b9ef9f
w = sqrt(144)

# ╔═╡ e2d502ee-9035-4908-b9c4-21570e88ae9c
Pi_ = pi

# ╔═╡ a05ba435-a510-4cdf-9390-015934913ba4
Singer1 = "Beyonce"   # Create a string variable called Singer1

# ╔═╡ bb6140a6-df63-43f1-95e1-a1c552e33dd9
Singer2 = "Kelly"   # Create a string variable called Singer2

# ╔═╡ 351d7db2-e116-4102-9b1d-e0726f43c71d
Singer3 = "Michelle"   # Create a string variable called Singer3

# ╔═╡ 748658e8-7348-4ad6-b92c-2f814179be72
Destinys_Child = "Destiny's Child are: " * Singer1 * ", " * Singer2 * " and " * Singer3   # Create a string called Destinys_Child by concatenating all Singers together

# ╔═╡ e257b5b3-675f-4911-9e38-82abc3a24e97
println(Destinys_Child)  # Print the string in the REPL

# ╔═╡ Cell order:
# ╠═c6150ed9-66c1-40e9-86b4-24f58238e290
# ╠═4772f380-885b-11ec-383f-0f3524f16e01
# ╠═fb74cbee-a0f1-4de8-908f-068f324bcd5c
# ╠═c36fcd58-a607-4e6b-ba30-ffb66359c752
# ╠═91797522-ee6d-49f6-b320-8b18dd4bbe4e
# ╠═5a01d315-5248-45cf-b35b-b6986bb809f0
# ╠═085de7a2-6854-4e2d-80c3-ebc87b5ac4d1
# ╠═5da47503-ee11-47e6-9f08-7afba89d63fd
# ╠═eeaac1fb-7bfd-458b-b9f3-bcbe541ee8d6
# ╠═1f7cbccf-1336-4a6e-a508-11fb36b9ef9f
# ╠═e2d502ee-9035-4908-b9c4-21570e88ae9c
# ╠═a05ba435-a510-4cdf-9390-015934913ba4
# ╠═bb6140a6-df63-43f1-95e1-a1c552e33dd9
# ╠═351d7db2-e116-4102-9b1d-e0726f43c71d
# ╠═748658e8-7348-4ad6-b92c-2f814179be72
# ╠═e257b5b3-675f-4911-9e38-82abc3a24e97

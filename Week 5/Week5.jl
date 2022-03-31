### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ d58cad3e-a866-4e0e-8f29-821188861a12
begin 
	using Plots
	plotly()
end

# ╔═╡ 1cd6f911-7cca-4e14-9a0e-0885902df8d1
using StatsBase, Statistics  #, StatsPlots

# ╔═╡ 6e208bb6-d207-480f-b970-80787ca2f41f
using LinearAlgebra, DelimitedFiles

# ╔═╡ 7679cb94-d070-400a-8e3d-552b23c1ca2b
using StatsPlots

# ╔═╡ 2b77c301-778a-4e7d-b176-194362ebec5e
begin     
	import DarkMode
    DarkMode.enable()
    # OR DarkMode.Toolbox(theme="default")
end 

# ╔═╡ 487fc300-e3a2-40ed-aa37-d19ae5ab96f7
md""" #### Let's start by importing data from text files"""

# ╔═╡ d64b24bf-34ca-4f36-8ab4-ed41b4f1d503
Data_Ralphy, Heads_Ralphy = readdlm("RalphFeinnes.txt", ',', header=true)

# Note that the default tab delimiter '\t' must be changed to comma ','


#= 

Data = readdlm(raw“C:/MyPC/…/Subject001.txt”, 
				‘\t’, 
				header=false, 
				skipstart=3)


readdlm(source, delim::AbstractChar,
		T::Type, eol::AbstractChar; header=false,
			skipstart=0, skipblanks=true, use_mmap, 
				quotes=true, dims, comments=false, comment_char='#')

=#

# ╔═╡ 4ffbf08e-cac5-44ad-bc51-af7a66e73216
Data_Ralphy[1,:]

# ╔═╡ c14d4afc-1473-4e1e-ac37-ef0277877843
Coco_pops, Coco_Heads = readdlm("Covid_in_Europe.txt", ',', header=true)


# ╔═╡ d18c09d8-38de-40a6-ae5a-ac36b6d28bd6
Coco_pops

# ╔═╡ d2854616-0a18-4206-bebb-db0d813d223e
Coco_Heads

# ╔═╡ 8b697e3b-0849-4c6c-8b16-9f5a08d0e00a
readdlm("ScotlandSun.txt", '\t', header=true)

# ╔═╡ da7dfe82-0f4f-4015-a945-48aa7a925714
readdlm("ScotlandSun.txt", '\t', header=true, skipstart=5)

# ╔═╡ b69d4ef0-1a96-4461-b676-a947ff2a6805
readdlm("ScotlandSun.txt", ' ', header=true, skipstart=5)

# ╔═╡ f074790a-ffc1-4f06-9068-29f3337313b7
readdlm("ScotlandSun.txt", header=true, skipstart=5)

# ╔═╡ 8a294070-022e-4557-8529-cdb513806b79
begin
	Scot_Sun, Year_Month = readdlm("ScotlandSun.txt", header=true, skipstart=5)
	Scot_Rain, _ = readdlm("ScotlandRain.txt", header=true, skipstart=5)
end

# ╔═╡ 802765fe-3f42-47ec-b676-b62527c6addf
begin
	Scot_Sun_Take2 = readdlm("ScotlandSun.txt", header=true, skipstart=5)
end

# ╔═╡ 29cf15e9-a122-4594-812b-2677996b9a9b
Scot_Sun_Take2[2]

# ╔═╡ 27dfb977-2e6c-43a3-9f56-8684689c6be1
Scot_Sun

# ╔═╡ a9b4c98e-e89b-4d27-9daa-7f53318f3b1b
# Here we want to plot the average sunshiine in Scotland in January from the beginning of the record.
# We are going to overlay the plot for January with the plot for May.

begin
	plot(Scot_Sun[:,1], Scot_Sun[:,2], label="january", lw=3)
	plot!(Scot_Sun[1:end-1,1], Scot_Sun[1:end-1,6], label = "May", lw = 3)
end

# ╔═╡ 6794ea21-04be-4897-a646-5c9053305777
# Here we want to plot multiple lines in our plot corresponding to columns in a matrix/array.

# Here we use the function 'float' to convert the array section into numbers
plot(Scot_Sun[1:end-1,1], float.(Scot_Sun[1:end-1,2:7]), lw=3)

# ╔═╡ 84cbf844-5a0c-42b5-a592-5cda92d452c8
g = 7

# ╔═╡ 8fedbbd4-4b76-4202-a2af-000d11286525
float(g)

# ╔═╡ 62233778-aaf2-43a5-ba79-0dc6df61fae9
float.(Scot_Rain[1:end-1,[2,3,12,13]])

# ╔═╡ 99e19ffe-4f3f-451f-b70d-b67794ff1790
# The example demonstrates that we need to use dot notation when applying a function to each value in a collection.

begin
	Average_Winter_Rain = mean(float.(Scot_Rain[1:end-1,[2,3,12,13]]), dims=2)
	Average_Summer_Rain = mean(float.(Scot_Rain[1:end-1,6:9]), dims=2)
end

# ╔═╡ ee44190f-c43a-49e6-94ca-a4fdc942aab8
Average_Winter_Rain

# ╔═╡ c828beb9-c8b2-4046-879d-3e6ceb8524fa
scatter(Average_Winter_Rain, Average_Summer_Rain, marker=:square, hover=Scot_Rain[1:end-1])

# ╔═╡ dffc07da-2cb6-4d66-aeb6-a6bdac0fac8a
xlabel!("Winter Rain")

# ╔═╡ 5839a26a-ce28-4ba8-a47b-92fa152e1f47
ylabel!("Summer Rain")

# ╔═╡ 8ccb4838-9335-40a3-85f9-feddd106bb05
kurtosis(Average_Winter_Rain)

# ╔═╡ 5d6110b1-a9fd-4a33-b948-ff4d7635262e
skewness(Average_Winter_Rain)

# ╔═╡ dc526d28-126d-43fb-bbab-52583a4065cd
Random_Data, _ = readdlm("RandomData.txt", header=true)

# ╔═╡ f09f7a94-6016-4ed0-a28d-5dc61cf469e5
RandomData = float.(Random_Data[:,1:2])

# ╔═╡ 64cb6d33-c332-4225-a58d-860d11567d62
Random_Data[:,1]

# ╔═╡ 1c51ee9d-6539-4d77-92a3-e746159c7940
Hist1 = fit(Histogram, RandomData[:,1])

# ╔═╡ 311a2e58-f62c-4802-94e8-6a1cadd9482b
Hist2 = fit(Histogram, RandomData[:,2])

# ╔═╡ 3a250b90-5b87-4a6a-857d-84ff99dab1d2
begin
	plot(Hist1, color="red")
	plot!(Hist2, color="green", alpha=.5)	
end

# ╔═╡ 8dfcd3fd-0602-4c5a-8163-167f58679831
begin
	plot(normalize(Hist1, mode=:density), color="red")
	plot!(normalize(Hist2, mode=:density), color="green", alpha=.5)	
end

# ╔═╡ e012e266-f54d-4ad2-811c-4e7446f962e7
SetA = Set(rand(1:100,20))

# ╔═╡ ebb0f63e-54bb-4fac-b5b7-6067b4895d0c
SetB = Set(rand(1:30,10))

# This is a set of 10 random integers between 1 and 30

# ╔═╡ 77b5793b-7b63-45d4-acdc-c20afc9a57e3
SetA ∪ SetB

# ╔═╡ 7a004893-c354-498b-be03-cabb0c0c7d8a
SetA ∩ SetB

# ╔═╡ c5c386a5-44d9-45c4-80f7-99b77508933c


# ╔═╡ 0ffe5018-e652-40df-8489-b7dee1c06ba8
import RDatasets

# ╔═╡ 1f7a5ea5-bea1-40ee-a6c0-e304391893c4
begin
	x = randn(1024)
	y = randn(1024)
	marginalkde(x, x+y)
end

# ╔═╡ ea5139a6-6001-45c0-9cdc-74328bff2029
begin 
singers = RDatasets.dataset("lattice", "singer")
@df singers violin(string.(:VoicePart), :Height, linewidth=0)
@df singers boxplot!(string.(:VoicePart), :Height, fillalpha=0.75, linewidth=2)
@df singers dotplot!(string.(:VoicePart), :Height, marker=(:black, stroke(0)))
end

# ╔═╡ 601fff6b-3e89-4d40-8047-e21860edd861
NaN()

# ╔═╡ Cell order:
# ╠═2b77c301-778a-4e7d-b176-194362ebec5e
# ╠═d58cad3e-a866-4e0e-8f29-821188861a12
# ╠═1cd6f911-7cca-4e14-9a0e-0885902df8d1
# ╠═6e208bb6-d207-480f-b970-80787ca2f41f
# ╠═487fc300-e3a2-40ed-aa37-d19ae5ab96f7
# ╠═d64b24bf-34ca-4f36-8ab4-ed41b4f1d503
# ╠═4ffbf08e-cac5-44ad-bc51-af7a66e73216
# ╠═c14d4afc-1473-4e1e-ac37-ef0277877843
# ╠═d18c09d8-38de-40a6-ae5a-ac36b6d28bd6
# ╠═d2854616-0a18-4206-bebb-db0d813d223e
# ╠═8b697e3b-0849-4c6c-8b16-9f5a08d0e00a
# ╠═da7dfe82-0f4f-4015-a945-48aa7a925714
# ╠═b69d4ef0-1a96-4461-b676-a947ff2a6805
# ╠═f074790a-ffc1-4f06-9068-29f3337313b7
# ╠═8a294070-022e-4557-8529-cdb513806b79
# ╠═802765fe-3f42-47ec-b676-b62527c6addf
# ╠═29cf15e9-a122-4594-812b-2677996b9a9b
# ╠═27dfb977-2e6c-43a3-9f56-8684689c6be1
# ╠═a9b4c98e-e89b-4d27-9daa-7f53318f3b1b
# ╠═6794ea21-04be-4897-a646-5c9053305777
# ╠═84cbf844-5a0c-42b5-a592-5cda92d452c8
# ╠═8fedbbd4-4b76-4202-a2af-000d11286525
# ╠═62233778-aaf2-43a5-ba79-0dc6df61fae9
# ╠═99e19ffe-4f3f-451f-b70d-b67794ff1790
# ╠═ee44190f-c43a-49e6-94ca-a4fdc942aab8
# ╠═c828beb9-c8b2-4046-879d-3e6ceb8524fa
# ╠═dffc07da-2cb6-4d66-aeb6-a6bdac0fac8a
# ╠═5839a26a-ce28-4ba8-a47b-92fa152e1f47
# ╠═8ccb4838-9335-40a3-85f9-feddd106bb05
# ╠═5d6110b1-a9fd-4a33-b948-ff4d7635262e
# ╠═dc526d28-126d-43fb-bbab-52583a4065cd
# ╠═f09f7a94-6016-4ed0-a28d-5dc61cf469e5
# ╠═64cb6d33-c332-4225-a58d-860d11567d62
# ╠═1c51ee9d-6539-4d77-92a3-e746159c7940
# ╠═311a2e58-f62c-4802-94e8-6a1cadd9482b
# ╠═3a250b90-5b87-4a6a-857d-84ff99dab1d2
# ╠═8dfcd3fd-0602-4c5a-8163-167f58679831
# ╠═e012e266-f54d-4ad2-811c-4e7446f962e7
# ╠═ebb0f63e-54bb-4fac-b5b7-6067b4895d0c
# ╠═77b5793b-7b63-45d4-acdc-c20afc9a57e3
# ╠═7a004893-c354-498b-be03-cabb0c0c7d8a
# ╠═7679cb94-d070-400a-8e3d-552b23c1ca2b
# ╠═c5c386a5-44d9-45c4-80f7-99b77508933c
# ╠═0ffe5018-e652-40df-8489-b7dee1c06ba8
# ╠═1f7a5ea5-bea1-40ee-a6c0-e304391893c4
# ╠═ea5139a6-6001-45c0-9cdc-74328bff2029
# ╠═601fff6b-3e89-4d40-8047-e21860edd861
